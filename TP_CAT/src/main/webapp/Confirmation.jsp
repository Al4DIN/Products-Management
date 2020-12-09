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
    <div class="container col-md-8 col-md-offset-2 col-xs-12">
        <div class="panel panel-primary">
            <div class="panel-heading">Confirmation</div>
            <div class="panel-body">
               <div class="form-group">
                   <label>ID</label>
                   <label>${produit.id}</label>
               </div>
                <div class="form-group">
                    <label>Désignation</label>
                    <label>${produit.designation}</label>
                </div>
                <div class="form-group">
                    <label>Prix</label>
                    <label>${produit.prix}</label>
                </div>
                <div class="form-group">
                    <label>Quantité</label>
                    <label>${produit.quantite}</label>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
