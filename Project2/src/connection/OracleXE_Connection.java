package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleXE_Connection {
	private static OracleXE_Connection oc = null;
	private static Connection conn;
	
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	
	final String USERID = "scott";
	final String USERPW = "tiger";

	
	private OracleXE_Connection() {
		
	}
	
	public static OracleXE_Connection getInstance() {
		if(oc == null) {
			oc = new OracleXE_Connection();
		}
		return oc;
	}
	
	public Connection getConnection() {
		if(conn == null) {
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USERID, USERPW);
				System.out.println("conn : " + conn);
			} catch (ClassNotFoundException e) {
				System.out.println("DB 연결 실패");
			} catch (SQLException e) {
				System.out.println("드라이버 로딩 실패");
			} //try end
		}
		return conn;
	}
}
