package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.BoardVO;

public class BoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public BoardDAO() {
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//전체 게시글 조회
	public ArrayList<BoardVO> getAllData(int startNum, int endNum) {
		ArrayList<BoardVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from (select rownum rn, boardnum, boarddate, boardwriter, boardtitle, boardcontents, status, boardhits, boardnomination, boardimage from (select * from board ");
		sb.append("order by boarddate asc) ");
		sb.append("where rownum <= ?) ");
		sb.append("where rn >= ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, endNum);
			pstmt.setInt(2, startNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int boardNum = rs.getInt("boardnum");
				String boardDate = rs.getString("boarddate");
				String boardWriter = rs.getString("boardwriter");
				String boardTitle = rs.getString("boardtitle");
				String boardContents = rs.getString("boardcontents");
				int status = rs.getInt("status");
				int boardHits = rs.getInt("boardhits");
				int boardNomination = rs.getInt("boardNomination");
				String boardImage = rs.getString("boardImage");
				
				BoardVO vo = new BoardVO(boardNum, boardDate, boardWriter, boardTitle, boardContents, status, boardHits, boardNomination, boardImage);
				list.add(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	} //getAllData end
	
	//조회수 증가
	public void incrementHits(int boardnum) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set boardhits = boardhits+1 ");
		sb.append("where boardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, boardnum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}

	} //incrementHits end
	
	//추천수 증가
	public void incrementNomination(int boardnum) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set boardnomination = boardnomination+1 ");
		sb.append("where boardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, boardnum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}

	} //incrementNomination end
	
	//게시글 입력
	public void addData(BoardVO vo) {
		sb.setLength(0);
		sb.append("insert into board ");
		//아직 조작할 수 없는 변수는 기본값으로 우선 설정해놓기(null 방지) 0 0
		//status : 정상글 0, 블라인드 1
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
	
	//유저 이름으로 조회
	public BoardVO boardData(String name) {
		sb.setLength(0);
		sb.append("select * from board ");
		sb.append("where boardwriter = ? ");
		
		BoardVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			rs.next();
			
			int boardNum = rs.getInt("boardnum");
			String boardDate = rs.getString("boarddate");
			String boardWriter = rs.getString("boardwriter");
			String boardTitle = rs.getString("boardtitle");
			String boardContents = rs.getString("boardcontents");
			int status = rs.getInt("status");
			int boardHits = rs.getInt("boardhits");
			int boardNomination = rs.getInt("boardnomination");
			String boardImage = rs.getString("boardImage");
			
			vo = new BoardVO(boardNum, boardDate, boardWriter, boardTitle, boardContents, status, boardHits, boardNomination, boardImage);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return vo;
	} //boardData end
	
	//게시글 상세 조회
	public BoardVO boardnumData(int boardnum) {
		sb.setLength(0);
		sb.append("select * from board ");
		sb.append("where boardnum = ? ");
		
		BoardVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardnum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int boardNum = rs.getInt("boardnum");
				String boardDate = rs.getString("boarddate");
				String boardWriter = rs.getString("boardwriter");
				String boardTitle = rs.getString("boardtitle");
				String boardContents = rs.getString("boardcontents");
				int status = rs.getInt("status");
				int boardHits = rs.getInt("boardhits");
				int boardNomination = rs.getInt("boardnomination");
				String boardImage = rs.getString("boardImage");
				
				vo = new BoardVO(boardNum, boardDate, boardWriter, boardTitle, boardContents, status, boardHits, boardNomination, boardImage);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		return vo;
	} //boardnumData end
	
	//특정 게시물 검색하기
	public ArrayList<BoardVO> searchData(int startNum, int endNum, String searchType, String searchWord) {
		ArrayList<BoardVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from (select rownum rn, boardnum, boarddate, boardwriter, boardtitle, boardcontents, status, boardhits, boardnomination, boardimage from (select * from board ");
		sb.append("where " + searchType + " like '%" + searchWord + "%' order by boarddate asc) ");
		sb.append("where rownum <= ?) ");
		sb.append("where rn >= ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, endNum);
			pstmt.setInt(2, startNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int boardNum = rs.getInt("boardnum");
				String boardDate = rs.getString("boarddate");
				String boardWriter = rs.getString("boardwriter");
				String boardTitle = rs.getString("boardtitle");
				String boardContents = rs.getString("boardcontents");
				int status = rs.getInt("status");
				int boardHits = rs.getInt("boardhits");
				int boardNomination = rs.getInt("boardNomination");
				String boardImage = rs.getString("boardImage");
				
				BoardVO vo = new BoardVO(boardNum, boardDate, boardWriter, boardTitle, boardContents, status, boardHits, boardNomination, boardImage);
				list.add(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	} //getAllData end
	
	//전체 게시글 숫자 계산
	public int getCount() {
		int page_cnt = 0;
		
		sb.setLength(0);
		sb.append("select count(*) from board ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				page_cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return page_cnt;
	} //getCount end
	
	//게시글 수정
	public void modifyBoardData(BoardVO vo) {
		sb.setLength(0);
		sb.append("update board ");
		sb.append("set boardtitle = ?, boardcontents = ? ");
		sb.append("where boardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getBoardTitle());
			pstmt.setString(2, vo.getBoardContents());
			pstmt.setInt(3, vo.getBoardNum());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} //modifyBoardData end
	
	//게시글 삭제
	public void deleteBoardData(int boardnum) {
		sb.setLength(0);
		sb.append("delete board ");
		sb.append("where boardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, boardnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} //deleteBoardData end
	
	//리소스 반환
	public void close() {
		if (pstmt != null) {
			try {
				pstmt.close();
				if(rs != null) rs.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
