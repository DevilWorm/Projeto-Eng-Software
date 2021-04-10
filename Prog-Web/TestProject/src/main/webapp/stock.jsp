<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Padaria- Produtos</title>
</head>
<body>
<%
public int getId(){
	int currentId = -1;
	try{
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/epadaria","root", "vasc1234");
		Statement stat = conn.createStatement();
		ResultSet rset = stat.executeQuery("select * from stock");
		
		
		while(rset.next()){
			currentId = rset.getInt(1);
		}
		System.out.println("Connected!");	
	}catch(SQLException e) {
		System.out.println("Bad Connection -" + e);
	}
	return currentId + 1;
}
%>
	
	

</body>
</html>