package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Job;

@WebServlet(name = "AddServlet", urlPatterns = {"/add"})
public class AddServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO d = new DAO();
        String id_raw = request.getParameter("id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String requirements = request.getParameter("requirements");
        String location = request.getParameter("location");
        String salary_raw = request.getParameter("salary");
        String companyName = request.getParameter("company_name");
        String datePosted = request.getParameter("date_posted");
        int id;
        double salary;
        try {
            id = Integer.parseInt(id_raw);
            salary = Double.parseDouble(salary_raw);
            Job j = d.getJobById(id);
            if(j == null) {
                Job newJob = new Job(id, title, description, requirements, location, salary, companyName, datePosted);
                d.insertJob(newJob);
                request.setAttribute("message", "Posted successfully!");
                request.getRequestDispatcher("add.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Job is invalid!");
                request.getRequestDispatcher("add.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
