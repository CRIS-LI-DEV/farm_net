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


  </body>
</html>



<script>
  $(document).ready(function () {
    $("#caja1").click(function (e) {
        console.log("CLICK");
      e.preventDefault();
      $.get("/prueba_1", function (data, textStatus, jqXHR) {
        console.log(data);
        console.log(textStatus);
        console.log(jqXHR);
        $("#caja1").append(data);
      });
    });




    $("#caja2").click(function (e) {
        console.log("CLICK");
      e.preventDefault();
      $.get("/api/users", function (data, textStatus, jqXHR) {
        console.log(data);
        console.log(textStatus);
        console.log(jqXHR);
    
      });
    });





  });
</script>