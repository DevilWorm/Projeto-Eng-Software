<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");  %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Loja</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<body>
	<div class="topnav" id="myTopnav">
	<a href="http://localhost:8080/TestProject/login.jsp" ><img src="https://i.imgur.com/TYyFXOr.png" alt="some text" width=20 height=20></a>
    <a href="http://localhost:8080/TestProject/stock.jsp" class="active" ><img src="https://i.imgur.com/06MKgJl.png" alt="some text" width=20 height=20></a>
  	<a href="http://localhost:8080/TestProject/home_page.jsp" >Home</a>
  	<a href="http://localhost:8080/TestProject/contactos.jsp">Contactos</a>
  	<a href="http://localhost:8080/TestProject/sobre_nos.jsp">Sobre nós</a>
  	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  	</a>
</div>
<br><br><br>
<center>
<img src="https://i.imgur.com/sfDeVYR.png" alt="some text" width=192 height=96>
</center>

	
	<div  align="center">
	<% if(session == null || session.getAttribute("loggedInUser") == null){
	%>
		<h3>Not logged in</h3
	<% }else{ %>
	<%
			try( Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
				Statement stat = conn.createStatement();){
				ResultSet rset = stat.executeQuery("SELECT * FROM pedidos"); %>
			<table border="1">
				<tr>
					<th>Nº do Pedido</th>
					<th>Hora de Entrega</th>
					<th>Data de Entrega</th>
					<th>Tipo de Pagamento</th>
					<th>Morada</th>
					<th>Quantidade</th>
				</tr>	
			<%
				while (rset.next()){
					int pedido = rset.getInt("nr_pedido");
					String hora = rset.getString("hora_entrega");
					String data = rset.getString("data_entrega");
					String tipo = rset.getString("tipo_pagamento");
					String morada = rset.getString("morada_entrega");
					int qty = rset.getInt("qty");
			%>
				<tr>
					<td><%= pedido %>
					<td><%= hora %>
					<td><%= data %>
					<td><%= tipo %>
					<td><%= morada %>
					<td><%= qty %>
				</tr>
		<% } %>
		</table>
		<br>
		<%      
			
			stat.close();
			conn.close();
			rset.close();
			}catch(SQLException e) { System.out.println(e);}
		}
		%>
	</div>
</body>
</html>