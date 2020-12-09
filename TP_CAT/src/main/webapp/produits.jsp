<%--
  Created by IntelliJ IDEA.
  User: Al4D1N
  Date: 07/12/2020
  Time: 04:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Produits</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
    <%@include file="header.jsp" %>>
    <div class="container col-md-10 col-md-offset-1">
        <div class="panel panel-primary">
            <div class="panel-heading">Recherche de produits</div>
            <div class="panel-body">
                <form action="chercher.php" method="get">
                    <label>Mot Clé</label>
                    <input type="text" name="motCle">
                    <button type="submit" class="btn btn-primary">Chercher</button>
                </form>
                <table class="table">
                    <tr>
                        <th>ID</th><th>Désignation</th><th>Prix</th><th>Quantité</th>
                    </tr>
                    <c:forEach items="${model.produits}" var="p">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.designation}</td>
                            <td>${p.prix}</td>
                            <td>${p.quantite}</td>
                            <td><a onclick="return confirm("Are you sure?")" href="Supprimer.php?id=${p.id}">Supprimer</a> </td>
                            <td><a href="Edit.php?id=${p.id}">Modifier</a> </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
