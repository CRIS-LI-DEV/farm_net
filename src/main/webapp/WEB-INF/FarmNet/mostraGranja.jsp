<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../estilo.css">
</head>

<body>

<div class="container">

<div class="panel panel-primary" id="b">

<div class="panel-heading" id="a"> 

<div class="row">

<div class="col-md-6">

<img width="150px"src="../inx4.png"><br><br>

<table class="table">

<tbody>

<tr>

<td>
NOMBRE DEL USUARIO
</td>

<td>
<c:out value="${usuario.getNombre()}"></c:out>   
</td>

</tr>

<tr>

<td>
NOMBRE DE LA GRANJA
</td>

<td>
<c:out value="${granja.getNombre()}"></c:out>
</td>

</tr>
 
</tbody>

</table>

</div>
</div>

</div>

<div class="panel-body">

Crear Sector
<br>
<br>

<form action="/sector" method="post">

<input type="hidden" name="id_granja" value="
<c:out value="${granja.getId()}"></c:out>
">

<input name="sectorNombre" type="text" class="form-control"><br>

<input type="submit" value="crearSector">

</form>

<br>
 Sectores

<table  class="table">

<thead>

<tr> 
<th>
Id
</th> 
<th>
Nombre
</th> 

<th>
 Descripcion
</th> 
<th>
 Acciones
</th>  
 
</tr>

</thead>

<tbody>

<c:forEach items="${granja.getSectores()}" var="s">

<tr>

<td>

${s.getId()}

</td>



<td>
<a href="/sectores/${s.getId()}">
${s.getNombre()}
</a>
</td>
<td>

${s.getDescripcion()}

</td>
<td>
<a   href="/sectores/${s.getId()}/borrar">Borrar</a>
</td>

</tr>

</c:forEach>

</tbody>
</table>

</div>
</div>
</div>
    
</body>
</html>