<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post a job</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <style>
            body {
                background-image: url(images/background.jpg);
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <form action="add" method="post">
            <h1 id="login-heading">Post a Job</h1>
            <h3 style="color: red">${requestScope.error}</h3>
            <h3 style="color: aqua">${requestScope.message}</h3>
            <div class="form-fields">
                <input type="text" name="id" placeholder="ID"/><br/>
                <input type="text" name="title" placeholder="Title"/><br/>
                <input type="text" name="description" placeholder="Description"/><br/>
                <input type="text" name="requirements" placeholder="Requirements"/><br/>
                <input type="text" name="location" placeholder="Location"/><br/>
                <input type="text" name="salary" placeholder="Salary"/><br/>
                <input type="text" name="company_name" placeholder="Company Name"/><br/>
                <input type="text" name="date_posted" placeholder="Date Posted"/><br/>
            </div>
            <input type="submit" value="POST"/>
            <a href="home" style="text-decoration: none">Back to Home</a>
        </form>
        <br/>   
    </body>
</html>
