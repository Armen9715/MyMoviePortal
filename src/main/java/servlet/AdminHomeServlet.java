package servlet;

import meneger.GenreManager;
import meneger.MovieMeneger;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin/home")
public class AdminHomeServlet extends HttpServlet {
    GenreManager genreManager = new GenreManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User admin = (User) req.getSession().getAttribute("admin");
        req.getSession().setAttribute("admin",admin);
        req.setAttribute("allGenres", genreManager.getAllGenre());
        req.getRequestDispatcher("/WEB-INF/admin/adminHome.jsp").forward(req, resp);
    }
}
