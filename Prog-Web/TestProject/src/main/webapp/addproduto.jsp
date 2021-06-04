<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
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
	<a href="http://localhost:8080/TestProject/login.jsp" class="active" >Inserir produto</a>
    <a href="http://localhost:8080/TestProject/deleteproduto.jsp">Eliminar produto</a>
  	<a href="http://localhost:8080/TestProject/add_pedido.jsp" ">Adicionar pedido</a>
  	<a href="http://localhost:8080/TestProject/waitpedidos.jsp" >Pedidos em espera</a>
  	<a href="http://localhost:8080/TestProject/historicopedidos.jsp">Hist�rico de pedidos</a>
  
  	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  	</a>
</div>
<% Class.forName("com.mysql.cj.jdbc.Driver");  %>
	<div align="center">
	<H3> Adiconar produto</H3>
	<br> <br>
	<form method="get">
		        <table style="color:#943939">
			        <thead>
			        <tr>
			        		<td style = "text-align:right">ID:</td>
			        		<th><input type = "text" name = "id" id = "id"></th>			        	
			        	</tr>
			        	<tr>
			        		<td style = "text-align:right">Nome:</td>
			        		<th><input type = "text" name = "nome" id = "nome"></th>			        	
			        	</tr>
			        	<tr>
			        		<td style = "text-align:right">Quantidade:</td>
			        		<th><input type = "text" name = "qty" id = "qty"></th>			        	
			        	</tr>
				        <tr>
				            <td style="text-align:right">Pre�o:</td>
				            <th><input type = "text" name="preco" id = "preco"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Descri��o:</td>
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
	
	
	
	 try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "rita0412");){
	
		PreparedStatement preparedStatement = conn.prepareStatement("insert into stock value(?,?,?,?,?,?)");
		
			try{
				
					
				preparedStatement.setString(1,id);	
				preparedStatement.setString(2,nome);
				preparedStatement.setString(3,qty);
				preparedStatement.setString(4,preco);
				preparedStatement.setString(5,descricao);
				preparedStatement.setString(6,padaria);
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