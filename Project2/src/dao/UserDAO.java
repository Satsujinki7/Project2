package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.OracleXE_Connection;

public class UserDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public UserDAO() {
		conn = OracleXE_Connection.getInstance().getConnection();
	}
	
	
}
