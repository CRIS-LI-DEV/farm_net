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

<form action="/sensores" method="post"> 

<input type="hidden" name="id_pmc" value="
<c:out value="${id_pmc}"></c:out>
">

Nombre:<br>
<input type="text" name="nombre"><br>

Tipo de sensor<br>
<select name="id_tipo">
<option value="1"> Humedad Suelo  </option>

<option value="2"> Humedad Ambiental </option>

<option value="3"> Temperatura Suelo </option>

<option value="4"> Temperatura Ambiental </option>

<option value="5">  Voltaje Ac</option>

<option value="6">  Corriente Dc</option>

<option value="7">  Corriente Ac</option>

<option value="8">  Voltaje Dc</option>



</select>

<input type="submit" value="crearSensor">
</form>

   
    
    </div>
    </div>
    </div>
    
    <div class="col-md-2"> </div>
</div>
</div>
</body>
</html>