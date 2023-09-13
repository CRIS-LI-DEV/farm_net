$(document).ready(function () {
  $.get("/api/users/1", function (data) {
    $("#nombre").html(data.nombre);

    $.each(data.granjas, function (i, item) {
      console.log("--------------------------------");
      console.log("item : " + item.nombre);
      console.log("--------------------------------");
      

    
      $("#granjas").append(
      
        +'<div class="panel  panel-default c " id="b">'+
    
        
           
        
            
            
             +'<div class="panel-heading">'+
             "<div  class='col-md-12'   >"+
                "<h1>  " +" Granja :" +  item.nombre + "" +  "</h1>" +

            "</div>"+

             "</div>"+
             +'<div class="panel-body" id="" >'+

             "<div  class='col-md-12 '   id='gr" +  item.id + "'>"+
             "</div>"+

         
             +"</div>"
        
             +"</div>"
      
             +"</div>"
      
          +
          " <br>"
      );

      $.each(item.sectores, function (x, item2) {
        $("#gr" + item.id).append(
          "<div class = 'col-md-6  '  > " +
          
         
                "<h1> <span class='cB3'>" +
                 item2.nombre +
                 "</h1> </span>" +
       
                  "<p>" +
                   item2.descripcion +
                   "</p>" +
                    "<hr>" +
             
                  "<div id='scAu" + item2.id + "'  >"+
               
           
                   "<h5><span class='cB2'>Sensores</span></h5>" +
           
                   "<table class='table table-bordered' border='1'>" +
                   "<div id='scs" +  item2.id +"' > </div>" +
           
                     "</table>" +
           
           
            
            
                                            "<h5><span class='cB2'>Actuadores</span></h5>" +
                      "<table class=' table table-bordered' border='1'>" +
         
                      "<div id='sca" +
                      item2.id +
                       "'></div>" +
                 
                    "</table>" +
                    "</div>" +
                     "</div>" +


                  
            "</div>"
        );

        $.each(item2.aus, function (y, item3) {
          $("#scAu" + item2.id).prepend( "<h2>" + item3.nombre +"</h2>");
          $.each(item3.sensores, function (z, item4) {
         
            var tituloGrafico = item4.uso;
           
            console.log(tituloGrafico);
        
            $("#scs" + item2.id).prepend(
              "<tr> " +
                "<td><span class='cB4'>" +
                item4.nombre +
                " </td> " +
              
                "<td> <span class='cB3'>" +
                item4.ultimaLecturaAnalogica +
                "</span> <span class='cB4'> " +
                item4.unidad +
                "</span> </td> " +
              
                "<td>" +
                "<button type='button' class='btn btn-success btn-lg cBl' data-toggle='modal' data-target='#myModals" +  item4.id +   "'>" +    "Detalles</button>" +
                " </td> " +
                
                "<td >" +
                
                " <div id='myModals" + item4.id + "' class='modal fade' role='dialog'>" + 
                
                           " <div class='modal-dialog'>" + 
                           
                                  "<div class='modal-content'>" +
                                  
                                      " <div class='modal-header'>" +
                
                                            "<h2>"  + item4.nombre + "</h2>"+
                                           "<p>" + item4.descripcion + "</p>"+
                                             "</div>" +
                                      
                                       "<div class='modal-body'>" +

                                       "<h4 > Ultima lectura : "   + item4.ultimaLecturaAnalogica +   " " +    item4.unidad + "<h4>"+
                                            "<canvas id='canvas" +         item4.id +  "' ></canvas>" +
                                      
                                        "</div>" +
                
                                      "<div class='modal-footer'>" +
                                             "FOOTER" +
                                      "</div>" +
                                  
                                      "</div>" +
                
                                 "</div>" +
                          "</div>" +
                          "</div>" +         
                "</td>"+
                "</tr>"
            );

            var lecturas_fechas = [];
            var lecturas_valores = [];

            $.each(item4.lecturas, function (iteracion, itemLectura) {
              
              
              lecturas_valores[iteracion] = itemLectura.valor ;
             
             
              var horaSt = String(itemLectura.createdAt);
              var puntoDeCorteDeSt = horaSt.indexOf('.');
              var horaStCorta = horaSt.substr(0,puntoDeCorteDeSt);
              lecturas_fechas[iteracion] = horaStCorta ;
            });

       


var cxvcvc=[1,2,3,4,4];









            var config = {
              type: "line",

              data: {
                labels: lecturas_fechas,
                datasets: [
                  {
                    label: "",
                    backgroundColor: window.chartColors.red,
                    borderColor: window.chartColors.red,
                    data:  lecturas_valores,
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

            var ctx = document.getElementById("canvas" + item4.id).getContext("2d");
            window.myLine = new Chart(ctx, config);


          });

          $.each(item3.actuadores, function (z, item4) {
            var valorAc = "";
            if (item4.valorLogico == "0") {
              valorAc = "OFF";
            }

            if (item4.valorLogico == "1") {
              valorAc = "ON";
            }
            console.log("id : " + item4.tipo)
           
            if(item4.tipo=='b'){
            
              $("#sca" + item2.id).prepend(

                "<tr>" +
                " <td> <span class='cB4'>" +
                item4.nombre +
                "</span></td>" +
              
                " <td> <span class='cB3'>" +
                 valorAc +

                 "</span></td>" +
                 "<td>" +
                 " <form> " +
               
                    
                 " <input type='submit' value='ON' class='btn on cBl btn-lg' id='subon" + item4.id+ "'>"  +
                 "</form>"+
                 "</td>" +
                 
                 "<td>" +
                 " <form> " + 
                
                 " <input type='submit' value='OFF' class='btn off cBl btn-lg' id='suboff" + item4.id+ "'>"  +
                 "</form>"+
                 "</td>" +
                 
                 "</tr>" 
             
              )}
           
           $('#subon'+ item4.id).click(function(){
            $.post("/api/actuadorsw", {id_actuador: item4.id, valor_logico:1},  function(data, status){
  
            });
             console.log("ON");
           })
           $('#suboff'+ item4.id).click(function(){
            $.post("/api/actuadorsw", {id_actuador: item4.id, valor_logico:0}, function(){            
            });
            console.log("OFF");
           })
           
            if(item4.tipo=='a'){
            
            $("#sca" + item2.id).prepend(
              "<tr>" +
                 " <td> <span class='cB4'>" +
                 item4.nombre +
                 "</span></td>" +
               
                 " <td> <span class='cB3'>" +
                  valorAc +
                  "</span></td>" +
                
                  " <td> " + 
                      
                    "<button type='button' class='btn btn-info btn-lg cBl' data-toggle='modal' data-target='#myModala" + item4.id +   "'>" + "Programa</button>"+

                   
                "</td>" +
                "<td>" +
                
                " <div id='myModala" + item4.id +"' class='modal fade' role='dialog'>" +
                                    " <div class='modal-dialog'>" +
                 
                                           "<div class='modal-content'>" +
                   
                                                   " <div class='modal-header'>" +
                       
                                                     "<h2>"  + item4.nombre + "</h2> <h3>Programa</h3>"+
                                                        "</div>" +
           
           
                                                 "<div class='modal-body'>" +
                                                     "<form>"+
                                                     "<h6>Sensor de referencia:</h6> "+
                                                     "<select id='sensoresList'  class='form-control' name='tipo'>"+
                                              
                                                      
                                                     "</select> "+
                                                    "<h6>Inicio :</h6> <input type='datetime-local' name='inicio' class='form-control'> "+

                                                         "<h6>Final :</h6> <input type='datetime-local' class='form-control' name='final'> <br>"+
                                                         "<h6> Valor de Disparo :</h6> <input type='number' min='0' class='form-control'  name=?> <br>"+
                                                          " <input type='submit' id='submit"+item4.id+"' value='crear' class='btn btn-warning'>"+
                                                        "</form>"+
                            
                                                  "</div>" +
           
           
                                                    "<div class='modal-footer'>" +
                                                            "FOOTER" +
                                                    "</div>" +
                                             "</div>" +
                                        "</div>" +
                "</div>" +
                
                
                
                "</td>" +
                
                "</tr>"
            );}
         
          
          console.log(item3);
          $.each(item3.sensores,function(i,sensorOption){
                $('#sensoresList').append(' <option value="'+sensorOption.id+'">' + sensorOption.nombre+'</option>');
     

          });
          
          
          
          
          
          });
        });
      });
  });
 
 
 
  });
});
