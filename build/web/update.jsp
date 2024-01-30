<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Job</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <style>
            body {
                background-image: url(images/background.jpg);
                background-size: cover;
            }
            h1 {
                color: #fff; 
            }
            form {
                background-color: rgba(255, 255, 255, 0.5); 
                padding: 20px;
                border-radius: 10px;
            }
            input[type="text"] {
                width: 93%;
                padding: 10px;
                margin: 5px 0;
                border: none;
                border-radius: 5px;
                font-weight: bold;
            }
            input[type="text"]:read-only {
                background-color: #f5f5f5;
                font-weight: bold;
            }
            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }
            a {
                text-decoration: none;
                color: #007bff; 
            }

            .form-controls {
                display: flex;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <form action="update" method="POST">
            <h1>Update Job</h1>
            <c:set var="j" value="${requestScope.job}"/>
            <div class="form-fields">
                <input type="text" name="id" readonly value="${j.job_id}"/><br/>
                <input type="text" name="title" value="${j.title}"/><br/>
                <input type="text" name="description" value="${j.description}"/><br/>
                <input type="text" name="requirements" value="${j.requirements}"/><br/>
                <input type="text" name="location" value="${j.location}"/><br/>
                <input type="text" name="salary" value="${j.salary}"/><br/>
                <input type="text" name="company_name" value="${j.company_name}"/><br/>
                <input type="text" name="date_posted" value="${j.date_posted}"/><br/>
            </div>
            <div class="form-controls">
                <input type="submit" value="Update"/>
            </div>
        </form>
    </body>
</html>
