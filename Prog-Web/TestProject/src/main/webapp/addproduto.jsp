<%@page import="epadaria.web.servlet.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=Windows-1252"
    pageEncoding="Windows-1252"%>
 
 <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adicionar produto</title>
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
	<a href="http://localhost:8080/TestProject/addproduto.jsp" class="active" >Inserir produto</a>
    <a href="http://localhost:8080/TestProject/deleteproduto.jsp">Eliminar produto</a>
  	<a href="http://localhost:8080/TestProject/add_pedido.jsp" ">Adicionar pedido</a>
  	<a href="http://localhost:8080/TestProject/waitpedidos.jsp" >Pedidos em espera</a>
  	<a href="http://localhost:8080/TestProject/historicopedidos.jsp">Histórico de pedidos</a>
  
  	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  	</a>
</div>
	<div align="center">
	<H3> Adicionar produto</H3>
	<br> <br>
	<form method="post">
		        <table style="color:#943939">
			        <thead>
			       		<tr>
			        		<td style = "text-align:right">Id:</td>
			        		<th><input type = "text" name = "id" id = "id"></th>			        	
			        	</tr>
			        	<tr>
			        		<td style = "text-align:right">Nome:</td>
			        		<th><input type = "text" name = "nome" id = "nome"></th>			        	
			        	</tr>
				        <tr>
				            <td style="text-align:right">Preço(Un.):</td>
				            <th><input type = "text" name="preco" id = "preco"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Descrição:</td>
				            <th><input type = "text" name="descricao" id = "descricao"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Padaria:</td>
				            <th><input type = "text" name="padaria" id = "padaria"></th>
				        </tr>
				       
				      
			        </thead>
		        </table>
		        <br>
		        <button class = "w3-button poggie" name = "add_produto" value = null>Adicionar</button>
     	    </form>
<% 


     	  if(request.getParameter("add_produto")!= null){
     		 	String id = request.getParameter("id");
     		 	String nome = request.getParameter("nome");
     		 	String qty = request.getParameter("qty");
				String preco = request.getParameter("preco");
				String descricao = request.getParameter("descricao");
				String padaria = request.getParameter("padaria");
				
		try(Connection conn = DBConnection.createConnection();){
			try{
				PreparedStatement preparedStatement = conn.prepareStatement("insert into stock values (?,?,?,?,?)");
				preparedStatement.setInt(1, Integer.parseInt(id));
				preparedStatement.setString(2,nome);
				preparedStatement.setString(3,preco);
				preparedStatement.setString(4,padaria);
				preparedStatement.setString(5,descricao);
				preparedStatement.executeUpdate();
		}catch(ArrayIndexOutOfBoundsException e){
			System.out.println(e);
		}		
	}
}

%>



  	    

	</div>
	

</body>
</html>