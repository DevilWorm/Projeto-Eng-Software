<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Padaria- Produtos</title>
</head>

<h3>Escreva o produto que pretende</h3>
	<form method="get">
		<p> Produto:</p>
		<input type="text" name="produtoo">
		<input type="submit" name="Query">
	</form>
<%
	String[] produtos=request.getParameterValues("nome");
	Class.forName("com.mysql.jdbc.Driver");
	String produto=request.getParameter("pnome");
	if(uthor !=null){
		connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
		Statement stmt=conn.createStatement();
		
		String str= "SELECT * FROM produtos WHERE nome IN("; str+= "'"+ produto+ "'";
		System.out.println("Query statement is" +str);
		Result.Set rset= stmt.executeQuery(str);
	}
	

%>
	
	
	<h3> Selecione os produtos a comprar</h3>
	<form method="get">
		<table border=1 cellpadding=5>
			<tr>
			<th>Nome</th>
			<th>Preço</th>
			</tr>	
		<%
		while(rset.next()){
			int id=rset.getInt("id");
		
		%>
		<tr>
		<td> <input type="checkbox" name="id" value="<%=id %>"></td>
		<td><%= rset.getString("nome") %></td>
		<td><%= rset.getString("preco") %></td>
		</tr>
		
		<%
			}
		%>
		
		</table>
		<br>
		<input type="submit" value="order">
		<input type="reset" value="clear">
		</form>
		<a href="<% request.getRequestURI() %>"><h3>Back</h3></a>
		
		<%
			rest.close();
			stmt.close();
			conn.close();
		%>
		
	<%
public int getId(){
	int currentId = -1;
	try{
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
		Statement stat = conn.createStatement();
		ResultSet rset = stat.executeQuery("select * from stock");
		
		
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
	<body>

</body>
</html>