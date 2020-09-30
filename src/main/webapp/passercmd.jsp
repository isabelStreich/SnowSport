<%-- 
    Document   : passercmd
    Created on : Jan. 29, 2020, 10:08:27 p.m.
    Author     : ybenhail
--%>

<%@page import="manager.MailManager"%>
<%@page import="entities.Produit"%>

<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<c:set var="x" value="0"></c:set>
	<c:forEach items="${panierList}" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>
	
<header>
            <h1>
                SnowSport
            </h1>
            <nav>
                <ul>
                    <li><a href="controllerServlet?page=index">Accuiel</a></li>
                        <c:choose>
                            <c:when test="${session == null}">
                            <li><a href="controllerServlet?page=login">Se connecter</a></li>
                            <li><a href="controllerServlet?page=sign-up">S'enregistrer</a></li>
                            </c:when>
                            <c:when test="${session != null}">
                            <li><a href="controllerServlet?page=logout" style="color: #F24638;">se déconnecter</a></li>
                            <li><a href="#">Mon Compte(<c:out value="${username }"></c:out>)</a></li>
                            </c:when>
                        </c:choose>
                    <li><a href="controllerServlet?page=showcart">Panier(<c:out value="${x}"/>)</a></li>
                </ul>
            </nav>
        </header>
	
	
	
	<c:choose>
		<c:when test="${session == null}">
				<%
				JOptionPane.showMessageDialog(null, "Connectez vous avant de passer la commande", "Info", JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("sinscrire.jsp").forward(request, response);
				%>
		</c:when>
		
		<c:when test="${x == 0}">
				
				<%
				JOptionPane.showMessageDialog(null, "Votre panier est vide", "Info", JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("panier.jsp").forward(request, response);
				%>
		</c:when>
		
		<c:when test="${session != null}">
				
				
				<div class="container" style="margin-top: 60px;margin-bottom: 60px;">
					<h4>Merci <font color="#6bb1f8"><c:out value="${name }"></c:out></font> d'avoir magasiner chez SnowSport.   <font color="#6bb1f8"><c:out value="${address }"></c:out></font> et votre commande sera livrer dans 3 a 4 jours ouvrables.</h4>
					<h4>Vous recevrez un email de confirmation a votre adresse <font color="#6bb1f8"><c:out value="${email }"></c:out></font>.</h4>
                                        <%MailManager.sendEmail("Votre Commande est bien Enregistrer ", (String)session.getAttribute("email"), "Confirmation du Commande  SnowSport"); %>
					<br><br>
					<a href="controllerServlet?page=index"><input type="button" value="Revenir a la page d'accueil" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
				</div>
			
		</c:when>
	
	</c:choose>

	<footer style="position: fixed;bottom: 0;left: 0;width: 100%;">
		<div class="footer"> 
	      <a href="controllerServlet?page=index"> SnowSport.com</a>
	    </div>
	</footer>
</body>
</html>