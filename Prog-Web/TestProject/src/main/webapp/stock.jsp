<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");  %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Loja</title>
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
	<h3>Escolher Produtos</h3>
	<form>
		<p>Produto:</p>
		<input type = "text" name = "produto">
		<input type = "submit" name = "Procurar">
	</form>
	<%
		String [] produtos = request.getParameterValues("produtos");
		String produto = request.getParameter("produto");
		if (produto != null){
			try( Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
				Statement stat = conn.createStatement();){
				
				String str = "SELECT * FROM stock WHERE produto IN (";
				str += "'" + produto + "'";
				str += ") AND qty > 0 ORDER BY produto ASC";
				
				System.out.println("Query statement is " + str);
				ResultSet rset = stat.executeQuery(str); %>
		<form>
			<table>
				<tr>
					<th>Comprar</th>
					<th>Produto</th>
					<th>Quantidade</th>
					<th>Preço</th>
					<th>Padaria</th>
				</tr>	
		<%
				while (rset.next()){
					int id = rset.getInt("id");
		%>
				<tr>
					<td><input type = "checkbox" name = "id" value = "<%= id%>"></td>
					<td><%= rset.getString("produto") %>
					<td><%= rset.getString("qty") %>
					<td><%= rset.getString("preco") %>
					<td><%= rset.getString("padaria") %>
				</tr>
		<% } %>
		</table>
		<br>
		<input type = "submit" value = "Order">
		<input type = "reset" value = "Clear">
	</form>
<%      
			rset.close();
			stat.close();
			conn.close();
			}catch(SQLException e) { System.out.println(e);}
	}

%>
<a href="home_page.jsp"><h3>Go to home</h3></a>
</body>
</html>