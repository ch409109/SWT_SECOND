<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Jobs</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }
            h1 {
                text-align: center;
            }
            table {
                width: 80%;
                margin: 0 auto;
                background-color: #fff;
                border-collapse: collapse;
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #333;
                color: #fff;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .navbar {
                height: 50px;
                display: flex;
                justify-content: space-between;
                background-color: #333;
                color: #fff;
                padding: 10px;
                align-items: center;
            }

            .navbar a {
                color: #fff;
                text-decoration: none;
                margin-left: 40px
            }

            .navbar .right-buttons a {
                color: #fff;
                text-decoration: none;
                margin: 0 10px;
                background-color: #d9534f;
                border-radius: 5px;
                border: 10px solid #d9534f;
            }

            .right-buttons a#p {
                background-color: #d9534f;
            }

            .search-bar input[type="text"] {
                width: 200px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-right: 10px;
                font-size: 16px;
                outline: none;
            }

            .search-bar input[type="text"]:focus {
                border-color: #007bff;
            }

            .search-bar input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            .search-bar input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .search-center {
                text-align: center;
                margin-top: 20px;
                margin-bottom: 20px;
            }

            .button-container {
                display: flex;
                justify-content: space-between;
            }

            .button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                text-align: center;
                text-decoration: none;
            }

            .update-button {
                background-color: #5bc0de;
                color: #fff;
            }

            .delete-button {
                background-color: #d9534f;
                color: #fff;
            }

            .button-container {
                margin: 5px 0;
                text-align: center;
            }
        </style>
        <script type="text/javascript">
            function doDelete(job_id) {
                if (confirm("Do you want to delete this job?")) {
                    window.location = "delete?job_id=" + job_id;
                }
            }
        </script>
    </head>
    <body>
        <div class="navbar">  
            <div>
                <a class ="right" href="#">About</a>
                <a class = "right"href="#">Contact</a>
            </div>
            <a href="home">Home</a>
            <div class="right-buttons">
                <a href="add">Post a job</a>   
                <a href="ListJob" >Want a job</a>
            </div>
        </div>

        <div class="search-bar search-center"">
            <form action="search">
                <input type="text" name="title" placeholder="Title"/>
                <input type="text" name="location" placeholder="Location"/>
                <input type="submit" value="Search"/>
            </form>
        </div>

    <center>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Requirements</th>
                    <th>Location</th>
                    <th>Salary</th>
                    <th>Company Name</th>
                    <th>Date Posted</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.jobs}" var="j">
                    <tr>
                        <td>${j.job_id}</td>
                        <td>${j.title}</td>
                        <td>${j.description}</td>
                        <td>${j.requirements}</td>
                        <td>${j.location}</td>
                        <td>${j.salary}</td>
                        <td>${j.company_name}</td>
                        <td>${j.date_posted}</td>
                        <td>
                            <div class="button-container">
                                <a class="button update-button" href="update?job_id=${j.job_id}">Update</a>
                            </div>
                            <div class="button-container">
                                <a class="button delete-button" href="#" onclick="doDelete('${j.job_id}')">Delete</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </center>
</body>
</html>
