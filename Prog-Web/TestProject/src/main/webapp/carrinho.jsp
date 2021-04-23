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
				<br>
					<a class = "poggie" href = "http://localhost:8080/TestProject/login.jsp">  Login In </a>
					<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp"> Sign Up </a>
				
			</th>
			
		</thead>
		</table>
	</div>
	<br>
	<center>
		<a href="http://localhost:8080/TestProject/home_page.jsp">
		<img src="https://i.imgur.com/sfDeVYR.png" alt="some text" width=192 height=96>
		</a>

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