<%-- 
    Document   : header
    Created on : Jan. 26, 2020, 12:21:03 p.m.
    Author     : ybenhail
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <head>
        
    </head>
    <body>
       

        <header>
            <h1>
                SnowSport
            </h1>
            <nav>
                <ul>
                    <li><a href="controllerServlet?page=index">Accuiel</a></li>
                        <c:choose>
                            <c:when test="${session == null}">
                            <li><a href="controllerServlet?page=login">Login</a></li>
                            <li><a href="controllerServlet?page=sign-up">Sign-up</a></li>
                            </c:when>
                            <c:when test="${session != null}">
                            <li><a href="controllerServlet?page=logout" style="color: #F24638;">Logout</a></li>
                            <li><a href="#">Mon Compte(<c:out value="${username }"></c:out>)</a></li>
                            </c:when>
                        </c:choose>
                    <li><a href="controllerServlet?page=showcart">Panier(<c:out value="${x}"/>)</a></li>
                </ul>
            </nav>
        </header>
   
