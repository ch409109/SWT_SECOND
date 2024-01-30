package model;

public class Application {

    private int id;
    private User user;
    private Job job;
    private String date;

    public Application() {
    }

    public Application(int id, User user, Job job, String date) {
        this.id = id;
        this.user = user;
        this.job = job;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

}
