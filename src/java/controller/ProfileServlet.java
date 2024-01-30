package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO d = new DAO();
        String action = request.getParameter("action");
        String value = request.getParameter("value");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");
        switch (action) {
            case "Rename":
                if (d.updateUser("full_name", value, user.getUsername())) {
                    request.setAttribute("mess", "Rename successfully!");
                }
                break;
            case "Update Email":
                if (d.updateUser("email", value, user.getUsername())) {
                    session.setAttribute("user", user);
                    request.setAttribute("mess", "Update email successfully!");
                }
                break;
            case "Update Phone":
                if (d.updateUser("phone", value, user.getUsername())) {
                    session.setAttribute("user", user);
                    request.setAttribute("mess", "Update phone successfully!");
                }
                break;
            case "Change":
                String pass = request.getParameter("password");
                String cfpass = request.getParameter("cfpassword");
                if (pass.equals(cfpass)) {
                    if (d.updateUser("password", value, user.getUsername())) {
                        session.setAttribute("user", user);
                        request.setAttribute("mess", "Change password successfully!");
                    }
                } else {
                    request.setAttribute("mess", "Password do not match");
                }
                break;
            default:
                break;
        }
        user = d.getUserByUsername(user.getUsername());
        session.setAttribute("account", user);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
