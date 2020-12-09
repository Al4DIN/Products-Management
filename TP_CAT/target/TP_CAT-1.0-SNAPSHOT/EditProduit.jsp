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
            <div class="panel-heading">Saisie D'un produit</div>
            <div class="panel-body">
               <form action="UpdateProduit.php" method="post">
                   <div class="form-group">
                       <label class="control-label">ID</label>
                       <input type="text" name="id" value="${produit.id}" class="form-control" required="required">
                       <span></span>
                   </div>
                   <div class="form-group">
                       <label class="control-label">Designation</label>
                       <input type="text" name="designation" value="${produit.designation}" class="form-control" required="required">
                       <span></span>
                   </div>
                   <div class="form-group">
                       <label class="control-label">Prix</label>
                       <input type="text" name="prix" value="${produit.prix}" class="form-control">
                       <span></span>
                   </div>
                   <div class="form-group">
                       <label class="control-label">Quantité</label>
                       <input type="text" name="quantite" value="${produit.quantite}" class="form-control">
                       <span></span>
                   </div>
                   <button type="submit" class="btn btn-primary">Save</button>
               </form>
            </div>
        </div>
    </div>
</body>
</html>
