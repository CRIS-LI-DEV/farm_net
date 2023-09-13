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


<link rel="stylesheet" href="estilo.css">


</head>
<body>



<div class="container">
<div class="row">


<div class="col-md-12">
<div class="panel panel-primary" id="b">
   
    <div class="panel-heading" id="a"> <img width="150px"src="inx4.png"><h4> Usuarios</h4></div>
    <div class="panel-body">
   
BUSCAR USUARIO
<form action="/login" method="post"> 


email
<input type="text" name="email" class="form-control" ><br> 

<input type="submit" value="Login" class="btn btn-default">
<br>
<br>
 </form>

CREAR USUARIO
<form action="/usuario" method="post"> 


Nombre
<input type="text" name="nombre" class="form-control" ><br> 

email
<input type="text" name="email" class="form-control" ><br> 

<input type="submit" value="Crear Usuario" class="btn btn-default">
<br>
<br>
 </form>


 
    </div>
    </div>
    </div>
    

</div>
</div>
</body>
</html>