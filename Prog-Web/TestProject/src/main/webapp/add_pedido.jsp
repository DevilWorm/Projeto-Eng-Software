<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<title>Adicionar um pedido</title>
</head>
<body>
<div class="topnav" id="myTopnav">
	<a href="http://localhost:8080/TestProject/addproduto.jsp"  >Inserir produto</a>
    <a href="http://localhost:8080/TestProject/deleteproduto.jsp">Eliminar produto</a>
  	<a href="http://localhost:8080/TestProject/add_pedido.jsp" class="active">Adicionar pedido</a>
  	<a href="http://localhost:8080/TestProject/waitpedidos.jsp" >Pedidos em espera</a>
  	<a href="http://localhost:8080/TestProject/historicopedidos.jsp">Histórico de pedidos</a>
  
  	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  	</a>
</div>

	<div align="center">
	<form method="get">
	
				<H3> Adiconar produto</H3>
				<br><br>
		        <table style="color:#943939">
			        <thead>
			        	<tr>
			        		<td style = "text-align:right">Número pedido:</td>
			        		<th><input type = "text" name = "nr_pedido" id = "nr_pedido"></th>			        	
			        	</tr>
				        <tr>
				            <td style="text-align:right">Nome do cliente:</td>
				            <th><input type = "text" name="user" id = "user"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Produto:</td>
				            <th><input type = "text" name="produto" id = "produto"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Quantidade:</td>
				            <th><input type = "text" name="padaria" id = "padaria"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Data de levantamento:</td>
				            <th><input type = "date" name="data_levantamento" id = "data_levantamento"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Hora de levantamento:</td>
				            <th><input type = "text" name="hora_levantamento" id = "hora_levantamento"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Preço total:</td>
				            <th><input type = "text" name="preco_total" id = "preco_total"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Tipo de pagamento:</td>
				            <th><input type = "text" name="tipo_pagamento" id = "tipo_pagamento"></th>
				        </tr>
				         <tr>
				            <td style="text-align:right">Estado(Em processamento ou Concluído):</td>
				            <th><input type = "text" name="Estado" id = "Estado"></th>
				        </tr>
				        
				      
			        </thead>
		        </table>
		        <br>
		        <button class = "w3-button poggie" name = "add_pedido" value = null>Adicionar</button>
     	    </form>
	</div>
	
<% 


	if(request.getParameter("add_pedido") != null){
		String nr_pedido = request.getParameter("nr_pedido");
		String user = request.getParameter("user");
		String produto = request.getParameter("produto");
		String quantidade = request.getParameter("quantidade");
		String data_levantamento = request.getParameter("data_levantamento");
		String hora_levantamento = request.getParameter("hora_levantamento");
		String preco_total = request.getParameter("preco_total");
		String tipo_pagamento = request.getParameter("tipo_pagamento");
		String Estado = request.getParameter("Estado");
	
	
	
	 try(Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ePadaria","root", "rita0412");){
	
		PreparedStatement preparedStatement = conn.prepareStatement("insert into pedidos value(?,?,?,?,?,?,?,?,?)");
		
			try{
				
					
					
					preparedStatement.setString(1,nr_pedido);
					preparedStatement.setString(2,user);
					preparedStatement.setString(3,produto);
					preparedStatement.setString(4,quantidade);
					preparedStatement.setString(5,data_levantamento);
					preparedStatement.setString(6,hora_levantamento);
					preparedStatement.setString(7,preco_total);
					preparedStatement.setString(8,tipo_pagamento);
					preparedStatement.setString(9,Estado);
					preparedStatement.executeUpdate();
					
					
			
			}catch(ArrayIndexOutOfBoundsException e){
				System.out.println(e);
			}
		
	}
}

%>
	

</body>
</html>