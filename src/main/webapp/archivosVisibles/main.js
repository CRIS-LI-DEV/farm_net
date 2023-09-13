$(document).ready(function () {
  $.get("/api/users/1", function (data) {
    console.log(data);

    $("#nombre").html(data.nombre);

    $.each(data.granjas, function (i, item) {
      console.log("id : " + i + " -- " + item.nombre);

      $("#granjas").append(
        "<div class='card hoverable'><div class = 'col m4 l12 ' id='gr" +
          i +
          "'>  " +
          "<h4> Granja :" +
          item.nombre +
          "</h4>" +
          "</div></div>"
      );

      $.each(item.sectores, function (x, item2) {
        $("#gr" + i).append(
          "<div class = 'col-md-6 ' >    " +
            "<div class='card blue-grey darken-1  hoverable bloque'' >" +
           
            " <span class='card-title '>" +
            item2.nombre +
            "</span> " +
            "<p>" +
            item2.descripcion +
            "</p> <hr>" +
            "<p >  <h5>Sensores</h5>" +
            "<div id='scs" +
            x +
            "'>" +
            "</p>" +
            "<p >  <h5>Actuadores</h5>" +
            "<div id='sca" +
            x +
            "'>" +
            "</p>" + 
            "</div></div>"
        );

        $.each(item2.aus, function (y, item3) {
          $.each(item3.sensores, function (z, item4) {
            $("#scs" + x).prepend(
              " <div>" +
                item4.nombre +
                " : " +
                item4.ultimaLecturaAnalogica +
                " " +
                item4.unidad +
                " </div>"
            );

            $.each(item3.actuadores, function (z, item4) {
              var valorAc = "";
              if (item4.valorLogico == "0") {
                valorAc = "OFF";
              }

              if (item4.valorLogico == "1") {
                valorAc = "ON";
              }

              $("#sca" + x).prepend(
                " <div>" + item4.nombre + " : " + valorAc + "</div>  "
              );



                
            });
          });
        });
      });
    });
  });
});
