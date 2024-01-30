<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Job Portal</title>
        <style>
            body {
                margin: 0;
                padding: 0;
            }
            .navbar {
                height: 50px;
                display: flex;
                justify-content: center;
                background-color: #fff;
                color: #000;
                padding: 10px;
                align-items: center;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 100;
            }

            .navbar a {
                color: #000;
                text-decoration: none;
                margin-left: 40px;
                font-weight: bold;
            }

            .search-bar {
                text-align: center;
                margin: 20px;
            }

            .search-input {
                width: 400px;
                padding: 10px;
            }

            .search-button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
            }

            .content {
                text-align: center;
                padding: 20px;
            }

            .navbar .right-buttons {
                margin-left: 500px;
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

            .search-bar {
                text-align: center;
                margin: 20px;
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

            body {
                text-align: center;
                padding: 20px;
                background-image: url(images/home_background.png);
                background-size: cover;
                background-position: center;
                color: #fff;
                background-repeat: no-repeat;
            }

            .footer {
                background-color: #333; /* Màu nền của footer */
                color: #fff; /* Màu chữ trên footer */
                text-align: center;
                padding: 20px;
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
            }

            .footer p {
                margin: 5px 0; 
                font-size: 16px; 
            }
        </style>
    </head>
    <body>
        <div class="navbar">  
            <div>
                <a class="right" href="">About</a>
                <a class="right" href="contact.html">Contact</a>
            </div>
            <a href="home">Home</a>
            <a href="ListJob">Jobs</a>
            <div class="right-buttons">
                <% if ((boolean) request.getAttribute("loggedIn")) { %>
                <a href="logout">Logout</a>
                <a href="profile">Profile</a>
                <% } else { %>
                <a href="login">Login</a>
                <a href="register">Register</a>
                <% } %>
            </div>
        </div>
        <div class="content">
        </div>

        <div class="footer">
            <p>&copy; 2023 Job Portal</p>
            <p>Contact: conghthe172673@fpt.edu.vn</p>
            <p>Address: 123 Main Street, Hanoi, Vietnam</p>
        </div>


    </body>
</html>

