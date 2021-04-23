<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"  %>
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
<% Class.forName("com.mysql.cj.jdbc.Driver");  %>

<meta charset="ISO-8859-1">
<title>Sign in</title>
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
		<a href="http://localhost:8080/TestProject/home_page.jsp">
		<img src="https://i.imgur.com/sfDeVYR.png" alt="some text" width=192 height=96>
		</a>
	</center>
	<br>
	<center>
		 <table  width="70%" cellpadding="8" table bgcolor="#943939" style="color:#ffffff" >
		 
		 	<thead>
		  	<tr>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Produtos</a></th>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/contactos.jsp"> Contactos</a></th>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/sobre_nos.jsp"> Sobre nós</a></th>
		  		
		  	</tr>
		  </thead>
		  </table>
	</center>
	
	<br>
	

<div align="center" >
	<center>
       <table>
           	<thead>
               <tr>
                   <th colspan="2">Preencha os campos</th>
               </tr>
           	</thead>
			<form method="get">
		        <table style="color:#943939">
			        <thead>
			        	<tr>
			        		<td style = "text-align:right">Nome:</td>
			        		<th><input type = "text" name = "nome" id = "nome"></th>			        	
			        	</tr>
				        <tr>
				            <td style="text-align:right">E-mail:</td>
				            <th><input type = "text" name="email" id = "email"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Morada:</td>
				            <th><input type = "text" name="morada" id = "morada"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Número de telémovel:</td>
				            <th><input type = "text" name="nr_tel" id = "nr_tel"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Data de nascimento:</td>
				            <th><input type = "date" name="datanasc" id = "datanasc"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">NIF:</td>
				            <th><input type = "number" name="nif" id = "nif"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Password:</td>
				            <th><input type = "password" name="pwd1" id = "pwd1"></th>
				        </tr>
				         <tr>
				            <td style="text-align:right">Confirmar password:</td>
				            <th><input type = "password" name="pwd2" id = "pwd2"></th>
				        </tr>
			        </thead>
		        </table>
		        <br>
		        <button class = "w3-button poggie" name = "signin" value = null>Sign up!</button>
     	    </form>
	<%
			if(request.getParameter("signin") != null){
				try(
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
					PreparedStatement preparedStatement = conn.prepareStatement("insert into clientes value(?,?,?,?,?,?,?,?)");			
				){
					String nome = request.getParameter("nome");
					String email = request.getParameter("email");
					String pwd1 = request.getParameter("pwd1");
					String pwd2 = request.getParameter("pwd2");
					String morada = request.getParameter("morada");
					String tel = request.getParameter("nr_tel");
					String datan = request.getParameter("datanasc");
					String nif = request.getParameter("nif");
					if(pwd1.length() >= 8){
						try{
							preparedStatement.setInt(1, Integer.parseInt(nif));
							preparedStatement.setString(2,email);
							preparedStatement.setString(3,pwd1);
							preparedStatement.setString(4,datan);
							preparedStatement.setString(5,nome);
							preparedStatement.setString(6,tel);
							preparedStatement.setString(7,morada);
							preparedStatement.setString(8, "Empty");
							preparedStatement.executeUpdate();
							
							System.out.println("Done?");
							response.sendRedirect("http://localhost:8080/TestProject/home_page.jsp");
						}catch(Exception e){
							System.out.println("Out of bounds!");
							response.sendRedirect("http://localhost:8080/TestProject/signup.jsp");
						}
					}
				}catch(SQLException e){System.out.println(e);}
			}else{
				System.out.println("Now we here");
			}
			
		%>
</div>
</body>
</html>