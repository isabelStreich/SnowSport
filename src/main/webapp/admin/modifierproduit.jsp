<%-- 
    Document   : modifierproduit
    Created on : Jan. 27, 2020, 11:25:17 p.m.
    Author     : ybenhail
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificaation Produit</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>
			Bienvennu Admin
		</h1>
		<nav>
			<ul>
				<li><a href="adminController?page=index">Accuiel</a></li>
				<li><a href="adminController?page=addproduct">Ajouter Produit</a></li>
				<li><a href="#">Parametres</a></li>
				<li><a href="#">Pages</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="signup-header">
	 	<h2>Modifier le produit</h2>
	 </div>

	 <form method="post" action="adminController">
	 
	 <input type="hidden" name="page" value="edit_product">
	 <input type="hidden" name="id" value="<c:out value="${p.getIdProduit() }"/>">
     
	 	<div class="signup-group">
	 		<label>Nom Produit</label>
	 		<input type="text" name="name" value="<c:out value="${p.getNomProduit()}"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Prix</label>
	 		<input type="text" name="price" value="<c:out value="${p.getPrix() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Category</label>
	 		<input type="text" name="category" value="<c:out value="${p.getIdCategorie() }"></c:out>" required>
	 	</div>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Image</label>
	 		<img style="height: 160px;width: 160px;" src="<c:out value="${p.getImageProduit()}"></c:out>">
                <input type="file" name="image"  required><br>
	 	</div>
	 	<div class="signup-group">
			<input type="submit" value="Modifier">	 
		</div>
	 </form>
	
	 <footer>
		<div class="footer">
	      SnowSport.com
	    </div>
	</footer>
</body>
</html>