<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="ISO-8859-1">
<title>Sign up Page</title>
</head>
<p><%= new java.util.Date() %></p>
</head>
	<h3> Query books</h3>
	<form method="get">
		<p>Author:</p>
		<input type="text" name="produto">
		<input type="submit" name="Procurar">
	</form>
	<%
		String[] authors=request.getParameterValues("produto");
		Class.forName("com.mysql.jdbc.Driver");
		String author=request.getParameter("pproduto");
		if(produto!= null){
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
			Statement stmt=conn.createStatement();
			
			String str="SELECT * FROM stock WHERE produto IN("; 
			str+="'" +produto + "'";
			
			str+=") AND qty > 0 ORDER BY produto ASC";
			
			System.out.println("Query statement is " + str);
			ResultSet rset= stmt.executeQuery(str);
		}
	%>
	<hr>
	<form method="get" action="orderbooks.jsp">
	<table border=1 cellpadding=5>
		<tr>
			<th>Order</th>
			<th>Nome produto</th>
			<th>Quantidade</th>
			<th>Preço</th>
		</tr>
	<%
	while(rset.next()){
		int id=rset.getInt("id");
	
	%>
		<tr>
			<td><input type="checkbox" name="id" value="<%= id %>"></td>
			<td><%=rset.getString("produto") %></td>
			<td><%=rset.getString("preco") %></td>
			<td><%=rset.getString("preco") %></td>
		</tr>
	<%
	}
	%>	
			
	</table>
	<br>
	<input type="submit" value="Adicionar ao Carrinho">
	<input type="submit" value="Limpar">
	</form>
	<a href="<%= request.getRequestURI() %>"><h3>Back</h3></a>
<%
	rset.close();
	rset.close();
	rset.close();

%>
<body>
	<p align="right">
	<div>
		<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp">  Login In </a>
		<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp"> Sign Up </a>
	</div>
	</p>
	
	<center>
	<img src="https://i.imgur.com/sfDeVYR.png" alt="some text" width=192 height=96>
	</center>
	<br>
	<center>
		 <table  width="70%" cellpadding="8" table bgcolor="#943939" style="color:#ffffff" >
		 
		 	<thead>
		  	<tr>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Produtos</a></th>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Contactos</a></th>
		  		<th><a style="color:#ffffff" href = "http://localhost:8080/TestProject/stock.jsp"> Sobre nós</a></th>
		  		
		  	</tr>
		  </thead>
		  </table>
	</center>


</body>
</html>