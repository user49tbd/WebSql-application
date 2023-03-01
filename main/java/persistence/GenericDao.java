package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class GenericDao {
	private Connection c;
	public Connection getC () throws SQLException, ClassNotFoundException {
		
		String hostName = "localhost";
		String dbName = "MOTORISTA_ONIBUSEX01";
		String user = "sa";
		String password = "B29@&&";

		Class.forName("net.sourceforge.jtds.jdbc.Driver");
		
		c = DriverManager.getConnection(
				String.format("jdbc:jtds:sqlserver://%s:1433;databaseName=%s;user=%s;password=%s;",
						hostName, dbName,user,password)
				);
		return c;
	}
}
