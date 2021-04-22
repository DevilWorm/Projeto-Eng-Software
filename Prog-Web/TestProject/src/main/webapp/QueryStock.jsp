<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");  %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Produto Query</title>
	</head>
	<h3>Query Produtos</h3>
	<form>
		<p>Produto:</p>
		<input type="text" name="produto">
		<input type="submit" value="Query">
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
				ResultSet rset = stat.executeQuery(str);
				
			
	%>
	<form>
		<table>
			<tr>
				<th>Produto</th>
				<th>Quantidade</th>
				<th>Preço</th>
				<th>Padaria</th>
			</tr>
			
			<%
				while(rset.next()){
					int id = rset.getInt("id");	
			%>
			<tr>
				<td><input type = "checkbox" name = "id" value ="<%= id %>"></td>
				<td><%= rset.getString("produto") %></td>
				<td><%= rset.getInt("qty") %></td>
				<td><%= rset.getString("preco") %></td>
				<td><%= rset.getString("padaria") %></td>
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
			}catch(SQLException e){
				System.out.print(e);
			}
		}
	%>
		
</html>