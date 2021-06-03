import java.sql.*;
public class UserDAO {
	
	
	public String loginUser(UserBean user) throws ClassNotFoundException {

		String name = user.getName();
		String password = user.getPassword();

		Connection con = null;
		
		try {
			con = DBConnection.createConnection();
			Statement stat = con.createStatement();
			ResultSet rset = stat.executeQuery("Select * from clientes Where nome='" + name + "' and password='" + password + "'");
			if(rset.next()) {
				return name;
			}
		}catch(SQLException e) { e.printStackTrace(); }
		return "ERROR";
		
	}	
}
