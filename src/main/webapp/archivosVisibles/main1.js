$(document).ready(function () {
  $.get("/api/users/1", function (data) {
    $("#nombre").html(data.nombre);

    $.each(data.granjas, function (i, item) {
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
          "<div class = 'col-md-6 ' > " +
            "<div class='card  bloque'' >" +
            " <span class='card-title '>" +
            "<h1>" +
            item2.nombre +
            "</h1>" +
            "</span> " +
            "<p>" +
            item2.descripcion +
            "</p>" +
            "<hr>" +
            "<div>" +
            "<h5>Sensores</h5>" +
            "<table class='table table-bordered' border='1'>" +
            "<div id='scs" +
            x +
            "' > </div>" +
            "</table>" +
            "</div>" +
            "<div>" +
            "<h5>Actuadores</h5>" +
            "<table class='table-bordered'>" +
            "<tbody>" +
            "<div id='sca" +
            x +
            "'></div>" +
            "</tbody>" +
            "</table>" +
            "</div>" +
            "</div>" +
            "</div>"
        );

        $.each(item2.aus, function (y, item3) {
          $.each(item3.sensores, function (z, item4) {
            var tituloGrafico = item4.uso;
            console.log(tituloGrafico);
        
            $("#scs" + x).prepend(
              "<tr> " +
                "<td>" +
                item4.nombre +
                " <td> " +
                "<td>" +
                item4.ultimaLecturaAnalogica +
                " " +
                item4.unidad +
                " <td> " +
                "<td>" +
                "<button type='button' class='btn btn-info btn-lg' data-toggle='modal' data-target='#myModal" +
                x +
                "'>" +
                "Open Modal</button>" +
                " <td> " +
                "<td>" +
                " <td> " +
                " <div id='myModal" +
                x +
                "' class='modal fade' role='dialog'>" +
                " <div class='modal-dialog'>" +
                "<div class='modal-content'>" +
                " <div class='modal-header'>" +
                "HEADER" +
                "</div>" +
                "<div class='modal-body'>" +
                "<canvas id='canvas" +
                x +
                "' style='width:100%;'></canvas>" +
                "</div>" +
                "<div class='modal-footer'>" +
                "FOOTER" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</tr>"
            );

            var lecturas_fechas = [];
            var lecturas_valores = [];

            $.each(item4.lecturas, function (iteracion, itemLectura) {
              
              console.log("var : " +itemLectura.valor);
              
              lecturas_valores[iteracion] = itemLectura.valor ;
             
              console.log(itemLectura.createdAt);
             
              var horaSt = String(itemLectura.createdAt);
            });
            console.log("fechas largo " + lecturas_valores[0]);

            console.log(item4.nombre);


var cxvcvc=[1,2,3,4,4];









            var config = {
              type: "line",

              data: {
                labels: lecturas_valores,
                datasets: [
                  {
                    label: "",
                    backgroundColor: window.chartColors.red,
                    borderColor: window.chartColors.red,
                    data: cxvcvc,
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

            var ctx = document.getElementById("canvas" + x).getContext("2d");
            window.myLine = new Chart(ctx, config);

            $.each(item3.actuadores, function (z, item4) {
              var valorAc = "";
              if (item4.valorLogico == "0") {
                valorAc = "OFF";
              }

              if (item4.valorLogico == "1") {
                valorAc = "ON";
              }

              $("#sca" + x).prepend(
                "<tr>" +
                  " <td>" +
                  item4.nombre +
                  "</td>" +
                  " <td> " +
                  valorAc +
                  "</tr>" +
                  "</tr>"
              );
            });
          });
        });
      });
    });
  });
});
