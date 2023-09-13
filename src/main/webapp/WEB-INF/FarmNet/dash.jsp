<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Granjas</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>

<body>
<div class="d"> 
  <span class="fl"><img src="qq.png" width="34px" height="24px"> FLOW MONITOR </span><br>
  <img src="aa.png" width="32px"> <c:out value="${usuario.getNombre()}"></c:out>  <br>
  

 <div class="b">Volumen total acumulado : 
   <c:out value="${sumaSensores}"></c:out>  
  
  </div> 
  
</div>
<div class="ar">Areas</div>
 
<c:forEach items="${usuario.getGranjas()}" var="g">

<div class="b card"><span>
  <img src="ar.png" width="32px">
${g.getNombre()}<br>
</span>

<c:forEach items="${g.getSectores()}" var="s">
<form action="/sectores" method="POST">

  <input type="hidden" name="id_sector" value="${s.getId()}">
  <button type="submit"  class="btn c" >   <img src="xa.png" width="32px">  ${s.getNombre()}  </button>
 
</form>

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
  font-family: "ja";
  src: url("ja.ttf");
}
 
 
  *{
    padding:0px;
    margin: 0;
  }
    body{margin: 0;
      color: white;
font-size:28px;
padding: 0;
background-image: linear-gradient(to right top, #104aa1, #18469f, #1f429d, #243e9b, #2a3a99);
 

background-size: 100% 100%;
min-height: 1000px;
}

.fl{ color: white;
font-size: 14px;
  font-family: "na";


}
.ar{font-size: 24px;

margin-left: 4%;
}
a:link, a:visited{
  color:black;
}
.b{ 
  font-size: 24px;
  padding: 2%;
  color:black;
  background: white;
  border: 1px solid rgba(116, 122, 119,0.4);	
  box-shadow: 1px 1px 4px rgba(0,0,0,0.4);
  margin: 4%;
  border-radius: 2px;

}
.c{color: black;
  border: 1px solid rgba(116, 122, 119,0.4);	
  box-shadow: 1px 1px 4px rgba(0,0,0,0.4);
font-size: 24px;
  margin: 1%;
  width: 90%  ;
padding-left: 5%;
box-shadow: 1px 1px 1px rgba(0,0,0,0.5);
text-shadow: none;
}
.d{ 

  margin: 1%;
  width: 100%  ;
  padding-left: 5%;}
</style>