<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Granjas</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/estilo.css">

</head>

<body>



<div class="container">

<div class="panel panel-primary" id="b">

<div class="panel-heading" id="a"> 
 <div class="row">
 <div class="col-md-6">
 <img width="150px"src="/../inx4.png" ><br><br>
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
 </tbody>
 </table>
</div>
 </div>
 </div>
 
 
 <div class="panel-body">
   <div class="row">
<div class="col-md-6">
Crear Granja

<form action="/granjas" method="post"> 

<input type="hidden" name="id_usuario" value="
<c:out value="${usuario.getId()}"></c:out>    
"> 
Nombre
<br>
<input type="text" name="nombreGranja" class="form-control" >
<br> 
Ubicacion
<br>
<input type="text" name="ubicacion" class="form-control" >
<br> 
Descripcion
<br>
<input type="text" name="descripcion" class="form-control" >
<br> 
<input type="submit" value="Crear" class="btn btn-default">
<br>

 </form>

</div>

<div class="col-md-6">
<h4>Granjas</h4>

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
Ubicación
</th>
<th>
Acciones
</th>
</tr>

</thead>
<tbody>
<c:forEach items="${usuario.getGranjas()}" var="g">
<tr>
<td>
${g.getId()}<br>
</td>

<td>

<a href="/granjas/${g.getId()}"> ${g.getNombre()}<br>
</a>

</td>


<td>
${g.getDescripcion()}<br>
</td>


<td>
${g.getUbicacion()}<br>
</td>

<td>
<a href="/granjas/${g.getId()}/borrar"> Borrar<br>


</td>

 </tr>



</c:forEach>
</tbody>

</table>
</div> 
    </div>
    </div>
    </div>
    </div>
   

</body>
</html>