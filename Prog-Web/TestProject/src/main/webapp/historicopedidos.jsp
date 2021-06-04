<%@page import="epadaria.web.servlet.DBConnection"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Histórico de pedidos</title>
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
</head>

<body>
<div class="topnav" id="myTopnav">
	<a href="http://localhost:8080/TestProject/addproduto.jsp"  >Inserir produto</a>
    <a href="http://localhost:8080/TestProject/deleteproduto.jsp">Eliminar produto</a>
  	<a href="http://localhost:8080/TestProject/add_pedido.jsp" >Adicionar pedido</a>
  	<a href="http://localhost:8080/TestProject/waitpedidos.jsp" >Pedidos em espera</a>
  	<a href="http://localhost:8080/TestProject/historicopedidos.jsp"  class="active" >Histórico de pedidos</a>
  
  	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  	</a>
</div>
<% 
String id = request.getParameter("userId");


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
connection = DBConnection.createConnection();
statement=connection.createStatement();
String sql ="SELECT * from pedidos where Estado='Concluído'";

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