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
<div class="panel panel-primary" id="b">
   
    <div  class="panel-heading" id="a" > Panel de Administracion</div>
    <div class="panel-body">

<form action="/riego" method="post"> 

<input type="hidden" name="id_sector" value="
<c:out value="${id_sector}"></c:out>
">


Tipo de Riego<br>
<select name="id_tipo">
<option value="1"> Normal  </option>

<option value="2"> Inteligente </option>

</select>
<br>
Inicio : <br>
<input type="time" name="inicioT"><br>

<input type="date" name="inicioF"><br>

Fin :  <br>
<input type="time" name="finalT"><br>

<input type="date" name="finalF"><br>

<input type="submit" value="crear riegos">
</form>

   
    
    </div>
    </div>
    </div>
    
    <div class="col-md-2"> </div>
</div>
</div>
</body>
</html>