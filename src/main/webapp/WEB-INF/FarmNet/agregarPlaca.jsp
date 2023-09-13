<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="estilo.css">

<title>Insert title here</title>
</head>
<body>



<div class="container">
<div class="row">

<div class="col-md-2"></div>
<div class="col-md-8">
<div class="panel panel-primary">
   
    <div class="panel-heading"> Panel de Administración</div>
    <div class="panel-body">

<form action="/placa" method="post"> 

<input type="hidden" name="id_sector" value="
<c:out value="${id_sector}"></c:out>
">

Nombre:<br>
<input type="text" name="nombre"><br>

Descripcion:<br>
<textarea rows="10" cols="20" name="descripcion"> </textarea> <br>



Modelo:<br>
<input type="text" name="modelo"><br>

<input type="submit" value="Agregar">
</form>

   
    
    </div>
    </div>
    </div>
    
    <div class="col-md-2"> </div>
</div>
</div>
</body>
</html>