<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.sql.*"  %>
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
<div>
	<form method="get">
		E-mail<input name="user" value="">Password<input type = "password" name="password"><br><br>
		<button class = "poggie" name = "signin" value = null>Sign in</button>
	
	</form>
	<%
			if(request.getParameter("signin") != null){
				String user = request.getParameter("user");
				String pwd = request.getParameter("password");
				
				Class.forName("com.mysql.cj.jdbc.Driver"); 
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");

				PreparedStatement preparedStatement = conn.prepareStatement("insert into users value(?,?,?)");
				if(user.contains("@") && pwd.length() >= 8){
					try{
						if(user.split("@")[1].equals("hotmail.com") && user.split("@")[0].equals("") == false){
							
							preparedStatement.setInt(1, getId());
							preparedStatement.setString(2,user);
							preparedStatement.setString(3,pwd);
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