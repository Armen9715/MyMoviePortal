package meneger;

import db.DBConnectionProvider;
import model.Genre;
import model.Movie;
import util.DateUtil;


import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;


public class MovieMeneger {

    private Connection connection;

    public MovieMeneger() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }


    public void addMovie(Movie movie) {

        String query = "INSERT INTO movies(`name`,`description`,`createdDate`,`picture`,`year`,`director`,`user`)" + " VALUES(?,?,?,?,?,?,?);";
        try {
            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, movie.getName());
            statement.setString(2, movie.getDescription());
            statement.setString(3, DateUtil.convertDateToString(movie.getCreatedDate()));
            statement.setString(4, movie.getPicture());
            statement.setString(5, movie.getYear());
            statement.setString(6, movie.getDirector());
            statement.setLong(7, movie.getUser().getId());


            statement.executeUpdate();
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int id = generatedKeys.getInt(1);
                movie.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    public void addRelationshipTable(Movie movie, List<Genre> genre) {
        String query = "INSERT INTO movie_and_genre(movie_id, genre_id) VALUES (?,?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            for (Genre genreList : genre) {
                int genreId = genreList.getId();
                preparedStatement.setInt(1, movie.getId());
                preparedStatement.setInt(2, genreId);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<Movie> getAllMovies() {
        UserManager userManager = new UserManager();
        GenreManager genreManager = new GenreManager();
        try {
            Statement statement = connection.createStatement();
            String query = "SELECT * FROM movies";
            ResultSet resultSet = statement.executeQuery(query);
            List<Movie> movies = new ArrayList<Movie>();
            while (resultSet.next()) {
                Movie movie = new Movie();
                movie.setId(resultSet.getInt(1));
                movie.setName(resultSet.getString(2));
                movie.setDescription(resultSet.getString(3));
                movie.setCreatedDate(DateUtil.convertStringToDate(resultSet.getString(4)));
                movie.setPicture(resultSet.getString(5));
                movie.setYear(resultSet.getString(6));
                movie.setDirector(resultSet.getString(7));
                List<Integer> genresIdByMovieId = genreManager.getGenreIdByMovieId(movie.getId());
                List<Genre> genres = new ArrayList<Genre>();

                for (Integer id : genresIdByMovieId) {
                    genres.add(genreManager.getGenreById(id));
                }
                movie.setUser(userManager.getUserById(resultSet.getInt(8)));
                movie.setGenre(genres);
                movies.add(movie);
            }
            return movies;


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Integer> getMovieIDByGenreID(int id) {
        try {

            String query = "SELECT movie_id AS id  FROM movieGenres WHERE genres_id=" + id;

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<Integer> moviesId = new ArrayList<Integer>();
            while (resultSet.next()) {
                int movID = resultSet.getInt(1);
                moviesId.add(movID);
            }

            return moviesId;
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return null;


    }

    public Movie getMovieById(int id) {
        try {
            String query = "SELECT * FROM movies WHERE `id` = " + id;
            Statement statement = connection.createStatement();
            UserManager userManager = new UserManager();
            GenreManager genreManager = new GenreManager();
            List<Genre> genres = new ArrayList<Genre>();
            ResultSet resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                Movie movie = new Movie();
                movie.setId(resultSet.getInt(1));
                movie.setName(resultSet.getString(2));
                movie.setDescription(resultSet.getString(3));
                movie.setCreatedDate(DateUtil.convertStringToDate(resultSet.getString(4)));
                movie.setPicture(resultSet.getString(5));
                movie.setYear(resultSet.getString(6));
                movie.setDirector(resultSet.getString(7));
                movie.setUser(userManager.getUserById(resultSet.getInt(8)));
                List<Integer> genresIdByMoveId = genreManager.getGenreIdByMovieId(movie.getId());
                for (Integer genreId : genresIdByMoveId) {
                    genres.add(genreManager.getGenreById(genreId));
                }
                movie.setGenre(genres);
                return movie;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}







