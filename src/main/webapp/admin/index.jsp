<%-- 
    Document   : index
    Created on : Jan. 27, 2020,1:26:55 p.m.
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
			Bienvennu Administrateur 
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
<sql:setDataSource user="root" password="abc123..." driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3310/mydb?serverTimezone=UTC"  var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds}">
 
		 select * from produit
		 
	   </sql:query>
	   
	  
	
	<div class="container">
	<h2>Liste des produits:</h2>
		 <table>
			<tr>
			<th>Id Produit</th>
			<th>Nom Produit</th>
			<th>Prix</th>
			
			<th>Image</th>
			<th>Option</th>
		</tr>
	</table>
		
		 <c:forEach items="${result.rows }" var="row">
		  <table style="table-layout: fixed;width: 100%;">
		  	
				<tr>
<td style="width: 50px;"><c:out value="${row.idProduit }"></c:out></td>
<td style="width: 100px;"><c:out value="${row.nomProduit }"></c:out></td>
<td style="width: 100px;"><c:out value="${row.prix }"></c:out></td>

<td style="width: 100px;"><img src="${row.photo}" height="100" width="150" ></td>
<td style="width: 100px;"><a href="<%= request.getContextPath() %>/adminController?page=edit&id=${row.idProduit}" style="color: #6bb1f8;">Modifier</a> ||
<a href="<%= request.getContextPath() %>/adminController?page=delete&id=${row.idProduit}" style="color:#6bb1f8;">Supprimer</a></td>
				</tr>
			</table>
		 </c:forEach>
		 </div>
	 <footer>
		<div class="footer"> 
	      SnowSport.com
	    </div>
	</footer>
	
</body>
</html>