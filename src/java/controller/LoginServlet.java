package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Job;
import model.User;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String u = request.getParameter("username");
        String p = request.getParameter("password");
        String r = request.getParameter("remember");

        Cookie cu = new Cookie("cUser", u);
        Cookie cp = new Cookie("cPass", p);
        Cookie cr = new Cookie("cRem", r);

        if (r != null) {
            cu.setMaxAge(60 * 60 * 24 * 6); // 7 Days
            cp.setMaxAge(60 * 60 * 24 * 6);
            cr.setMaxAge(60 * 60 * 24 * 6);
        } else {
            cu.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }

        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);

        DAO d = new DAO();
        List<Job> listJob = d.getAllJob();
        request.setAttribute("listJob", listJob);
        User user = d.check(u, p);
        if (user == null) {
            request.setAttribute("error", "This account is invalid!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            session.setAttribute("account", user);
            session.setAttribute("userRole", user.getRole());
            response.sendRedirect("home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
