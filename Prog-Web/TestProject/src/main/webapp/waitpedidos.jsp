<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");  %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Histórico de pedidos</title>
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

<body>


<% 
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "database_epadaria";
String userId = "root";
String password = "1475963";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<h2 align="center"><font><strong>Histórico de pedidos</strong></font></h2>
<table align="center" cellpadding="8" cellspacing="8" border="1">

<tr>
<td><b>NIF</b></td>
<td><b>Número de pedido</b></td>
<td><b>Quantidade</b></td>
<td><b>Data</b></td>
<td><b>Hora</b></td>
<td><b>Preço</b></td>
<td><b>Pagamento</b></td>
<td><b>Estado</b></td>
</tr>

<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "rita0412");
statement=connection.createStatement();
String sql ="SELECT * from pedidos where estado='Em processamento'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<tr>

<td><%=resultSet.getString("nif") %></td>

<td><%=resultSet.getString("nr_pedidos") %></td>

<td><%=resultSet.getString("quantidade") %></td>

<td><%=resultSet.getString("data_levantamento") %></td>

<td><%=resultSet.getString("hora_levantamento") %></td>

<td><%=resultSet.getString("preco_total") %></td>

<td><%=resultSet.getString("tipo_pagamento") %></td>

<td><%=resultSet.getString("Estado") %></td>

</tr>

<% 
}
connection.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>
</table>
	

</body>
</html>