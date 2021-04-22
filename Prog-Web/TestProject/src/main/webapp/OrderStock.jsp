<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order stock</title>
</head>
<body>
	<h1>Epadaria</h1>
	<%
	  String[] ids = request.getParameterValues("id");
	if (ids != null) 
	%>
	<%@ page import = "java.sql.*" %> 
	<% 
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
	Statement stmt = conn.creatStatement();
	String str;
	int recordUpdated;
	ResultSet rset;
	%>
	
	<table border=1 cellpadding=3 cellspacing=0>
	<tr>
	<th>Produto</th>
	<th>Quantidade</th>
	<th>Preço</th>
	
<%
	for (int i = 0; i < ids.length; ++i) {
		str = "UPDATE stock SET qty = qty - 1 WHERE id = " + ids[i];
		recordUpdated = stmt.executeUpdate(str);~
		str = "SELECT * FROM stock WHERE id =" + ids[i];
		rset = stmt.executeQuery(str);
		while (rset.next()){
	
%>
		<tr>
		<td><%= rset.getString("id") %>
		<td><%= rset.getString("produto") %>
		<td><%= rset.getString("qty") %>
		<td><%= rset.getString("preco") %>
		<td><%= rset.getString("padaria") %>
		</tr>
		}
<%      rset.close();
	}
	stmt.close();
	conn.close();
	}

%>
</table>
<a href="QueryStock.jsp"><h3>Query again</h3></a>
</body>
</html>