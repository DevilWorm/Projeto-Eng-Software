<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<style>
	.poggie {
	 
	  border: 10px;
	  color: #943939;
	  padding: 10px 27px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  
	  margin: auto;
	}
	body {
 	 background-color:#f5ecd0;}

</style>
<style>
	.poggie {
	 
	  border: 10px;
	  color: #943939;
	  padding: 10px 27px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  
	  margin: auto;
	}
	body {
 	 background-color:#f5ecd0;
 	  h1   {color: #943939;}
 	}
 	.center {
	    text-align: center;
	}
	.center > div, .center > table /* insert any other block-level elements here */ {
	    margin-left: auto;
	    margin-right: auto;
	}
 	</style>
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #943939;
}

.topnav a {
  float: right;
  display: block;
  color: #ffffff;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}


.topnav a:hover {
  background-color: #ffff;
  color: black;
}

.topnav a.active {
  background-color: #b36b6b;
  color: white;
  float: center;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: left;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>

<meta charset="ISO-8859-1">
<title>Sobre n�s</title>
</head>
<body>
	<div class="topnav" id="myTopnav">
	<%  if(session.getAttribute("User") == null){ %>	
			<a href="http://localhost:8080/TestProject/login.jsp" ><img src="https://i.imgur.com/TYyFXOr.png" alt="some text" width=20 height=20></a>
	<%	}else{ %>
			<a href="http://localhost:8080/TestProject/LogoutServlet"> <%= session.getAttribute("User") %> </a> 
	<% 	} %>
    <a href="http://localhost:8080/TestProject/stock.jsp"><img src="https://i.imgur.com/06MKgJl.png" alt="some text" width=20 height=20></a>
  	<a href="http://localhost:8080/TestProject/home_page.jsp" >Home</a>
  	<a href="http://localhost:8080/TestProject/stock.jsp" >Produtos</a>
  	<a href="http://localhost:8080/TestProject/sobre_nos.jsp" class="active">Sobre n�s</a>
  	<a href="http://localhost:8080/TestProject/padarias.jsp">Padarias</a>
  	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  	</a>
	</div>
<br><br><br>


	<div align="center">
		<h2><u>Qual � o nosso objetivo?</u></h2>
		<table  width="70%" cellpadding="8" >
		 
		 	<thead>
		  	<tr>
		
				<th><h5> O nosso sistema tem como objetivo ajudar as padarias de pequena dimens�o a melhor organizarem o seu neg�cio e ajudar os clientes dos mesmos a mais facilmente fazerem os seus pedidos.</h5></th>
			</tr>
			<tr>
				<th><img src="https://i.imgur.com/14LLvWa.jpeg"></th>
			</tr>
			
				<th><h2><u> Hist�ria</u></h2></th>
			</tr>
		
			<tr>
				<th><h5> O ePadaria veio do inicio de um projeto pela cadeira de Desenho e Analise de Sistemas e que agora deu continuidade com as cadeiras de Base de dados e Programa��o para web.</h5></th>
			</tr>
			 </thead>
		  </table>
		
		</div>
		<br><br><br><br>
	<!-- Footer -->
	<footer class="w3-container w3-padding-50 w3-center w3-brown w3-xlarge">
		<h5><u>Siga-nos em:</u></h5>
  		<a href="https://www.facebook.com/EPadaria-101399275434399"><i class="fa fa-facebook-official"></i></a>
  		<h5> <u>Contactos:</u></h5>
  		<h6> Telefone geral: 224 233 105</h6>
  		<h6>E-mail: ePadaria@gmail.com</h6>
  		<img src="https://i.imgur.com/sfDeVYR.png" width=192 height=96>
  		<p class="w3-medium">
  		</p>
	</footer>	
</body>
</html>