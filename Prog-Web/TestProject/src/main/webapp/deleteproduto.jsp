<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Produto</title>
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
<div align="center">
	<form method="get">
		<p> Indique o nome do produto a eliminar:</p>
		<input type="text" name="produto">
		<input type="submit" name="Eliminar">
	</form>
</div>
	<%
		String[] authors=request.getParameterValues("produto");
		Class.forName("com.mysql.jdbc.Driver");
		String author=request.getParameter("produto");
		if(author!= null){
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "rita0412");
			Statement stmt=conn.createStatement();
			
			String str="SELECT * FROM stock WHERE produto IN("; 
			str+="'" +produto + "'";
			
			str+=") AND qty > 0 ORDER BY produto ASC";
			
			System.out.println("Query statement is " + str);
			ResultSet rset= stmt.executeQuery(str);
		
	%>
	
	<hr>
	<form method="get" action="Orderbooks.jsp">
	<table border=1 cellpadding=5>
		<tr>
			<th>Order</th>
			<th>Author</th>
			<th>Title</th>
			<th>Price</th>
			<th>Stock</th>
		</tr>
	<%
	while(rset.next()){
		int id=rset.getInt("id");
	
	%>
		<tr>
			<td><input type="checkbox" name="id" value="<%= id %>"></td>
			<td><%=rset.getString("author") %></td>
			<td><%=rset.getString("title") %></td>
			<td><%=rset.getString("price") %></td>
			<td><%=rset.getString("qty") %></td>
		</tr>
	<%
	}
	%>	
	
</body>
</html>