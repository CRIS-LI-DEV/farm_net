<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="/archivosVisibles/Chart.bundle.js"></script>
    <script src="/archivosVisibles/utils.js"></script>
  </head>
  <body>
    
	<div class="entrada"> 
    <span class="fl"><img src="qq.png" width="34px" height="24px"> FLOW MONITOR </span><br>
    <img src="aa.png" width="32px"> <c:out value="${usuario.getNombre()}"></c:out>  <br> 
    <img src="xa.png" width="32px">  <c:out value="${sector.getNombre()}"></c:out>
     
  </div>
   <div class="zs">
<h1>  Sensor<c:out value="${sensor.getNombre()}"></c:out>
</h1>
<h1>  <c:out value="${sensor.getUltimaLecturaAnalogica()}"></c:out>
  <c:out value="${sensor.getUnidad()}}"></c:out>
  
</h1>
</div>


<div class="btn button">
	<a   href="javascript:document.location.reload();">Actualizar</a>
</div>

<form>


  <button class="btn button" style="background:green;">Atras </button>
</form>
<div class="b">
    <table class="table ">
    <thead>
      <tr>
        <th>Fecha</th>
        <th>Lectura</th>

      </tr>
  </thead>
    <tbody>  
  
  <c:forEach items="${lecturas}" var="l">
<tr>


<td> 
${l. getCreatedAt() }  </td>

<td style="color:goldenrod; font-size: 26px; font-weight: 900;"> 
${l.getValor() }  </td>
  </tr>
  </c:forEach>
     </tbody>
  </table>
</div>
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

  * {
    padding: 0;
    margin: 0;
  }

  body {
    font-family: "b";
    color: white;
    font-size: 24px;
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
  .fl{
font-size: 14px;
  font-family: "na";


}
  a:link,
  a:visited {
    color: black;
  }
  .contCan {

    width: 100%;
    padding: 1%;
    padding-right: 10%;
    margin: 2%;;
    text-align: center;
    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4); ;}
  
  .b {
    font-size: 20px;
    padding: 2%;
    color: black;
    background: white;
    margin: 4%;
    border-radius: 2px;
    border: 1px solid rgba(116, 122, 119, 0.4);
    box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
    overflow:scroll;
    height: 500px;
  }


  .zs {
    font-size: 20px;
    padding: 2%;
    color: white;
    background: transparent;
    margin: 4%;
    border-radius: 2px;
    border: 1px solid rgba(255, 255, 255, 0.4);
    box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
    text-shadow: 1px 1px 4px rgba(0,0,0, 0.8);;
   text-align: center;
   background-size: 100% 200%;
   background-image: url("segunda.png");
  
  }


  .c {
    color: #15c39a;
    border: solid 2px #15c39a;
    margin: 1%;
    width: 90%;
    padding-left: 5%;
    box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
    text-shadow: none;
  }

  .d {
    margin: 1%;
    width: 90%;
    padding-left: 5%;
  }

  .f {
    color: rgb(95, 158, 1);
  }

  .nombre {
    border-radius: 2px;
    text-align: center;
    color: black;
  }

  .button {
    color: white;
    font-size: 20px;
    background: #15c39a;
    margin-left: 4%;
    border: none;
    box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
  }
  a:link {
    text-decoration: none;
    color: white;
  }
  .entrada {margin-left: 4%;
     }
  .nom {
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
 padding: 1% 5%;
  }
  .z {
    margin-top: 2px;
    border: 1px solid rgba(116, 122, 119, 0.4);
    border-radius: 5px;
    padding: 4%;
    box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
  }
  #cx {
    background: white;
   
    margin: 2%;
    box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
    border-radius: 5px;
  }

  #val {
    font-size: 50px;
  }

  .cont{
  width: 100%;}
</style>

<script>
  $(document).ready(function () {
    var x = $("#ix").val();
    var dir = "/api/sensores/" + x;
    $.get(dir, function (data) {
      console.log(data.lecturas);
      graficos(data.lecturas, x);
    });
  });

  function graficos(lecturas, sensor) {
    var lecturas_fechas = [];
    var lecturas_valores = [];

    //FORMATO DE DATOS
    $.each(lecturas, function (iteracion, itemLectura) {
      // if(iteracion===10){return false;}
      lecturas_valores[iteracion] = itemLectura.valor;

      var horaSt = String(itemLectura.createdAt);
      var puntoDeCorteDeSt = horaSt.indexOf(".");
      var horaStCorta = horaSt.substr(0, puntoDeCorteDeSt);
      lecturas_fechas[iteracion] = horaStCorta;
    });

    var config = {
      type: "line",

      data: {
        labels: lecturas_fechas,
        datasets: [
          {
            label: "",
            backgroundColor: window.chartColors.blue,
            borderColor: window.chartColors.blue,
            data: lecturas_valores,
            fill: false,
          },
        ],
      },

      options: {
        responsive: true,
        plugins: {
          title: {
            display: true,
            text: "Chart.js Line Chart",
          },
          tooltip: {
            mode: "index",
            intersect: false,
          },
        },
        hover: {
          mode: "nearest",
          intersect: true,
        },
        scales: {
          x: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: "Month",
            },
          },
          y: {
            display: true,
            scaleLabel: {
              display: true,
              labelString: "Value",
            },
          },
        },
      },
    };

    var ctx = document.getElementById("cx").getContext("2d");
    window.myLine = new Chart(ctx, config);
  }
</script>
