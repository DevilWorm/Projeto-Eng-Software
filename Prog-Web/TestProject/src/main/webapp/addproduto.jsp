<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<% Class.forName("com.mysql.cj.jdbc.Driver");  %>
	<div align="center">
	<H3> Adiconar produto</H3>
	<br> <br>
	<form method="get">
		        <table style="color:#943939">
			        <thead>
			        	<tr>
			        		<td style = "text-align:right">Nome:</td>
			        		<th><input type = "text" name = "nomeproduto" id = "nomeproduto"></th>			        	
			        	</tr>
				        <tr>
				            <td style="text-align:right">Preço:</td>
				            <th><input type = "text" name="preco" id = "preco"></th>
				        </tr>
				        <tr>
				            <td style="text-align:right">Descrição:</td>
				            <th><input type = "text" name="descricao" id = "descricao"></th>
				        </tr>
				       
				      
			        </thead>
		        </table>
		        <br>
		        <button class = "w3-button poggie" name = "add_produto" value = null>Adicionar</button>
     	    </form>
<%
			if(request.getParameter("add_produto") != null){
				try(
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
					PreparedStatement preparedStatement = conn.prepareStatement("insert into stock value(?,?,?)");			
				){
					String nome = request.getParameter("nome");
					String preco = request.getParameter("preco");
					String descricao = request.getParameter("descricao");
					
					if(nome.length() >= 3){
						try{
							preparedStatement.setString(1, nome);
							preparedStatement.setString(2,preco);
							preparedStatement.setString(3,descricao);
						
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
	

</body>
</html>