<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Sign up page</title>
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
            <h2>Bienvennu A SnowSport</h2>
        </div>

        <form method="post" action="controllerServlet">

            <input type="hidden" name="page" value="sign-up-form">

            <!-- Validations errors -->
            <font color="#F24638"><c:out value="${msg }"></c:out></font>


                <div class="signup-group">
                    <label>Nom :</label>
                    <input type="text" name="name" placeholder="Votre nom complet" value="<c:out value="${name }"></c:out>" required>
                </div>
                <div class="signup-group">
                    <label>Email</label>
                    <input type="email" name="email" placeholder="Votre adresse email" value="<c:out value="${email }"></c:out>" required>
                </div>
                <div class="signup-group">
                    <label>Nom d'utilisateur</label>
                    <input type="text" name="username" placeholder="Votre nom d'utilisateur" value="<c:out value="${username }"></c:out>" required>
                </div>

               
            <div class="signup-group">
                <label>Mot de Passe </label>
                <input type="password" name="password_1" placeholder="Entrez votre Mot de Passe" required>
            </div>
            <div class="signup-group">
                <label>Confirmez Mot de Passe</label>
                <input type="password" name="password_2" placeholder="Confirmez votre mot de passe" required>
            </div>

            <div class="signup-group">
                <button type="submit" name="register" class="signup-btn">Creer le compte</button>
            </div>
            <p>
                Vous avez deja un Compte ? <a href="controllerServlet?page=login" style="color:#F24638;">Se connecter</a>
            </p>
        </form>
        <br><br><br>
        <footer>
            <div class="footer"> 
                <a href="controllerServlet?page=index"> SnowSport.com</a>
            </div>
        </footer>

    </body>
</html>