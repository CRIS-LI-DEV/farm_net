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
   
    <div class="panel-heading" id="a"><h4>
Sensor : <c:out value="${sensor.getNombre()}"></c:out>
</h4>
<c:out value="${sensor.getTipoDeSensor().getNombre()}"></c:out>
</div>
    <div class="panel-body">


<table  class="table">
<thead>

<tr> 



<th> Hora</th> 
 

<th> valor</th> 
 
</tr>

</thead>


<tbody>

<c:forEach items="${sensor.getLecturas()}" var="s">
<tr>
<td>
${s.getCreatedAt() }
</td>

<td>
${s.getValor() }
</td>

</tr>


</c:forEach>

</tbody>
</table>


    </div>
    </div>
    </div>
    
    <div class="col-md-2"> </div>
</div>
</div>

</body>
</html>