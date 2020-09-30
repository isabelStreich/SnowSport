<%-- 
    Document   : ajouterproduit
    Created on : Jan. 27, 2020, 11:41:26 a.m.
    Author     : istreich
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>
			Bienvenue Administrateur!!!
		</h1>
		<nav>
			<ul>
				<li><a href="adminController?page=index">Accueil</a></li>
				<li><a href="adminController?page=addproduct">Ajouter Produit</a></li>
				<li><a href="#">Parametres</a></li>
				<li><a href="#">Pages</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="signup-header">
	 	<h2>Ajouter Produit</h2>
	 </div>

	 <form method="post" action="adminController">
	 
	 <input type="hidden" name="page" value="add_product">
     
	 	<div class="signup-group">
	 		<label>Nom Produit</label>
	 		<input type="text" name="name" placeholder="Nom Produit ici"  required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Prix</label>
	 		<input type="text" name="price" placeholder="Prix du Produit" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Categorie id</label>
                        <select name="category">
                        <option >Ski</option>
                        <option>SnowBoard</option>
                        <option>SplitBoard</option>
                        <option>Accessoires</option>
                        
                        </select>
	 		
	 	</div>
	 	
	 	
	 	<div class="signup-group">
	 		 <label for="fileupload"> Selectionner  la photo du produit</label>
	 		<input type="file" name="image" required><br>
	 	</div>
	 	<div class="signup-group">
			<input type="submit" value="Ajouter">	 
		</div>
	 </form>
	
	 <footer style="position: absolute;left: 0;bottom: 0;width: 100%;">
		<div class="footer">
	      SnowSport.com
	    </div>
	</footer>
</body>
</html>