package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.ReplyVO;

public class ReplyV2_DAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public ReplyV2_DAO() {
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//댓글 작성
	public void addReply(ReplyVO vo) {
		sb.setLength(0);
		sb.append("insert into reply ");
		sb.append("values (REPLY_REPLYNUM_SEQ.nextval, ?, ?, sysdate, ?, REPLY_REPLYNUM_SEQ.nextval, 0, 0, 0) ");

		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getReplyBoardNum());
			pstmt.setString(2, vo.getReplyWriter());
			pstmt.setString(3, vo.getReplyComment());
			
			/*pstmt.setInt(4, vo.getGroupNum());
			pstmt.setInt(5, vo.getDepth());
			pstmt.setInt(6, vo.getOrderNum());
			pstmt.setInt(7, vo.getParentReplyNum());*/

			
			pstmt.executeUpdate();
			//pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} //addReply end
	
	//전체 댓글 조회
	public ArrayList<ReplyVO> getAllReply(int replyBnum) {
		ArrayList<ReplyVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from ");
		sb.append("(select rownum as rn, data.* ");
		sb.append("from (select replynum, replyboardnum, replywriter, replydate, replycomment, groupnum, depth, ordernum, parentreplynum ");
		sb.append("from reply start with parentreplynum = 0 connect by prior replynum = parentreplynum ");
		sb.append("order siblings by case parentreplynum when 0 then replynum end desc, ");
		sb.append("case when parentreplynum != 0 then depth end desc) data ) ");
		sb.append("where replyboardnum = ? ");
		sb.append("order by groupnum asc, replydate asc ");
		//sb.append("order by groupnum asc, ordernum asc ");
		
		
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
		}

		return list;
	} //getAllReply end
	
	//현재 게시글의 댓글 조회
	public ReplyVO getBoardReply(int boardnum) {
		sb.setLength(0);
		sb.append("select * from reply ");
		sb.append("where replyboardnum = ? ");
		
		ReplyVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, boardnum);
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
		}

		return vo;
	} //getAllReply end
	
	//현재 댓글의 대댓글 조회
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
		}

		return vo;
	} //getAllReply end
	
	//부모 댓글 숫자 구하기
	public int getCountByParentReply(ReplyVO vo) {
		sb.setLength(0);
		sb.append("select count(replynum) from reply ");
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
		}
		return parent_cnt;
	} //getCountByParentReply end
	
	//해당 댓글의 마지막 순번 가져오기
	public int getMaxOrderNumByParentReply(ReplyVO vo) {
		sb.setLength(0);
		sb.append("select max(ordernum) from reply ");
		sb.append("start with replynum = ? ");
		sb.append("connect by prior replynum = parentreplynum ");
		sb.append("order by ordernum desc ");
		
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
		}
		return maxOrderNum;
	} //getMaxOrderNumByParentReply end
	
	//가장 최근에 작성된 순번 가져오기
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
		}
		return getLatestOrder;
	} //getLatestOrderNumByParentNum end
	
	//댓글 깊이 설정
	public void modDepthData(ReplyVO vo) {
		sb.setLength(0);
		sb.append("update reply set depth = depth + 1 ");
		sb.append("where groupnum = ? and depth >= ? ");
		
		try {
			pstmt.setInt(1, vo.getGroupNum());
			pstmt.setInt(2, vo.getDepth());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//댓글 순번 설정
	public void modOrdernumData(ReplyVO vo) {
		sb.setLength(0);
		sb.append("update reply set ordernum = ordernum + 1 ");
		sb.append("where ordernum >= ? and groupnum = ? ");
		
		try {
			pstmt.setInt(1, vo.getOrderNum());
			pstmt.setInt(2, vo.getGroupNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//대댓글 작성
	public void addReReply(ReplyVO vo) {
		sb.setLength(0);
		sb.append("insert into reply ");
		sb.append("values (REPLY_REPLYNUM_SEQ.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?) ");

		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getReplyBoardNum());
			pstmt.setString(2, vo.getReplyWriter());
			pstmt.setString(3, vo.getReplyComment());
			
			pstmt.setInt(4, vo.getGroupNum());
			pstmt.setInt(5, vo.getDepth()+1);
			pstmt.setInt(6, vo.getOrderNum()+1);
			pstmt.setInt(7, vo.getParentReplyNum());
			
			pstmt.executeUpdate();
			//pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
	//댓글 삭제
	public void deleteReplyNum(int repno) {
		/*sb.setLength(0);
		sb.append("delete reply ");
		sb.append("where replynum = ? ");*/
		
		sb.setLength(0);
		sb.append("delete reply ");
		sb.append("where replynum in ");
		sb.append("(select replynum from reply ");
		sb.append("start with replynum = ? ");
		sb.append("connect by prior replynum = parentreplynum) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, repno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	} //deleteReplyNum end
	
	
	//밑의 두개는 현재 안쓰는듯.
	public void addNewReplyDepth(ReplyVO vo) {
		int orderNum = this.getNewOrderNum(vo);
		vo.setOrderNum(orderNum);
		
		if(orderNum > 0) {
			modOrdernumData(vo);
		}
		
		addReply(vo);
		//return addReply(vo) > 0;
	}
	
	//댓글 순번 갱신
	public int getNewOrderNum(ReplyVO vo) {
		//이미 존재할 경우 순번 갱신
		if(getCountByParentReply(vo) > 0) {
			int newOrderNum = getMaxOrderNumByParentReply(vo);
			return newOrderNum + 1;
		} else { //일반 댓글, 첫 대댓글인 경우 순번 갱신
			if(vo.getParentReplyNum() != 0) {
				int newOrderNum = getLatestOrderNumByParentNum(vo);
				return newOrderNum + 1;
			}
		}
		return 0;
	}
}
