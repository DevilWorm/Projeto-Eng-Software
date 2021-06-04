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
	<div class="main" align="center">
		
		<h2> Selecione o produto que pretende eliminar</h2>
		<table>
			<tr>
				<th>Id</th>
				<th>Produto</th>
				<th>Quantidade</th>
				<th>Preço</th>
				<th>Padaria</th>
			</tr>
		<%
		 Class.forName("com.mysql.cj.jdbc.Driver");  
		try{
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
		PreparedStatement pstmt=null;
		pstmt=con.prepareStatement("Select * from stock");
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
		%>
		<tr>
			<td><%= rs.getInt(1)%></td>
			<td><%= rs.getString(2)%></td>
			<td><%= rs.getInt(3)%></td>
			<td><%= rs.getString(4)%></td>
			<td><%= rs.getString(5)%></td>
			
			<td> <a href="?delete=<%=rs.getInt(1) %>"> Eliminar</a></td>
			</tr>
		<%
		}
		
		} catch(Exception e)
		{
			System.out.println(e);
		}
		
		%>
		</table>
		
	</div>
	<%
	try{
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "rita0412");
		 if(request.getParameter("delete") != null){
		 	int id = Integer.parseInt(request.getParameter("delete"));
		 	PreparedStatement pstmt=null;
		 	pstmt=con.prepareStatement("delete from stock where id=?");
			pstmt.setInt(1,id);
			pstmt.executeUpdate();
			
			con.close();
		}
	} catch(Exception e){
		System.out.println(e);
	}
	
	%>
	
</body>
</html>