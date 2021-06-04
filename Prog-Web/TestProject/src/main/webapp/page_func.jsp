<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
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

 	



<meta charset="ISO-8859-1">
<title>Pagina inicial funcionário</title>
</head>
<body>
<div align="right">
	<h3> Suporte técnico: 224 235 458</h3>
</div>
<div align="center">
	<h1> Bem-vindo funcionário <%= session.getAttribute("Func") %>!</h1>
</div>

<br>
<h3> Produtos</h3>

<a class = "poggie" href = "http://localhost:8080/TestProject/addproduto.jsp"> Inserir Produto </a>
<a class = "poggie" href = "http://localhost:8080/TestProject/deleteproduto.jsp"> Eliminar</a>

<br>
<h3> Pedidos</h3>

<a class = "poggie" href = "http://localhost:8080/TestProject/add_pedido.jsp"> Adicionar pedido </a>
<a class = "poggie" href = "http://localhost:8080/TestProject/waitpedidos.jsp"> Pedidos em espera </a>
<a class = "poggie" href = "http://localhost:8080/TestProject/historicopedidos.jsp"> Histórico de pedidos </a>

</body>
</html>