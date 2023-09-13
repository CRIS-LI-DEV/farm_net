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

<div class="panel panel-primary" id="b">













<div class="panel-heading" id="a">
<div class="row">
<div class="col-md-6">

<img width="150px"src="../inx4.png">
<br>
<br>
<table class="table" >
<tbody>

<tr>
<td>
ID DEL USUARIO : 
</td>
<td>
<c:out value="${id_usuario}"></c:out>
</td>
</tr>

<tr>
<td>
NOMBRE DEL USUARIO : 
</td>
<td>
<c:out value="${nombre_usuario}"></c:out>
</td>
</tr>

<tr>
<td>
NOMBRE DE LA GRANJA : 
</td>
<td>
<c:out value="${au.getSector().getGranja().getNombre()}"></c:out>
</td>
</tr>

<tr>
<td>
NOMBRE DEL SECTOR : 
</td>
<td>
<c:out value="${au.getSector().getNombre()}"></c:out>
</td>
</tr>



<tr>
<td>
NOMBRE DEL DISPOSITIVO : 
</td>
<td>
<c:out value="${au.getNombre()}"></c:out>
</td>
</tr>

</tbody>
</table>

</div>
</div>
</div>

<div class="panel-body">

<div class="col-md-6">
<h3>Sensores
</h3>				


<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1" id="a">
Agregar 
</button>

<table class="table"> 

<thead>

<tr>
<th> Id </th>
<th> Nombre </th>
<th> Valor </th>	
</tr>

</thead>
<tbody>

<c:forEach items="${au.getSensores()}" var="r">

<tr>

<td>
${r.getId() }
<br>
</td>

<td>
<a href="/sensor/${r.getId() }"> ${r.getNombre() } </a>
</td>


<td>
${r.getUltimaLecturaAnalogica() }<br>
</td>

<td>
<form action="/sensor/borrar" method="post">

<input type="hidden" name="id_au" class="form-control" 
value="<c:out value="${au.getId()}"></c:out>
">

<input type="hidden" name="id_sensor" value="${r.getId()}">
											
<input type="submit" value="Borrar" class="btn btn-danger" id="a">

</form>
</td>
</tr>

</c:forEach>
</tbody>
</table>
</div>
<div class="col-md-6">
<h3>Actuadores</h3>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="a">
Agregar 
 </button>
<table class="table"> 
<thead>
							
<tr>
<th> Id</th>
<th> Nombre</th>
<th> Tipo de control</th>
<th> Tipo de actuador</th>
<th> Estado</th>
<th>Accion </th>
</tr>
</thead>
<tbody>
<c:forEach items="${au.getActuadores()}" var="s">
<tr>
<td>

${s.getId()}

</td>

<td>

${s.getNombre()}

</td>
<td>

${s.getTipoAutomatico()}

</td>

<td>

${s.getTipo()}

</td>
<td>
${s.getValorLogico()}
</td>
<td>
<form action="/actuador/borrar" method="post">
<input type="hidden" name="id_au" value="<c:out value='${au.getId()}'></c:out>
">
<input type="hidden" name="id_actuador" value="${s.getId()}">
<input type="submit" value="Borrar!">

</form>
</td>





</tr>

</c:forEach>
</tbody>
</table>














    
    </div>
    
        <a href="/sectores/<c:out value="${placa.getSector().getId()}"></c:out>">volver  a sector</a>
</div>
</div>
</div>
</div>











<div class="container">

  <!-- Button to Open the Modal -->


  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Agregar Actuador</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        
        
        
<form action="/actuadores" method="post"> 

<input type="hidden" name="id_au" value="<c:out value='${au.getId()}'></c:out>">


Nombre:<br>
<input type="text" name="nombre" class="form-control"><br>

Tipo de actuador<br>
<select name="tipo_de_actuador" class="form-control">
<option value="Selenoide"> Valvula Selenoide</option>
<option value="Rele"> Rele </option>



</select>

<br>
Tipo de Control
<br>
<select name="tipo_de_control" class="form-control">
<option value="s"> Switch</option>
<option value="p"> Programado </option>
</select>
<br> Descripcion
<br>
<textarea rows="3" cols="10" name="descripcion" class="form-control"></textarea><br>
<input type="submit" value="crearSensor" >
</form>

   
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>




<div class="container">

<div class="modal" id="myModal1">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title">Agregar Sensor</h4>
<button type="button" class="close" data-dismiss="modal">&times;</button>
 </div>
<div class="modal-body">
 <form action="/sensores" method="post"> 
<input type="hidden" name="id_au" value="
<c:out value="${au.getId()}"></c:out>
" class="form-control">
Nombre:<br>
<input type="text" name="nombre" class="form-control"><br>
Descripción <br>
<textarea rows="3" cols="10" name="descripcion" class="form-control"></textarea><br>
Tipo de sensor<br>
<select name="tipo_de_sensor" class="form-control">
<option value="1"> Humedad Suelo  </option>

<option value="2"> Humedad Ambiental </option>

<option value="3"> Temperatura Suelo </option>

<option value="4"> Temperatura Ambiental </option>

<option value="5">  Voltaje Ac</option>

<option value="6">  Corriente Dc</option>

<option value="7">  Corriente Ac</option>

<option value="8">  Voltaje Dc</option>



</select>
Unidad <br>
<input type="text" name="unidad" class="form-control">
<input type="submit" value="crearSensor" >
</form>

   
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>

    
    </div>
  </div>
  
</div>

</body>
</html>