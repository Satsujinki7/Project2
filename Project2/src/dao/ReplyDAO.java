package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.BoardVO;
import vo.ReplyVO;

public class ReplyDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public ReplyDAO() {
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//댓글 작성
	public void addReply(ReplyVO vo) {
		sb.setLength(0);
		sb.append("insert into reply ");
		sb.append("values (REPLY_REPLYNUM_SEQ.nextval, ?, ?, sysdate, 0, ?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getReplyBoardNum());
			pstmt.setString(2, vo.getReplyWriter());
			//pstmt.setInt(3, vo.getReplyParent());
			pstmt.setString(3, vo.getReplyComment());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} //addReply end
	
	//전체 댓글 조회
	public ArrayList<ReplyVO> getAllReply(int replyBnum) {
		ArrayList<ReplyVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from reply ");
		sb.append("where replyboardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, replyBnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int replyNum = rs.getInt("replynum");
				int replyBoardNum = rs.getInt("replyboardnum");
				String replyWriter = rs.getString("replywriter");
				String replyDate = rs.getString("replydate");
				int replyParent = rs.getInt("replyparent");
				String replyComment = rs.getString("replycomment");
				
				ReplyVO vo = new ReplyVO(replyNum, replyBoardNum, replyWriter, replyDate, replyParent, replyComment);
				list.add(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	} //getAllReply end
}
