<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Document</title>
</head>
<body> 
    <div class="row">
        <div class=" a col-sm-12">
     <h1 class="tit">FLOW <br>MONITOR</h1>
     <img src="qq.png" width="200px" height="100px"><br>
     Sing in
        </div> 
        <div class=" b col-sm-12">
            
            <form action="/log" method="POST">
    <label>e-mail</label>
<br>
<input type="text" class="form-control" name="email"> 
<label>pass</label><br>
<input type="text"  class="form-control" name="pass"> <br>
<input type="submit"  class="form-control" value ="INGRESAR">  <br> 

</form>
</div>
</div>
</body>
</html>

<style>
    @font-face {
  font-family: "a";
  src: url("a.otf");
}
@font-face {
  font-family: "na";
  src: url("na.ttf");
}
@font-face {
  font-family: "b";
  src: url("b.ttf");
}
    body{background:#2A3A99;

     background-image: url("segunda.png");
      
    color: white;
font-size:28px;
text-shadow: 2px 2px rgba(0,0,0,0.2);
background-size: 100% 100%;
    }
.a{
color: white;
text-align: center;
  
    margin-top: 10%;
    
}
input[type="text"]{background:transparent;
border:none;
border: 2px solid #15C39A;

width:90%;

font-size:28px;
text-shadow: 2px 2px rgba(0,0,0,0.2);
background:#2A3A99;
}
.tit{font-family: "na";}
input[type="text"]:active, input[type="text"]:focus{
    background:transparent;

border: 2px solid #15C39A;
color: white;
width:90%;
font-size:28px;

text-shadow: 2px 2px rgba(0,0,0,0.2);
}

input[type="submit"]{

    width:90%;
    color: white ;
    background:  #15C39A;;
    border: none;

   
    font-size:38px;
    text-shadow: 2px 2px rgba(0,0,0,0.2);
}
.label{
  
}
.b{padding: 10%;align-items: center; 

}

</style>