package servlet;

import meneger.GenreManager;
import meneger.MovieMeneger;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = ("/home"))
public class HomeServlet extends HttpServlet {
    MovieMeneger movieMeneger = new MovieMeneger();
    GenreManager genreManager = new GenreManager();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setAttribute("allFilms",movieMeneger.getAllMovies());
//        req.setAttribute("allGenres",genreManager.getAllGenre());
//        System.out.println(genreManager.getAllGenre());
//        req.getRequestDispatcher("/WEB-INF/home.jsp").forward(req, resp);

        req.setAttribute("allGenres", genreManager.getAllGenre());
        req.setAttribute("allMovie", movieMeneger.getAllMovies());
        req.getRequestDispatcher("/WEB-INF/home.jsp").forward(req, resp);
    }
}
