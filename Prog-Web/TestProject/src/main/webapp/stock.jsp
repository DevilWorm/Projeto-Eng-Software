<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
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
				<br>
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
	
	<div  align="center">
	<% if(session == null || session.getAttribute("loggedInUser") == null){
		%>
		<h3>Not logged in</h3
	<% }else{ %>
	
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
		<form method = "GET">
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
					<td><input type = "number" name = "qty">
					<td><%= rset.getString("preco") %> €
					<td><%= rset.getString("padaria") %>
				</tr>
		<% } %>
		</table>
		<br>
		<button class = "w3-button poggie" name = "checkout" value = null>Checkout</button>		
	</form>
		<%      
			
			stat.close();
			conn.close();
			rset.close();
			}catch(SQLException e) { System.out.println(e);}
		}
		%>
		<%
		try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");){
			if(request.getParameter("checkout") != null){
				String[] ids = request.getParameterValues("id");
				String[] qty = request.getParameterValues("qty");
				if(ids != null){
					for(int i = 0; i < ids.length; i++){
							PreparedStatement prep = conn.prepareStatement("insert into pedidos value(?,?,?,?,?,?)");
							prep.setObject(2, LocalDate.now());
							prep.setObject(1, LocalTime.now());
							prep.setInt(3, Integer.parseInt(ids[i]));
							prep.setString(4,"Empty For Now");
							prep.setString(5, "Morada de Entrega");
							prep.setInt(6, Integer.parseInt(qty[i]));
							prep.executeUpdate();
					}
				}
			}
		}catch(SQLException e){System.out.println(e);}
		
	}%>
	</div>
</body>
</html>