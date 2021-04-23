<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Login Funcionário</title>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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


<br><br><br>

	<div align="center" >
	<h2>Login Funcionário</h2>
	<br>
	
		<form method="get">
		<table style="color:#943939">
		<thead>
		<tr>
			<th>E-mail</th>
			<th><input name="user" value=""></th>
		</tr>
		<tr>
			<th>Password</th>
			<th><input type = "password" name="password"></th>
		</tr>
		</thead>
		</table>
		<br>
			<button class = "poggie" name = "login" value = null>Login!</button>
		</form>
	</div>
	<%
			if(request.getParameter("login") != null){
				String user = request.getParameter("user");
				String pwd = request.getParameter("password");
				
				try{
					Class.forName("com.mysql.cj.jdbc.Driver"); 
					Connection conn = DriverManager.getConnection("jdbc:mysql://77.54.229.5:3306/epadaria","admin", "vasc1234");
					Statement stat = conn.createStatement();
					ResultSet rset = stat.executeQuery("select * from clientes");
					boolean userCheck = false;
					while(rset.next()){
						//System.out.println(rset.getString(2) + "=" + user + "|" + rset.getString(3) + "=" + pwd);
						if(rset.getString("nome").equals(user) && rset.getString("password").equals(pwd)){
							//logged in!
							System.out.println("Found a user!");
							request.getSession().setAttribute("loggedInUser", user);
							response.sendRedirect("http://localhost:8080/TestProject/page_func.jsp");
							userCheck = true;
						}
					}
					
					if(userCheck == false){
		%>
					<p> Try signing a new account! </p>
					<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp"> Sign Up </a>
		<%}
					
					
					System.out.println("Connected!");	
				}catch(SQLException e) {
					System.out.println("Bad Connection -" + e);
				}
			}
		%>
<br>
<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp">  Login In </a>
	
</body>
</html>