package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.OracleXE_ConnectionPJ2;
import vo.BoardVO;

public class BoardV2_DAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public BoardV2_DAO() {
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//게시글 입력
	public void addData(BoardVO vo) {
		sb.setLength(0);
		sb.append("insert into board ");
		sb.append("values (BOARD_BOARDNUM_SEQ.nextval, sysdate, ?, ?, ?, 0, 0, 0, ?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getBoardWriter());
			pstmt.setString(2, vo.getBoardTitle());
			pstmt.setString(3, vo.getBoardContents());
			pstmt.setString(4, vo.getBoardImage());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} //addData end
}
