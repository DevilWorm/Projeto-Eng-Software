<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
<%@ page import = "epadaria.web.servlet.DBConnection" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");
%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Loja</title>
</head>
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
	<%  if(session.getAttribute("User") == null){ %>	
			<a href="http://localhost:8080/TestProject/login.jsp" ><img src="https://i.imgur.com/TYyFXOr.png" alt="some text" width=20 height=20></a>
	<%	}else{ %>
			<a href="http://localhost:8080/TestProject/LogoutServlet"> <%= session.getAttribute("User") %> </a> 
	<% 	} %>
    <a href="http://localhost:8080/TestProject/carrinho.jsp"><img src="https://i.imgur.com/06MKgJl.png" alt="some text" width=20 height=20></a>
  	<a href="http://localhost:8080/TestProject/home_page.jsp" >Home</a>
  	<a href="http://localhost:8080/TestProject/stock.jsp" class="active" >Produtos</a>
  	<a href="http://localhost:8080/TestProject/sobre_nos.jsp">Sobre nós</a>
  	<a href="http://localhost:8080/TestProject/padarias.jsp">Padarias</a>
  	<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  	</a>
</div>
<br><br><br>



	
	<div  align="center">
	<% if(session == null || session.getAttribute("User") == null){ %>
		<h3>Not logged in</h3>
	<% }else{ %>
	<h3>Escolher Produtos</h3>
	<form>
		<p>Produto:</p>
		<input type = "text" name = "produto">
		<input type = "submit" name = "Procurar">
	</form>
	<%
		String produto = request.getParameter("produto");
		String[] produtos = new String[100];
		String[] prices = new String[100];
		if (produto != null){
			try( Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "rita0412");
				Statement stat = conn.createStatement();){
			
				String str = "SELECT * FROM stock WHERE produto IN (";
				str += "'" + produto + "'";
				str += ") ORDER BY produto ASC";
				
				System.out.println("Query statement is " + str);
				ResultSet rset = stat.executeQuery(str); %>
		<form method = "GET">
			<table>
				<tr>
					<th>Comprar</th>
					<th>Produto</th>
					<th>Quantidade</th>
					<th>Preço</th>
					<th>Padaria</th>
				</tr>	
			<%
				while (rset.next()){
					int id = rset.getInt("id");
					produtos[rset.getRow()-1] = rset.getString("produto");
					prices[rset.getRow()-1] = rset.getString("preco");
					
			%>
				<tr>
					<td><input type = "checkbox" name = "id" value = "<%= id%>"></td>
					<td><%= rset.getString("produto") %>
					<td><input type = "number" name = "qty">
					<td><%= rset.getString("preco") %> €
					<td><%= rset.getString("padaria") %>
				</tr>
		<% } %>
		</table>
		<br>
		<button class = "w3-button poggie" name = "checkout" value = null>Checkout</button>		
	</form>
		<%      
			
			stat.close();
			conn.close();
			rset.close();
			}catch(SQLException e) { System.out.println(e);}
		}else{
			try(Connection conn = DBConnection.createConnection();
				Statement stat = conn.createStatement();){
				
				String str = "SELECT * FROM stock ORDER BY produto ASC";
				System.out.println("Query statement is " + str);
				ResultSet rset = stat.executeQuery(str); %>
				<form method = "GET">
					<table>
						<tr>
							<th>Comprar</th>
							<th>Produto</th>
							<th>Quantidade</th>
							<th>Preço</th>
							<th>Padaria</th>
						</tr>	
				<%	while (rset.next()){
						int id = rset.getInt("id");
						produtos[rset.getRow()-1] = rset.getString("produto");
						prices[rset.getRow()-1] = rset.getString("preco"); %>
						<tr>
							<td><input type = "checkbox" name = "id" value = "<%= id%>"></td>
							<td><%= rset.getString("produto") %>
							<td><input type = "number" name = "qty">
							<td><%= rset.getString("preco") %> €
							<td><%= rset.getString("padaria") %>
						</tr>
				<%	} %>
					</table>
					<br>
					<button class = "w3-button poggie" name = "checkout" value = null>Checkout</button>		
				</form>
			<%  stat.close();
				conn.close();
				rset.close();
			}catch(SQLException e) { System.out.println(e);}
		}
		try(Connection conn = DBConnection.createConnection();
			Statement stat = conn.createStatement();){
			System.out.print("Working?");
			ResultSet rset = stat.executeQuery("SELECT morada FROM clientes where nome='"+((String) session.getAttribute("User"))+"'");
			if(rset.next())
				session.setAttribute("morada", rset.getString("morada"));	
				
			conn.close();
		}
		try(Connection conn = DBConnection.createConnection();){
			
			
			if(request.getParameter("checkout") != null){
				String[] ids = request.getParameterValues("id");
				String[] qty = request.getParameterValues("qty");
				if(ids != null){
					for(int i = 0; i < ids.length; i++){
						if(qty[i] != ""){
							PreparedStatement prep = conn.prepareStatement("insert into pedidos value(?,?,?,?,?,?,?,?,?,?)");
							prep.setInt(1, Integer.parseInt(ids[i]));
							prep.setString(2, (String) session.getAttribute("User"));
							prep.setString(3, produtos[i]);
							prep.setInt(4, Integer.parseInt(qty[i]));
							prep.setObject(5, LocalDate.now());
							prep.setObject(6, LocalTime.now());
							prep.setString(7, prices[i]);
							prep.setString(8, "Cartão");
							prep.setString(9, "Em espera");
							prep.setString(10, (String) session.getAttribute("morada"));
							prep.executeUpdate();
						}
					}
				}
			}
		}catch(SQLException e){System.out.println(e);}
		
	}%>
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