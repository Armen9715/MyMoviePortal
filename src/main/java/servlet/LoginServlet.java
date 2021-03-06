package servlet;


import meneger.UserManager;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    UserManager userManager = new UserManager();


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = userManager.getUserByEmailAndPassword(email, password);
        if (user.getPassword() != null && user.getEmail() !=null) {
            req.getSession().setAttribute("admin", user);
            req.getRequestDispatcher("/admin/home").forward(req, resp);
        } else {
            resp.sendRedirect("/home");
        }
    }
}
