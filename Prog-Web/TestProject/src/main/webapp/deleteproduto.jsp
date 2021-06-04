<%@page import="epadaria.web.servlet.DBConnection"%>
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
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #943939;
}

.topnav a {
  float: right;
  display: block;
  color: #ffffff;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}


.topnav a:hover {
  background-color: #ffff;
  color: black;
}

.topnav a.active {
  background-color: #b36b6b;
  color: white;
  float: center;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: left;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}
</style>
<body>
<div class="topnav" id="myTopnav">
	<a href="http://localhost:8080/TestProject/addproduto.jsp">Inserir produto</a>
    <a href="http://localhost:8080/TestProject/deleteproduto.jsp"  class="active"  >Eliminar produto</a>
  	<a href="http://localhost:8080/TestProject/add_pedido.jsp" ">Adicionar pedido</a>
  	<a href="http://localhost:8080/TestProject/waitpedidos.jsp" >Pedidos em espera</a>
  	<a href="http://localhost:8080/TestProject/historicopedidos.jsp">Histórico de pedidos</a>
  
  	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  	</a>
</div>
	<div class="main" align="center">
		
		<h2> Selecione o produto que pretende eliminar</h2>
		<table>
			<tr>
				<th>Id</th>
				<th>Produto</th>
				<th>Preço</th>
				<th>Descrição</th>
				<th>Padaria</th>
			</tr>
		<%
		try(Connection con= DBConnection.createConnection();){
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement("Select * from stock");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
			%>
			<tr>
				<td><%= rs.getInt(1)%></td>
				<td><%= rs.getString(2)%></td>
				<td><%= rs.getString(3)%></td>
				<td><%= rs.getString(4)%></td>
				<td><%= rs.getString(5)%></td>
				
				<td> <a href="?delete=<%=rs.getInt(1) %>"> Eliminar</a></td>
				</tr>
			<%
			}
			
		} catch(Exception e) {
			System.out.println(e);
		}%>
		</table>
		
	</div>
	<%
	try( Connection con= DBConnection.createConnection(); ){
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