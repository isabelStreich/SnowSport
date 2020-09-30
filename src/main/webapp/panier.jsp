<%-- 
    Document   : Panier
    Created on : Jan. 22, 2020, 6:04:23 p.m.
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
				<li><a href="controllerServlet?page=index">Accueil</a></li>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login">Se connecter</a></li>
						<li><a href="Controller?page=sign-up">S'enregistrer</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="controllerServlet?page=logout" style="color: #F24638;">Se deconnecter</a></li>
						<li><a href="#">Mon Compte(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				<li><a href="controllerServlet?page=showcart">panier(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="container">
	
	<c:choose> 
		<c:when test="${x == 1}">
						<h4 style="margin-top: 40px;">Mon Pannier(<c:out value="${x}"/> item)</h4>
		</c:when>
		<c:when test="${x > 1}">
						<h4 style="margin-top: 40px;">Mon Pannier(<c:out value="${x}"/> items)</h4>
		</c:when>
		<c:otherwise >
				<h4 style="margin-top: 40px;">Votre Pannier est vide</h4>
		</c:otherwise>
	
	</c:choose>
	<table>
		<tr>
			<th>Nom Produit </th>
			<th>Prix</th>
			
			<th>Supprimer</th>
                        <th>Valider Commande</th>
		</tr>
	</table>
	
		<c:set var="total" value="0"></c:set>
		<c:forEach items="${panierList }" var="i">
			<c:forEach items="${listProduit }" var="Product">
				<c:if test="${i == Product.value.getIdProduit() }">
				
				<c:set var="total" value="${total + Product.value.getPrix() }"></c:set>
				
			<table style="table-layout: fixed;width: 100%;">
				<tr>    
                                    
                                
					<td style="width: 100px;"><img  src="${Product.value.getImageProduit()}" height="100" width="150" >  (<c:out value="${Product.value.getNomProduit()}"/>)</td>
                                
                                <td style="width: 50px;"><c:out value="${Product.value.getPrix()}"/></td>
                                       
					<td style="width: 100px;"><a href="controllerServlet?page=remove&id=<c:out value="${Product.value.getIdProduit()}"/>"><span class="btn btn-danger">X</span></a></td>
                                        
                                        <form action="controllerServlet">
                                        <td style="width: 100px;">
                                            
                                                
                                            <input type="hidden" name="page" value="finalisercmd"/>
                                            <input  type="number" min="1" max="10" name="quantite">
                                                <input type="hidden" name="prix" value="${Product.value.getPrix()}"/>
                                                <input type="hidden" name="idProduit" value="${Product.value.getIdProduit()}"/>
                                                <input type="submit" class="btn btn-success" value="valider Commande"/>
                                            
                                           
                                        </td>
                                         </form>
				</tr>
                                
			</table>
				</c:if>
			</c:forEach>
		</c:forEach>
	
	<h4 style="margin-top: 40px;margin-bottom: 40px;">Montant  Total: $ (<c:out value="${ total}"></c:out>)</h4>
	
	<a href="controllerServlet?page=index"><input type="button" value="Revenir a la liste des produits" class="btn btn-warning" style="width:100%;padding:8px;font-size:16px;"></a>
	
	
	</div>

	<footer style="margin-top: 40px;">
		<div class="footer"> 
	      <a href="controllerServlet?page=index"> SnowSport.com</a>
	    </div>
	</footer>

</body>
</html>