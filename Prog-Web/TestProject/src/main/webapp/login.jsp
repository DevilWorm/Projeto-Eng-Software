<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.poggie {
	  background-color: #4CAF50; /* Green */
	  border: none;
	  color: white;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  
	  margin: auto;
	}

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

%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="get">
		E-mail<input name="user" value="">Password<input type = "password" name="password"><br><br>
		<button class = "poggie" name = "login" value = null>Login!</button>
	</form>

	<%
			if(request.getParameter("login") != null){
				String user = request.getParameter("user");
				String pwd = request.getParameter("password");
				
				try{
					Class.forName("com.mysql.cj.jdbc.Driver"); 
					Connection conn = DriverManager.getConnection("jdbc:mysql://77.54.229.5:3306/epadaria","admin", "vasc1234");
					Statement stat = conn.createStatement();
					ResultSet rset = stat.executeQuery("select * from users");
					boolean userCheck = false;
					while(rset.next()){
						//System.out.println(rset.getString(2) + "=" + user + "|" + rset.getString(3) + "=" + pwd);
						if(rset.getString(2).equals(user) && rset.getString(3).equals(pwd)){
							//logged in!
							System.out.println("Found a user!");
							response.sendRedirect("http://localhost:8080/TestProject/page2.jsp");
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
		
		
</body>
</html>