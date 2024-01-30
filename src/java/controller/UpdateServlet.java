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

@WebServlet(name = "UpdateServlet", urlPatterns = {"/update"})
public class UpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("job_id");
        int id;
        DAO d = new DAO();
        try {
            id = Integer.parseInt(id_raw);
            Job j = d.getJobById(id);
            request.setAttribute("job", j);
            request.getRequestDispatcher("update.jsp").forward(request, response);
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String requirements = request.getParameter("requirements");
        String location = request.getParameter("location");
        String salary_raw = request.getParameter("salary");
        String company_name = request.getParameter("company_name");
        String date_posted = request.getParameter("date_posted");
        DAO d = new DAO();
        int id;
        double salary;
        try {
            id = Integer.parseInt(id_raw);
            salary = Double.parseDouble(salary_raw);
            Job jobNew = new Job(id, title, description, requirements, location, salary, company_name, date_posted);
            d.updateJob(jobNew);
            response.sendRedirect("ListJob");
        } catch (NumberFormatException e) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
