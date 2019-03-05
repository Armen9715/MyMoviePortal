package servlet;

import meneger.GenreManager;
import meneger.MovieMeneger;
import model.Genre;
import model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/singleMovie")
public class SingleMovieServlet extends HttpServlet {
     MovieMeneger movieMeneger = new MovieMeneger();
     GenreManager genreManager= new GenreManager();

        @Override
        protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String movieId = req.getParameter("movieId");
            int id = Integer.parseInt(movieId);
            Movie movie = movieMeneger.getMovieById(id);
            if (movie != null) {
                req.setAttribute("singleMovie", movie);
                req.setAttribute("movieGenreList", genreManager.getGenreIdByMovieId(movie.getId()));
                req.getRequestDispatcher("/WEB-INF/singleMovie.jsp").forward(req, resp);
            }else{
                resp.sendRedirect("/WEB-INF/home.jsp");
            }
        }
    }
