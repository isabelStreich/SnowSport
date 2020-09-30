<%-- 
    Document   : Skies
    Created on : Jan. 20, 2020, 9:12:56 p.m.
    Author     : ybenhail
--%>

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
	<c:forEach items="${panierList }" var="i">
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
	
	<div class="snowSport-content">
 	<div class="container">
 		<div class="row">
 				<div class="col-md-4"><!-- left -->
 						<div class="list-group"><!-- products -->
						  <a href="controllerServlet?page=index" class="list-group-item" style="background:  #d6d4d3;">
						    All Products
						  </a>
						  <a href="controllerServlet?page=ski" class="list-group-item">Ski</a>
						  <a href="controllerServlet?page=snowBoards" class="list-group-item">SnowBoards</a>
						  <a href="controllerServlet?page=splitBoards" class="list-group-item">SplitBoards</a>
						  <a href="controllerServlet?page=accessoires" class="list-group-item">Accessoires</a>
						</div> 
 				</div><!-- left -->

 				<div class="col-md-8"><!-- right -->
 					<h2 style="text-align: center;">Accessoires</h2><br>
 					<!-- right 
                                        <h5>Sort by(Price):</h5>
					<form action="Controller" method="get" style="border: none;margin:0px;padding: 0px;margin-bottom: 20px;">
					<input type="hidden" name="page" value="price-sort">
					<input type="hidden" name="action" value="clothing">
					<select name="sort">
					<option value="low-to-high">Low to high</option>
					<option value="high-to-high">high to low</option>
					</select>
					<input type="submit" value="Go!">
					</form>
                                        -->
 					
 					
 					<c:forEach items="${listProduit }" var="produit">
 						
 						<c:if test="${produit.value.getIdCategorie() ==4 }">
 							
		 					<div class="col-md-4">
		 						<img src="${produit.value.getImageProduit()}" class="img-responsive" ><br>
<div class="text-center"><a style="color: black;"><c:out value="${produit.value.getNomProduit() }"></c:out></a></div>	
<p style="text-align: center;">$ <c:out value="${ produit.value.getPrix() }"></c:out></p>
<div class="text-center">  <a class="btn btn-primary" href="controllerServlet?page=addtocart&action=allproducts&id=<c:out value="${produit.value.getIdProduit()}"/>">Ajouter au panier</a> </div><br>
		 					</div>
 							
 						</c:if>
 						
 						
 					</c:forEach>
 					
 				</div>
 			</div>
 		</div>
 	</div>
	
	
	<footer>
		<div class="footer"> 
	      <a href="Controller?page=index">SnowSport.com</a>
	    </div>
	</footer>
	
</body>
</html>