<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  </head>
  <body>
    <button id="caja1">click</button>
    <button id="caja2">click</button>
    <div id="listaEmpleado"></div>
  </body>
</html>

<script>


      $("#caja2").click(function (e) {

        console.log("CLICK");
         e.preventDefault();
         $('#listaEmpleado').html('');
          $.get("/archivosVisibles/archivo.json", function (data) {


            $.each(data, function(i,item){

  $('#listaEmpleado').html($('#listaEmpleado').html()+
  "<li id=a"+ i+">"+ item.nombre +"--"+ item.puesto +    
  
  "</li>" 
  )
    
  $.each(item.trabajos, function(a,item2){
    $('#a' + i).append(
 
 
    item2.nombre   
    );
   

  })

            });



              });


          });

</script>
