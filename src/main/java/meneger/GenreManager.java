package meneger;

import db.DBConnectionProvider;
import model.Genre;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GenreManager {
   private static Connection connection;

    public GenreManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }

    public void addGenre(Genre genre) {


        try {
            Statement statement = connection.createStatement();
            String query = "INSERT INTO genre(`name`) " +
                    "VALUES('" + genre.getName() + "');";
            System.out.println("executing following statement >" + query);
            statement.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int id = generatedKeys.getInt(1);
                genre.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


}

    public Genre checkGenreName(String name){

        try {
            Statement statement = connection.createStatement();
            String query = "SELECT * FROM genres";
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()){
                Genre genre = new Genre();
                genre.setId(resultSet.getInt(1));
                genre.setName(resultSet.getString(2));

                if (genre.getName().equals(name)){
                    return genre;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;

    }

    public Genre getGenreByName(String name){
        String query="SELECT *FROM genre Where name='"+name+"'";
    try {
        Statement statement=connection.createStatement();
        ResultSet resultSet=statement.executeQuery(query);
        if (resultSet.next()){
            Genre genre=new Genre();
            genre.setId(resultSet.getInt(1));
            genre.setName(resultSet.getString(2));
            return genre;




        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
return null;

}

    public Genre getGenreById(int id){
        String query="SELECT *FROM genre Where id='"+id+"'";
        try {
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(query);
            if (resultSet.next()){
                Genre genre=new Genre();
                genre.setId(resultSet.getInt(1));
                genre.setName(resultSet.getString(2));
                return genre;




            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public List<Genre> getAllGenre(){
        String query = "SELECT * FROM genre";
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<Genre> genres=new ArrayList<Genre>();
            while (resultSet.next()){
                Genre genre=new Genre();
                genre.setId(resultSet.getInt(1));
                genre.setName(resultSet.getString(2));
                genres.add(genre);
            }
            return genres;



        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Integer>  getGenreIdByMovieId(long id) {
        try {
            Statement statement = connection.createStatement();
            String query = "SELECT genre_id FROM movie_and_genre WHERE movie_id = " + id;
            ResultSet resultSet = statement.executeQuery(query);
            List<Integer> genresId = new ArrayList<Integer>();
            while (resultSet.next()) {
                genresId.add(resultSet.getInt(1));
            }
            return genresId;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }




}
