<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<%!

	public int getId(){
		int currentId = -1;
		try{
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
			Statement stat = conn.createStatement();
			ResultSet rset = stat.executeQuery("select * from users");
			
			
			while(rset.next()){
				currentId = rset.getInt(1);
			}
			System.out.println("Connected!");	
		}catch(SQLException e) {
			System.out.println("Bad Connection -" + e);
		}
		return currentId + 1;
	}

	/* public boolean checkEmail(String email){
		//load all email endings wtv
		for(int i = 0; i < allemails.length(); i++)
			if ( email.contains(allemails[i]) ) //"@hotmail.com"
				return true;
			else
				return false;
	} */

%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<h2>Preencha os campos</h2>
	<br>
	
		<form method="get">
		<table style="color:#943939">
		<thead>
		<tr>
			<th>E-mail</th>
			<th><input name="user" value=""></th>
		</tr>
		<tr>
			<th>Morada</th>
			<th><input type = "morada" name=""></th>
		</tr>
		<tr>
			<th>Número de telemóvel</th>
			<th><input type = "nr_tel" name=""></th>
		</tr>
		<tr>
			<th>Data de Nascimento</th>
			<th><input type = "datanasc" name=""></th>
		</tr>
		<tr>
			<th>NIF</th>
			<th><input type = "nif" name=""></th>
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
	
	
	</form>
	<%
			if(request.getParameter("signin") != null){
				String user = request.getParameter("user");
				String pwd = request.getParameter("password");
				String morad = request.getParameter("morada");
				String tel = request.getParameter("nr_tel");
				String datan = request.getParameter("datanasc");
				String niff = request.getParameter("nif");
				
				Class.forName("com.mysql.cj.jdbc.Driver"); 
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");

				PreparedStatement preparedStatement = conn.prepareStatement("insert into users value(?,?,?)");
				if(user.contains("@") && pwd.length() >= 8){
					try{
						if(user.split("@")[1].equals("hotmail.com") && user.split("@")[0].equals("") == false){
							
							preparedStatement.setInt(1, getId());
							preparedStatement.setString(2,user);
							preparedStatement.setString(3,morad);
							preparedStatement.setString(4,tel);
							preparedStatement.setString(5,datan);
							preparedStatement.setString(6,niff);
							preparedStatement.setString(7,pwd);
							preparedStatement.executeUpdate();
							
							response.sendRedirect("http://localhost:8080/TestProject/page2.jsp");	
						}	
					}catch(ArrayIndexOutOfBoundsException e){
						System.out.println("Out of bounds!");
						response.sendRedirect("http://localhost:8080/TestProject/signup.jsp");
					}
				}
			}
		%>
</div>
</body>
</html>