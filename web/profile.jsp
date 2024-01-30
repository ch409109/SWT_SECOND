<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <style>
            body {
                background-repeat: no-repeat;
                background-image: url(images/kerosene.jpg);
                background-size: cover;
                font-family: Arial, sans-serif;
                text-align: center;
                margin: 0;
                padding: 0;
            }
            .container {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .error-image {
                max-width: 60%;
                height: auto;
                margin-bottom: 20px;
            }
            .error-message {
                font-size: 24px;
                margin-top: 20px;
            }
            .login-link {
                text-decoration: none;
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border-radius: 5px;
                font-weight: bold;
                margin-top: 20px;
                transition: background-color 0.3s;
            }
            .login-link:hover {
                background-color: #0056b3;
            }
            .table-container {
                margin-top: 20px;
                width: 80%;
                margin: 0 auto;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                border: 1px solid #ddd;
                background-color: #fff;
            }
            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: midnightblue;
                color: #fff;
            }
            td a {
                text-decoration: none;
                color: #007bff;
            }
            button {
                background-color: midnightblue;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            button:hover {
                background-color: #0056b3;
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
        </style>
    </head>
        <body>
            <c:set var="cookie" value="${pageContext.request.cookies}" />

            <div class="navbar">  
                <a href="home">Back to home</a>
            </div>

            <c:if test="${sessionScope.account == null}">
                <div class="container">
                    <p class="error-message">Sorry, you may not be logged in.</p>
                    <a href="login" class="login-link">Login Now</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.account != null}">
                <h2>Have a good day, ${sessionScope.account.full_name}!</h2>
                <h2>Personal Information</h2>

                <table border="0" class="table-container">
                    <tr>
                        <th>Full name</th>
                        <td>${sessionScope.account.full_name}</td>
                        <td><a href="#" onclick="showForm('renameForm')" style="text-decoration: none; color: #007bff">Rename</a></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>
                            <c:choose>
                                <c:when test="${not empty sessionScope.account.email}">
                                    ${sessionScope.account.email}
                                </c:when>
                                <c:otherwise>
                                    No information.
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><a href="#" onclick="showForm('updateEmailForm')" style="text-decoration: none; color: #007bff">Update Email</a></td>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <td>
                            <c:choose>
                                <c:when test="${not empty sessionScope.account.phone}">
                                    ${sessionScope.account.phone}
                                </c:when>
                                <c:otherwise>
                                    No information
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><a href="#" onclick="showForm('updatePhoneForm')" style="text-decoration: none; color: #007bff">Update Phone Number</a></td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td id="password">********
                            <button onclick="showPassword()">Show</button>
                        </td>
                        <td><a href="#" onclick="showForm('changePasswordForm')" style="text-decoration: none; color: #007bff">Change Password</a></td>
                    </tr>
                </table>
                <br>
            </c:if>

            <form action="profile" method="POST" id="renameForm" style="display: none;">
                <input type="text" name="value" placeholder="Enter name">
                <input type="submit" name="action" value="Rename">
            </form>

            <form action="profile" method="POST" id="updateEmailForm" style="display: none;">
                <input type="email" name="value" placeholder="Enter email">
                <input type="submit" name="action" value="Update Email">
            </form>

            <form action="profile" method="POST" id="updatePhoneForm" style="display: none;">
                <input type="text" name="value" placeholder="Enter phone number">
                <input type="submit" name="action" value="Update Phone">
            </form>

            <form action="profile" method="POST" id="changePasswordForm" style="display: none;">
                <input type="password" name="password" placeholder="Enter password">
                <input type="password" name="cfpassword" placeholder="Confirm password">
                <input type="submit" name="action" value="Change">
            </form>

            <script>
                function showPassword() {
                    var passwordInput = prompt("Enter password:");
                    var correctPassword = "${sessionScope.account.password}";
                    if (passwordInput === correctPassword) {
                        var passwordElement = document.getElementById("password");
                        passwordElement.textContent = correctPassword;
                    } else {
                        alert("Incorrect password.");
                    }
                }

                function showForm(formId) {
                    hideAllForms();
                    var form = document.getElementById(formId);
                    form.style.display = "block";
                }

                function hideAllForms() {
                    var forms = document.querySelectorAll("form");
                    for (var i = 0; i < forms.length; i++) {
                        forms[i].style.display = "none";
                    }
                }
            </script>
        </body>
</html>
