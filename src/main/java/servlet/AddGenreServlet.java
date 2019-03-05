package servlet;

import meneger.GenreManager;
import model.Genre;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.net.URL;

@WebServlet(urlPatterns = ("/addGenreServlet"))
public class AddGenreServlet extends HttpServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("genre");
        Genre genre = new Genre();
        genre.setName(name);
        GenreManager genreManager = new GenreManager();

        genreManager.addGenre(genre);

        req.setAttribute("allGenres", genreManager.getAllGenre());
        req.getRequestDispatcher("/admin/home").forward(req, res);
    }
}
