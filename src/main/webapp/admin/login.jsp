<%-- 
    Document   : login
    Created on : Jan. 27, 2020, 1:45:36 p.m.
    Author     : istreich
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Login Admin</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>

        <div class="signup-header">
            <h2> <mark>Admin</mark> Login</h2>
        </div>

        <form method="post" action="adminController">

            <input type="hidden" name="page" value="admin-login-form">

            <font color="#F24638"><c:out value="${msg }"></c:out></font>

                <div class="signup-group">
                    <label>Nom Utilisateur</label>
                    <input type="text" name="username" placeholder="Votre nom d utilisateur" value="<c:out value="${username }"></c:out>">
            </div>
            <div class="signup-group">
                <label>Mot de passe</label>
                <input type="password" name="password" placeholder="Votre mot de passe">
            </div>
            <div class="signup-group">
                <button type="submit" name="login" class="signup-btn">Log in</button>
            </div>
        </form>
    </body>
</html>
