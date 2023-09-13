<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mostrar Sector</title>

<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>

<body>

	<div class="entrada"> 
  <span class="fl"><img src="qq.png" width="34px" height="24px"> FLOW MONITOR </span><br>
  <img src="aa.png" width="32px"> <c:out value="${usuario.getNombre()}"></c:out>  <br> 
  <img src="xa.png" width="32px">  <c:out value="${sector.getNombre()}"></c:out>
   
</div>


<div class="btn button">
	<a   href="javascript:document.location.reload();">Actualizar</a>
</div>



<c:forEach items="${sector.getAus()}" var="s">


 <div class="b"> 
	 <div class="nombre">
 ${s.getNombre() }

</div>

	<c:forEach items="${s.getSensores()}" var="se">
<div class="z">
<div class="item1">
	<img src="sen.png" width="42px">	${se.getNombre()}
<div class="f">        ${se.getUltimaLecturaAnalogica()} ${se.getUnidad()}
</div>
</div>
<div class="item2">
<form action="/detalles" method="post">
<input type="hidden" value="${se.getId()}" name="id_sensor">

<button type="submit"  class="ds">  <img src="listaMn.png" width="100px" height="60px"></button>

</form>
</div>

</div>



	</c:forEach>







</div>
</c:forEach>


</body>
</html>



<style>
   @font-face {
  font-family: "na";
  src: url("na.ttf");
}
@font-face {
font-family: "a";
src: url("a.otf");
}

@font-face {
font-family: "b";
src: url("b.ttf");
}

*{
padding: 0;
margin: 0;
}

body
{  
font-family: "b";
color: white;
font-size:24px;
background-size: 100% 100%;
min-height: 1000px;
background-image: linear-gradient(
      to right top,
      #104aa1,
      #18469f,
      #1f429d,
      #243e9b,
      #2a3a99
    );
}

a:link, a:visited{
  color:black;
}

.b
{ 
font-size: 20px;
padding: 2%;
color:black;
background: white;
margin: 4%;
border-radius: 2px;
border: 1px solid rgba(116, 122, 119,0.4);	
box-shadow: 1px 1px 4px rgba(0,0,0,0.4);
}


.c
{
color:#15C39A;
border: solid 2px #15C39A;	
margin: 1%;
width: 90%  ;
padding-left: 5%;
box-shadow: 1px 1px 1px rgba(0,0,0,0.5);
text-shadow: none;
}

.d
{
margin: 1%;
width: 90%  ;
padding-left: 5%;
}

.f
{font-size: 24px;
color: rgb(95, 158, 1);
}

.nombre{
border-radius: 2px;	
text-align: center;
 
}

.fl{
font-size: 14px;
  font-family: "na";


}
  
.button{
color: white;
font-size: 24px;
background: #15C39A;
margin-left: 4%;
border:none;
box-shadow: 1px 1px 4px rgba(0,0,0,0.4);
 }
  a:link{
	  text-decoration: none;
	  color: white;
  }
  .entrada{
text-shadow:1px 1px 4px rgba(0,0,0,0.4);
  margin-left: 4%;
  }
  .z{
margin-top: 2px;
	  border: 1px solid rgba(116, 122, 119,0.4);
	  border-radius: 5px;
	  padding: 4%;
	  box-shadow: 1px 1px 4px rgba(0,0,0,0.4);
	  display:flex;
	  justify-content: space-between;
  }
  .item1{
  width:80%;
  margin:0 4%;
  }
  
   .item2{
  width:20%;
  margin:0 4%;

  }
  .ds{
  background: #15C39A;color:white;
  height:100px;
  border: none;
  
box-shadow: 1px 1px 4px rgba(0,0,0,0.4);
   }
</style>