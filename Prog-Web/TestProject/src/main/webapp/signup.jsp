<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"  %>
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


<% Class.forName("com.mysql.cj.jdbc.Driver");  %>

<meta charset="ISO-8859-1">
<title>Sign in</title>
</head>
<body>

<div class="topnav" id="myTopnav">
	<a href="http://localhost:8080/TestProject/login.jsp" class="active"><img src="https://i.imgur.com/TYyFXOr.png" alt="some text" width=20 height=20></a>
    <a href="http://localhost:8080/TestProject/stock.jsp"><img src="https://i.imgur.com/06MKgJl.png" alt="some text" width=20 height=20></a>
  	<a href="http://localhost:8080/TestProject/home_page.jsp" >Home</a>
  	<a href="http://localhost:8080/TestProject/stock.jsp" >Produtos</a>

  	<a href="http://localhost:8080/TestProject/sobre_nos.jsp">Sobre nós</a>
  	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  	</a>
</div>
<br><br><br>

	
	<br>
	

<div align="center" >
	<center>
       <table>
           	<thead>
               <tr>
                   <th colspan="2">Preencha os campos</th>
               </tr>
           	</thead>
			<form method="get">
		        <table style="color:#943939">
			        <thead>
			        	<tr>
			        		<td style = "text-align:right">Nome:</td>
			        		<th><input type = "text" name = "nome" id = "nome"></th>			        	
			        	</tr>
				        <tr>
				            <td style="text-align:right">E-mail:</td>
				            <th><input type = "text" name="email" id = "email"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Morada:</td>
				            <th><input type = "text" name="morada" id = "morada"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Número de telémovel:</td>
				            <th><input type = "text" name="nr_tel" id = "nr_tel"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Data de nascimento:</td>
				            <th><input type = "date" name="datanasc" id = "datanasc"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">NIF:</td>
				            <th><input type = "number" name="nif" id = "nif"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Password:</td>
				            <th><input type = "password" name="pwd1" id = "pwd1"></th>
				        </tr>
				         <tr>
				            <td style="text-align:right">Confirmar password:</td>
				            <th><input type = "password" name="pwd2" id = "pwd2"></th>
				        </tr>
			        </thead>
		        </table>
		        <br>
		        <button class = "w3-button poggie" name = "signin" value = null>Sign up!</button>
     	    </form>
	<%
			if(request.getParameter("signin") != null){
				try(
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
					PreparedStatement preparedStatement = conn.prepareStatement("insert into clientes value(?,?,?,?,?,?,?,?)");			
				){
					String nome = request.getParameter("nome");
					String email = request.getParameter("email");
					String pwd1 = request.getParameter("pwd1");
					String pwd2 = request.getParameter("pwd2");
					String morada = request.getParameter("morada");
					String tel = request.getParameter("nr_tel");
					String datan = request.getParameter("datanasc");
					String nif = request.getParameter("nif");
					if(pwd1.length() >= 8){
						try{
							preparedStatement.setInt(1, Integer.parseInt(nif));
							preparedStatement.setString(2,email);
							preparedStatement.setString(3,pwd1);
							preparedStatement.setString(4,datan);
							preparedStatement.setString(5,nome);
							preparedStatement.setString(6,tel);
							preparedStatement.setString(7,morada);
							preparedStatement.setString(8, "Empty");
							preparedStatement.executeUpdate();
							
							System.out.println("Done?");
							response.sendRedirect("http://localhost:8080/TestProject/home_page.jsp");
						}catch(Exception e){
							System.out.println("Out of bounds!");
							response.sendRedirect("http://localhost:8080/TestProject/signup.jsp");
						}
					}
				}catch(SQLException e){System.out.println(e);}
			}else{
				System.out.println("Now we here");
			}
			
		%>
</div>
<br><br><br><br>
<!-- Footer -->
<footer class="w3-container w3-padding-50 w3-center w3-brown w3-xlarge">
<h5><u>Siga-nos em:</u></h5>
  <a href="https://www.facebook.com/EPadaria-101399275434399"><i class="fa fa-facebook-official"></i></a>
  <h5> <u>Contactos:</u></h5>
  <h6> Telefone geral: 224 233 105</h6>
  <h6>E-mail: ePadaria@gmail.com</h6>
  <img src="https://i.imgur.com/sfDeVYR.png" width=192 height=96>
  
  <p class="w3-medium">
  
  </p>
</footer>	
</body>
</html>