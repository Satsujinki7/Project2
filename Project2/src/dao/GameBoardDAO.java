package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.BoardVO;
import vo.GameBoardVO;

public class GameBoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public GameBoardDAO() {
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//전체 게시글 조회
	public ArrayList<GameBoardVO> getAllData(int startNum, int endNum) {
		ArrayList<GameBoardVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from (select rownum rn, gamenum, gamedate, gamewriter, gametitle, gameimage, gamecontents, status, gamehits, gamenomination from (select * from gameboard ");
		sb.append("order by gamedate asc) ");
		sb.append("where rownum <= ?) ");
		sb.append("where rn >= ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, endNum);
			pstmt.setInt(2, startNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int gameNum = rs.getInt("gamenum");
				String gameDate = rs.getString("gamedate");
				String gameWriter = rs.getString("gamewriter");
				String gameTitle = rs.getString("gametitle");
				String gameImage = rs.getString("gameimage");
				String gameContents = rs.getString("gamecontents");
				int status = rs.getInt("status");
				int gameHits = rs.getInt("gamehits");
				int gameNomination = rs.getInt("gameNomination");
				
				GameBoardVO vo = new GameBoardVO(gameNum, gameDate, gameWriter, gameTitle, gameImage, gameContents, status, gameHits, gameNomination);
				list.add(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	} //getAllData end
	
	//조회수 증가
	public void incrementHits(int gamenum) {
		sb.setLength(0);
		sb.append("update gameboard ");
		sb.append("set gamehits = gamehits+1 ");
		sb.append("where gamenum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, gamenum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	} //incrementHits end
	
	//추천수 증가
	public void incrementNomination(int gamenum) {
		sb.setLength(0);
		sb.append("update gameboard ");
		sb.append("set gamenomination = gamenomination+1 ");
		sb.append("where gamenum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, gamenum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	} //incrementNomination end	
	
	//게시글 입력
	public void addData(GameBoardVO vo) {
		sb.setLength(0);
		sb.append("insert into gameboard ");
		//아직 조작할 수 없는 변수는 기본값으로 우선 설정해놓기(null 방지) 0 0
		//status : 정상글 0, 블라인드 1
		sb.append("values (GAMEBOARD_GAMENUM_SEQ.nextval, sysdate, ?, ?, ?, ?, 0, 0, 0) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getGameWriter());
			pstmt.setString(2, vo.getGameTitle());
			pstmt.setString(3, vo.getGameImage());
			pstmt.setString(4, vo.getGameContents());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} //addData end	
	
	//유저 이름으로 조회
	public GameBoardVO gameData(String name) {
		sb.setLength(0);
		sb.append("select * from gameboard ");
		sb.append("where gamewriter = ? ");
		
		GameBoardVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			rs.next();
			
			int gameNum = rs.getInt("gamenum");
			String gameDate = rs.getString("gamedate");
			String gameWriter = rs.getString("gamewriter");
			String gameTitle = rs.getString("gametitle");
			String gameImage = rs.getString("gameimage");
			String gameContents = rs.getString("gamecontents");
			int status = rs.getInt("status");
			int gameHits = rs.getInt("gamehits");
			int gameNomination = rs.getInt("gamenomination");
			
			vo = new GameBoardVO(gameNum, gameDate, gameWriter, gameTitle, gameImage, gameContents, status, gameHits, gameNomination);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return vo;
	} //gameData end
	
	//게시글 상세 조회
	public GameBoardVO gamenumData(int gamenum) {
		sb.setLength(0);
		sb.append("select * from gameboard ");
		sb.append("where gamenum = ? ");
		
		GameBoardVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, gamenum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int gameNum = rs.getInt("gamenum");
				String gameDate = rs.getString("gamedate");
				String gameWriter = rs.getString("gamewriter");
				String gameTitle = rs.getString("gametitle");
				String gameImage = rs.getString("gameimage");
				String gameContents = rs.getString("gamecontents");
				int status = rs.getInt("status");
				int gameHits = rs.getInt("gamehits");
				int gameNomination = rs.getInt("gamenomination");
				
				vo = new GameBoardVO(gameNum, gameDate, gameWriter, gameTitle, gameImage, gameContents, status, gameHits, gameNomination);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return vo;
	} //gamenumData end	
	
	//전체 게시글 숫자 계산
	public int getCount() {
		int page_cnt = 0;
		
		sb.setLength(0);
		sb.append("select count(*) from gameboard ");
		
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
}
