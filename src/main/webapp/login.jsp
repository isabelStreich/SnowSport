<%-- 
    Document   : login
    Created on : Jan. 16, 2020, 10:39:37 a.m.
    Author     : ybenhail
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Login page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>

        <c:set var="x" value="0"></c:set>
        <c:forEach items="${panierList }" var="i">
            <c:set var="x" value="${x+1 }"></c:set>
        </c:forEach>

        <header>
            <h1>
                SnowSport
            </h1>
            <nav>
                <ul>
                    <li><a href="controllerServlet?page=index">Accueil</a></li>
                        <c:choose>
                            <c:when test="${session == null}">
                            <li><a href="controllerServlet?page=login">Se connecter</a></li>
                            <li><a href="controllerServlet?page=sign-up">S'enregistrer</a></li>
                            </c:when>
                            <c:when test="${session != null}">
                            <li><a href="controllerServlet?page=logout" style="color: #F24638;">Se déconnecter</a></li>
                            <li><a href="#">Mon Compte</a></li>
                            </c:when>
                        </c:choose>
                    <li><a href="controllerServlet?page=showcart">Panier(<c:out value="${x}"/>)</a></li>
                </ul>
            </nav>
        </header>

        <div class="signup-header">
            <h2>Se connecter a <mark>SnowSport</mark></h2>
        </div>

        <form method="post" action="controllerServlet">

            <input type="hidden" name="page" value="login-form">

            <!-- Validations errors -->
            <font color="#F24638"><c:out value="${msg }"></c:out></font>

                <div class="signup-group">
                    <label>Nom utilisateur</label>
                    <input type="text" name="username" placeholder="votre nom d'utilisateur" value="<c:out value="${username }"></c:out>">
            </div>
            <div class="signup-group">
                <label>Mot de Passe</label>
                <input type="password" name="password" placeholder="votre Mot de Passe">
            </div>
            <div class="signup-group">
                <button type="submit" name="login" class="signup-btn">Se connecter</button>
            </div>
            <p>
                Créer un compte A SnowSport <a href="controllerServlet?page=sign-up" style="color:#F24638;">Créer un compte</a>
            </p>
        </form>
        <br><br><br>
        <footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
            <div class="footer"> 
                <a href="controllerServlet?page=index"> SnowSport.com</a>
            </div>
        </footer>


    </body>
</html>