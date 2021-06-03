<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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

</style>
<meta charset="ISO-8859-1">
<title>Pagina inicial funcionário</title>
</head>
<body>
<div align="right">
	<h3> Suporte técnico: 224 235 458</h3>
</div>
<div align="center">
	<h1> Bem-vindo funcionário xxxx!</h1>
</div>

<br>
<h3> Produtos</h3>

<a class = "poggie" href = "http://localhost:8080/TestProject/addproduto.jsp"> Inserir Produto </a>
<a class = "poggie" href = "http://localhost:8080/TestProject/insert_produto.jsp"> Eliminar</a>

<br>
<h3> Pedidos</h3>

<a class = "poggie" href = "http://localhost:8080/TestProject/inse_produto.jsp"> Adicionar pedido </a>
<a class = "poggie" href = "http://localhost:8080/TestProject/inse_produto.jsp"> Pedidos em espera </a>
<a class = "poggie" href = "http://localhost:8080/TestProject/insert_produto.jsp"> Histórico de pedidos </a>

</body>
</html>