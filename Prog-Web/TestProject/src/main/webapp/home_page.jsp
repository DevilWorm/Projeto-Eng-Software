<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*" 
		import = "java.util.*"
%>
<!DOCTYPE html>
<html>
<head>
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
 	}
 	.center {
	    text-align: center;
	}
	.center > div, .center > table /* insert any other block-level elements here */ {
	    margin-left: auto;
	    margin-right: auto;
	}
 	

  

</style>
<meta charset="ISO-8859-1">
<title>Home page</title>
</head>
<body>
	<div align="right">
		<table>
		<thead>
		<tr>
			<th>
				<a href="http://localhost:8080/TestProject/carrinho.jsp">
				<img src="https://i.imgur.com/xvXkEV7.png" alt="some text" width=40 height=40>
				</a>
			</th>
			<th>
				
					<a class = "poggie" href = "http://localhost:8080/TestProject/login.jsp">  Login In </a>
					<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp"> Sign Up </a>
				
			</th>
			
		</thead>
		</table>
	</div>
	<br>
	<center>
		<img src="https://i.imgur.com/sfDeVYR.png" alt="some text" width=192 height=96>
	</center>
	<br>
	<center>
		 <table  width="70%" cellpadding="8" table bgcolor="#943939" style="color:#ffffff" >
		 
		 	<thead>
		  	<tr>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Produtos</a></th>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Contactos</a></th>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/sobre_nos.jsp"> Sobre nós</a></th>
		  		
		  	</tr>
		  </thead>
		  </table>
	</center>

		<div>
			<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp">  Login In </a>
			<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp"> Sign Up </a>
		</div>
	</div>

	
	<div class = "center">
		<img src="https://i.imgur.com/sfDeVYR.png" alt="some text" width=192 height=96>
		<br>
		<table  width="70%" cellpadding="8" table bgcolor="#943939" style="color:#ffffff" >
			<thead>
				<tr>
			  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Produtos</a></th>
			  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Contactos</a></th>
			  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Sobre nós</a></th>
			  	</tr>
			</thead>
		</table>
	</div>
</body>
</html>