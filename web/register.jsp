<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style>
            body {
                background-size: cover;
                font-family: sans-serif;
                background-color: #fff;
                background-image: url(images/rainy_day.jpg);
            }
            .register-form {
                width: 500px;
                margin: 100px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #fff;
            }
            .register-form h2 {
                text-align: center;
                font-size: 24px;
                margin-bottom: 20px;
                color: #007bff;
            }
            .register-form input[type=text],.register-form input[type=email],
            .register-form input[type=password] {
                width: 95%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .register-form input[type=submit] {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            a {
                color: #0073e6;
                text-decoration: none;
                font-weight: bold;
            }

            a:hover {
                text-decoration: underline;
            }
            h2 {
                font-size: 20px;
                text-transform: uppercase;
                font-weight: bold;
                text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2);
                color: #0073e6;
            }
        </style>
    </head>
    <body >
        <div class="register-form">
            <h2>Register Form</h2>
            <h3 style="color: red">${requestScope.error}</h3>
            <h3 style="color: aqua">${requestScope.message}</h3>
            <form action="register" method="POST">
                <input type="text" placeholder="Username" required name="username">
                <input type="password" placeholder="Password" required name="password">
                <input type="password" placeholder="Confirm Password" required name="cfpassword">
                <input type="text" placeholder="Fullname" required name="fullname">
                <input type="email" placeholder="Email" required name="email">
                <input type="text" placeholder="Phone" required name="phone">
                <input type="text" placeholder="Role" required name="role">
                <input type="submit" value="Register now">
            </form>
            <br/>
            <a href="login" style="text-decoration: none">Back to Login</a>
        </div>
    </body>
</html>