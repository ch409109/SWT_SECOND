<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <style>
            body{
                background-image: url(images/background.jpg);
                background-size: cover;
                font-family: Arial, sans-serif;
                text-align: center;
                margin: 0;
                padding: 0;
            }
        </style>
    </head>
    <body>
        <c:set var="cookie" value="${pageContext.request.cookies}"/>
        <form action="login" method="post">
            <h1 id="login-heading">User Login</h1>
            <h3 style="color: red">${requestScope.error}</h3>
            <div class="form-fields">
                Username: <input type="text" name="username" value="${cookie.cUser.value}"/><br/>
                Password: <input type="password" name="password" value="${cookie.cPass.value}"/><br/>
            </div>
            <div class="remember-me">
                <input type="checkbox" name="remember" id="remember" ${(cookie.cRem!=null?'checked':'')}/>
                <label for="remember">Remember me</label>
            </div>
            <input type="submit" value="LOGIN"/>
            <p>Not registered? <a href="register">Create an account</a></p>
        </form>

    </body>
</html>
