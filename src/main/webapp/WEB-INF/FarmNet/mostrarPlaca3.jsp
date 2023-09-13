<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
<div class="row">

<div class="col-md-2"></div>
<div class="col-md-8">
<div class="panel panel-primary" id="b">
   
    <div class="panel-heading" id="a">


Sector : <c:out value="${placa.getNombre()}"></c:out>


</div>






<form action="/sensores" method="get" >
<input type="hidden" name="id_pmc" value="
<c:out value="${placa.getId()}"></c:out>
" >
<input type="submit" value="Agregar Sensor" class="btn btn-danger" id="a"> 
</form>




<form action="/actuadores" method="get" >
<input type="hidden" name="id_pmc" value="
<c:out value="${placa.getId()}"></c:out>
" >
<input type="submit" value="Agregar Actuador" class="btn btn-danger"> 
</form>

<h2>Dispositos De control y monitoreo</h2>


<table border="1" class="table"> 
<thead>
<tr>

<th>
Sensor
</th>

<th>
Tipo de Sensor
</th>





</tr>


</thead>

<tbody>
<c:forEach items="${placa.getSensores()}" var="s">
<tr>

<td>
<a href="">
${s.getNombre() }
</a>
</td>


<td>

</td>



</tr>

</c:forEach>
</tbody>
</table>












<br>

    </div>
    </div>
    
    <div class="col-md-2"> </div>
</div>
</div>
</body>
</html>