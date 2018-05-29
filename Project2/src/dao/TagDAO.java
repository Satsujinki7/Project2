package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.catalina.connector.Request;

import connection.OracleXE_ConnectionPJ2;

public class TagDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public TagDAO() {
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	
	
	//tag가 이미 존재하는지 확인 
	public boolean isExistByTag(String tag) {
		
		sb.setLength(0);
		sb.append("select "+tag+" from tag ");

	
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			return true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		
	
	}
	
	
	
	
	//태그가 없을 때 태그를 추가
	public void addNewTag(String tag) {
		
		sb.setLength(0);
		sb.append("alter table tag ");
		sb.append("add ("+tag+" number(10)) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		
	}//addNewTag() end

	
	
	
	//태그에 데이터 추가 
	public void addData(String tag,int number) {
		
		sb.setLength(0);
		sb.append("insert into tag("+tag+") ");
		sb.append("values (?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, number);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//addData() end
	

	

	
	
}
