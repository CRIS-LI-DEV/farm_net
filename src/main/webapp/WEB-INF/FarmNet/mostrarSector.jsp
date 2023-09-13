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
<link rel="stylesheet" href="../estilo.css">

</head>

<body>

<div class="container">
<div class="row">

<div class="panel panel-primary" id="b">

<div class="panel-heading" id="a">

<div class="row">


<div class="col-md-6">

<img width="150px" src="../inx4.png"><br><br>
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
<c:out value="${sector.getGranja().getNombre()}"></c:out>
</td>

</tr>

<tr>

<td>
NOMBRE DEL SECTOR :
</td>

<td>
<c:out value="${sector.getNombre()}"></c:out>
</td>
</tr>



</tbody>
</table>
</div>

<div class="col-md-6">

</div>
</div>

</div>

<div class="panel-body">

<h2>Dispositos De control y monitoreo</h2>
<button type="button" class="btn btn-primary" data-toggle="modal"	data-target="#myModal" id="a">Agregar</button>
<table class="table">
<thead>
<tr>
<th>Id</th>
<th>Nombre</th>
<th>Descripcion</th>
<th>Accion</th>
</tr>
</thead>
<tbody>

<c:forEach items="${sector.getAus()}" var="s">

<tr>

<td>
 ${s.getId() }

</td>

<td>
<a href="/au/${s.getId() }"> ${s.getNombre() }
</a>
</td>


<td>
 ${s.getDescripcion() }

</td>

<td>

<form action="/aus/borrar" method="post">

<input type="hidden" name="id_sector" class="form-control" 
value="<c:out value="${sector.getId()}"></c:out>
">

<input type="hidden" name="id_au" value="${s.getId()}">
											
<input type="submit" value="Borrar" class="btn btn-danger" id="a">

</form>

</td>

</tr>

</c:forEach>

</tbody>

</table>

</div>

</div>

<div class="btn btn-success" >
<a href="/granjas/<c:out value="${sector.getGranja().getId()}" ></c:out>">
Volver a Granjas
</a>
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
						<h4 class="modal-title">Automatas</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action="/aus" method="post">

							<input type="hidden" name="id_sector" class="form-control"
								value="
<c:out value="${sector.getId()}"></c:out>
">

							Nombre:<br> <input type="text" name="nombre" class="form-control"><br>

							Descripcion:<br>
							<textarea rows="10" cols="20" name="descripcion" class="form-control" > </textarea>
							<br> Uso:<br> <input type="text" name="uso" class="form-control"><br>

							<input type="submit" value="Agregar" class="btn btn-danger">
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




	<div class="container">


		<!-- The Modal -->
		<div class="modal" id="myModal1">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Agregar riego</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form action="/riego" method="post">

							<input type="hidden" name="id_sector"
								value="
<c:out value="${sector.getId()}"></c:out>
">


							Nombre : <br> <input type="text" name="nombre"
								class="form-control"><br> Tipo de Riego<br> <select
								name="id_tipo" class="form-control">
								<option value="1">Normal</option>

								<option value="2">Inteligente</option>

							</select> <br> Inicio : <br> <input type="time" name="inicioT"
								class="form-control"><br> <input type="date"
								name="inicioF" class="form-control"><br> Fin : <br>
							<input type="time" name="finalT" class="form-control"><br>

							<input type="date" name="finalF" class="form-control"><br>

							<input type="submit" value="crear riegos">
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