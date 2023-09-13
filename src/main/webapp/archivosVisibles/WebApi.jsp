
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>
$(document).ready(function(){

	$.ajax({
    type:"GET", 
    url:'api/users/',
    dataType:"json",
    crossDomain:true,
    crossOrigin:true,
    success:function(data){
console.log(data)




        $.each(data,function(i,item){
            var row = "<tr>" +
                "<td>"+ i+  "</td>"+
                        
                "<td>"+ item.nombre +  "</td>"+
                    "<td>"+ item.email + "</td>"+
                    "<td>"+ item.granjas[0].descripcion +"</td>"+
                    "<tr>";
                        $("#tabla>tbody").append(row);
        })


    }
})})






</script>





</head>
<body>
    <table id="tabla">
        <thead>
            <th>ID</th>
            <th>title</th>
            <th>BODY</th>
            

            </thead>
        <tbody></tbody>
        </table>
</body>
</html>