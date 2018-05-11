package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.OracleXE_Connection;

public class BoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public BoardDAO() {
		conn = OracleXE_Connection.getInstance().getConnection();
	}
	
	
}
