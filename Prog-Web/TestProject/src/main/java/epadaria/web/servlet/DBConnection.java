package epadaria.web.servlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection createConnection() {
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/epadaria";
		String username = "root";
		String password = "rita0412";
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				//Já não se faz Class.forName();
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, username, password);
		} catch ( SQLException e ) { 
			e.printStackTrace(); 
		}
		return con;
	}
}
