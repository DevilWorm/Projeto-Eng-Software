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
	  background-color: #806b60; /* Green */
	  border: 10px;
	  color: white;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  
	  margin: auto;
	}
	body {
 	 background-color:#f5ecd0;}

  

</style>
<meta charset="ISO-8859-1">
<title>Sign up Page</title>
</head>
<body>
	<div>
		<a class = "poggie" href = "http://localhost:8080/TestProject/login.jsp"> Login In </a>
		<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp"> Sign Up </a>
	</div>
	<center>
	<img src="https://i.imgur.com/sfDeVYR.png" alt="some text" width=192 height=96>
	
		 <table  width="35%" cellpadding="5" table bgcolor="#806b60" style="color:#ffffff" >
		 	<thead>
		  	<tr>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Produtos</a></th>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Contactos</a></th>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Sobre nós</a></th>
		  		
		  	</tr>
		  </thead>
		  </table>
	</center>
	
</body>
</html>