import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		UserBean bean = new UserBean();
		
		bean.setName(username);
		bean.setPassword(password);
		
		UserDAO userDao = new UserDAO();
		
		String userLog = null;
		try {
			userLog = userDao.loginUser(bean);
			
			if(userLog.equals(username)) {
				HttpSession session = request.getSession();
				session.setAttribute("User", username);
				request.getRequestDispatcher("home_page.jsp").forward(request, response);				
			}else {
				System.out.print("Not Found");
				HttpSession session = request.getSession();
				session.setAttribute("errMessage", userLog);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		
		}
		catch(IOException e1) {e1.printStackTrace(); }
		catch(Exception e2 ) { e2.printStackTrace(); }
	}

}

//<%
//if(request.getParameter("login") != null){
//	String user = request.getParameter("user");
//	String pwd = request.getParameter("password");
//	String nextPage;
//	try{
//		Class.forName("com.mysql.cj.jdbc.Driver"); 
//		Connection conn = DriverManager.getConnection("jdbc:mysql://77.54.229.5:3306/epadaria","admin", "vasc1234");
//		Statement stat = conn.createStatement();
//		ResultSet rset = stat.executeQuery("select * from clientes");
//		boolean userCheck = false;
//		while(rset.next()){
//			//System.out.println(rset.getString(2) + "=" + user + "|" + rset.getString(3) + "=" + pwd);
//			if(rset.getString("nome").equals(user) && rset.getString("password").equals(pwd)){
//				//logged in!
//				System.out.println("Found a user!");
//				//request.getSession().setAttribute("loggedInUser", user);
//				userCheck = true;
//				nextPage = "http://localhost:8080/TestProject/home_page.jsp";
//			}
//		}
//
//		if(userCheck == false){%>
//			<p> Try signing a new account! </p>
//			<a class = "poggie" href = "http://localhost:8080/TestProject/signup.jsp"> Sign Up </a>
//	  <%}else{
//		  	//RequestDispatcher dd = request.getRequestDispatcher(page);
//			//dd.forward(request, response);
//	  	}
//		
//		
//		System.out.println("Connected!");	
//	}catch(SQLException e) {
//		System.out.println("Bad Connection -" + e);
//	}
//}
//%>