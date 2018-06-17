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
		
		if(vo.getParentReplyNum() == 0) {
			sb.append("insert into reply ");
			sb.append("values (REPLY_REPLYNUM_SEQ.nextval, ?, ?, sysdate, ?, REPLY_REPLYNUM_SEQ.currval, 0, 0, 0) ");
		}
		//대댓글 처리(부모 댓글이 있으면 실행)
		if(vo.getParentReplyNum() > 0) {
			sb.append("insert into reply ");
			sb.append("values (REPLY_REPLYNUM_SEQ.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?) ");
		}
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getReplyBoardNum());
			pstmt.setString(2, vo.getReplyWriter());
			//pstmt.setInt(3, vo.getReplyParent());
			pstmt.setString(3, vo.getReplyComment());
			
			if(vo.getParentReplyNum() > 0) {
				pstmt.setInt(4, vo.getGroupNum());
				pstmt.setInt(5, vo.getDepth());
				pstmt.setInt(6, vo.getOrderNum());
				pstmt.setInt(7, vo.getParentReplyNum());
			}
			
			pstmt.executeUpdate();
			//pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	} //addReply end
	
	//전체 댓글 조회
	public ArrayList<ReplyVO> getAllReply(int replyBnum) {
		ArrayList<ReplyVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from reply ");
		sb.append("where replyboardnum = ? ");
//		sb.append("order by replydate ");
		sb.append("order by groupnum asc, ordernum asc ");
//		sb.append("order by groupnum asc, ordernum asc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, replyBnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int replyNum = rs.getInt("replynum");
				int replyBoardNum = rs.getInt("replyboardnum");
				String replyWriter = rs.getString("replywriter");
				String replyDate = rs.getString("replydate");
				String replyComment = rs.getString("replycomment");
				int groupNum = rs.getInt("groupnum");
				int depth = rs.getInt("depth");
				int orderNum = rs.getInt("ordernum");
				int parentReplyNum = rs.getInt("parentreplynum");

				ReplyVO vo = new ReplyVO(replyNum, replyBoardNum, replyWriter, replyDate, replyComment, groupNum, depth, orderNum, parentReplyNum);
				list.add(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}

		return list;
	} //getAllReply end
	
	//현재 게시글의 댓글 조회
	public ReplyVO getCurrentReply(int replynum) {
		sb.setLength(0);
		sb.append("select * from reply ");
		sb.append("where replynum = ? ");
		
		ReplyVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, replynum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int replyNum = rs.getInt("replynum");
				int replyBoardNum = rs.getInt("replyboardnum");
				String replyWriter = rs.getString("replywriter");
				String replyDate = rs.getString("replydate");
				String replyComment = rs.getString("replycomment");
				int groupNum = rs.getInt("groupnum");
				int depth = rs.getInt("depth");
				int orderNum = rs.getInt("ordernum");
				int parentReplyNum = rs.getInt("parentreplynum");

				vo = new ReplyVO(replyNum, replyBoardNum, replyWriter, replyDate, replyComment, groupNum, depth, orderNum, parentReplyNum);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}

		return vo;
	} //getAllReply end
	
	//부모 댓글 숫자 구하기
	public int getCountByParentReply(ReplyVO vo) {
		sb.setLength(0);
		sb.append("select count(parentreplynum) from reply ");
		sb.append("where parentreplynum = ? ");
		
		int parent_cnt = 0;
		
		try {
			pstmt.setInt(1, vo.getParentReplyNum());
			rs = pstmt.executeQuery();

			while(rs.next()) {
				parent_cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
		
		return parent_cnt;
	} //getCountByParentReply end
	
	//해당 댓글부터 시작해서 부모 댓글과 댓글 번호가 같은것부터 순서대로 출력
	public int getMaxOrderNumByParentReply(ReplyVO vo) {
		sb.setLength(0);
		sb.append("select ordernum from (select * from reply ");
		sb.append("start with replynum = ? ");
		sb.append("connect by prior replynum = parentreplynum ");
		sb.append("order by ordernum desc) ");
		sb.append("where rownum = 1 ");
		
		int maxOrderNum = 0;
		
		try {
			pstmt.setInt(1, vo.getReplyNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxOrderNum = rs.getInt(1);
			} else {
				return 0;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
		
		return maxOrderNum;
	} //getMaxOrderNumByParentReply end
	
	//해당 댓글의 순서 가져오기
	public int getLatestOrderNumByParentNum(ReplyVO vo) {
		sb.setLength(0);
		sb.append("select ordernum from reply ");
		sb.append("where replynum = ? ");
		
		int getLatestOrder = 0;
		
		try {
			pstmt.setInt(1, vo.getParentReplyNum());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				getLatestOrder = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
		
		return getLatestOrder;
	} //getLatestOrderNumByParentNum end
	
	//신규 댓글 작성되면 그룹번호 내의 순번 증가 
	public void updateOrderNumByGroupNum(ReplyVO vo) {
		sb.setLength(0);
		sb.append("update reply ");
		sb.append("set ordernum = ordernum + 1 ");
		sb.append("where ordernum >= ? and groupnum = ? ");
		
		try {
			pstmt.setInt(1, vo.getOrderNum());
			pstmt.setInt(2, vo.getGroupNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
	} //updateOrderNumByGroupNum end
	
	//댓글 삭제
	public void deleteReplyNum(int repno) {
		sb.setLength(0);
		sb.append("delete reply ");
		sb.append("where replynum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, repno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
	} //deleteReplyNum end
	
	
	public void addNewReplyDepth(ReplyVO vo) {
		int orderNum = this.getNewOrderNum(vo);
		vo.setOrderNum(orderNum);
		
		if(orderNum > 0) {
			updateOrderNumByGroupNum(vo);
		}
		
		addReply(vo);
		//return addReply(vo) > 0;
	}
	
	private int getNewOrderNum(ReplyVO vo) {
		if(getCountByParentReply(vo) > 0) {
			int newOrderNum = getMaxOrderNumByParentReply(vo);
			return newOrderNum + 1;
		} else {
			if(vo.getParentReplyNum() != 0) {
				int newOrderNum = getLatestOrderNumByParentNum(vo);
				return newOrderNum + 1;
			}
		}
		
		return 0;
	}
	
	//리소스 반환
	public void close() {
		if (pstmt != null) {
			try {
				pstmt.close();
				if(rs != null) rs.close();
				//if(conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
