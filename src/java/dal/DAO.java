package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Job;
import model.User;

public class DAO extends DBContext {

    // CHECK LOGIN
    public User check(String username, String password) {
        String sql = "SELECT * FROM [User] WHERE [username] = ? AND [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFull_name(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // GET USER VIA USERNAME
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM [User] WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("username"), rs.getString("password"), rs.getString("full_name"), rs.getString("email"), rs.getString("phone"), rs.getString("role"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // READ ALL JOB
    public List<Job> getAllJob() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM Job";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job j = new Job();
                j.setJob_id(rs.getInt("job_id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setRequirements(rs.getString("requirements"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getDouble("salary"));
                j.setCompany_name(rs.getString("company_name"));
                j.setDate_posted(rs.getString("date_posted"));
                list.add(j);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // INSERT A JOB
    public void insertJob(Job j) {
        String sql = "INSERT INTO Job VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, j.getTitle());
            st.setString(2, j.getDescription());
            st.setString(3, j.getRequirements());
            st.setString(4, j.getLocation());
            st.setDouble(5, j.getSalary());
            st.setString(6, j.getCompany_name());
            st.setString(7, j.getDate_posted());
            st.setInt(8, j.getJob_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // DELETE A JOB
    public void deleteJob(int id) {
        String sql = "DELETE FROM Job WHERE job_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //UPDATE A JOB
    public void updateJob(Job j) {
        String sql = "UPDATE Job\n"
                + "   SET title = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[requirements] = ?\n"
                + "      ,[location] = ?\n"
                + "      ,[salary] = ?\n"
                + "      ,[company_name] = ?\n"
                + "      ,[date_posted] = ?\n"
                + " WHERE job_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, j.getTitle());
            st.setString(2, j.getDescription());
            st.setString(3, j.getRequirements());
            st.setString(4, j.getLocation());
            st.setDouble(5, j.getSalary());
            st.setString(6, j.getCompany_name());
            st.setString(7, j.getDate_posted());
            st.setInt(8, j.getJob_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // INSERT AN USER
    public void insertUser(User u) {
        String sql = "INSERT INTO [User] VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, u.getFull_name());
            st.setString(4, u.getEmail());
            st.setString(5, u.getPhone());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // GET A JOB VIA ID
    public Job getJobById(int id) {
        String sql = "SELECT * FROM Job WHERE job_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Job j = new Job();
                j.setJob_id(rs.getInt("job_id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setRequirements(rs.getString("requirements"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getDouble("salary"));
                j.setCompany_name(rs.getString("company_name"));
                j.setDate_posted(rs.getString("date_posted"));
                return j;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // SEARCH JOB
    public List<Job> searchJob(String key_title, String key_location) {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM Job WHERE 1 = 1";
        if (key_title != null && !key_title.equals("")) {
            sql += " AND title LIKE '%" + key_title + "%'";
        }
        if (key_location != null && !key_location.equals("")) {
            sql += " AND location LIKE '%" + key_location + "%'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Job j = new Job();
                j.setJob_id(rs.getInt("job_id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setRequirements(rs.getString("requirements"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getDouble("salary"));
                j.setCompany_name(rs.getString("company_name"));
                j.setDate_posted(rs.getString("date_posted"));
                list.add(j);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // UPDATE USER
    public boolean updateUser(String field, String value, String username) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET " + field + " = N'" + value + "'\n"
                + " WHERE [username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        User u = d.getUserByUsername("john_doe");
        System.out.println(u.getRole());
    }
}
