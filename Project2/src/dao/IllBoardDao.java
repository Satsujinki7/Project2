package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.IllboardVo;

public class IllBoardDao {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn =null;
	
	public IllBoardDao(){
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//전체조회 ->업로드 순으로 
	public ArrayList<IllboardVo> alldataIllBoard(){
		ArrayList<IllboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from illboard order by iboardnum desc");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int iboardnum =rs.getInt(1);
				String iboarddate = rs.getString(2) ;
				String iboardtitle = rs.getString(3);
				String iboardwriter=rs.getString(4);
				String iboardcontent =rs.getString(5);
				String iboardimg =rs.getString(6);
				int iboardhits = rs.getInt(7);
				int	iboardnomination = rs.getInt(8);
				int iboardtoday = rs.getInt(9);
				int iboardflag = rs.getInt(10);
				
				IllboardVo ibv = new IllboardVo(iboardnum, iboarddate, iboardtitle, iboardwriter, iboardcontent, iboardimg, iboardhits, iboardnomination, iboardtoday, iboardflag);
				
				list.add(ibv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//alldata end
	
	
	//전체조회 -> 좋아요 순으로
	public ArrayList<IllboardVo> likeIllBoard(){
		ArrayList<IllboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from illboard order by iboardnomination desc");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int iboardnum =rs.getInt(1);
				String iboarddate = rs.getString(2) ;
				String iboardtitle = rs.getString(3);
				String iboardwriter=rs.getString(4);
				String iboardcontent =rs.getString(5);
				String iboardimg =rs.getString(6);
				int iboardhits = rs.getInt(7);
				int	iboardnomination = rs.getInt(8);
				int iboardtoday = rs.getInt(9);
				int iboardflag = rs.getInt(10);
				
				IllboardVo ibv = new IllboardVo(iboardnum, iboarddate, iboardtitle, iboardwriter, iboardcontent, iboardimg, iboardhits, iboardnomination, iboardtoday, iboardflag);
				
				list.add(ibv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//alldata end
	
	
	//페이징 처리된 조회
	public ArrayList<IllboardVo> alldataIllBoard(int startNum , int endNum){
		ArrayList<IllboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from( select rownum rn, iboardnum, iboarddate, iboardtitle, iboardwriter, iboardcontent, iboardimg, iboardhits, iboardnomination, iboardtoday, iboardflag ");
		sb.append("from(select * ");
		sb.append("from illboard ");
		sb.append("order by iboardnum desc )");
		sb.append("where rownum <=?) ");
		sb.append("where rn >=?  ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNum);
			pstmt.setInt(2, startNum);			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int iboardnum =rs.getInt("iboardnum");
				String iboarddate = rs.getString("iboarddate") ;
				String iboardtitle = rs.getString("iboardtitle");
				String iboardwriter=rs.getString("iboardwriter");
				String iboardcontent =rs.getString("iboardcontent");
				String iboardimg =rs.getString("iboardimg");
				int iboardhits = rs.getInt("iboardhits");
				int	iboardnomination = rs.getInt("iboardnomination");
				int iboardtoday = rs.getInt("iboardtoday");
				int iboardflag = rs.getInt("iboardflag");
				
				IllboardVo ibv = new IllboardVo(iboardnum, iboarddate, iboardtitle, iboardwriter, iboardcontent, iboardimg, iboardhits, iboardnomination, iboardtoday, iboardflag);
				
				list.add(ibv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//페이징처리 끝
	
	//총 게시글 개수 조회
	public int countData() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) FROM ILLBOARD ");
		
		int DataNum =0;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			rs.next();
			
			DataNum = rs.getInt(1);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return DataNum;
	}//countdata end
	
	
	//새글쓰기
	public void addIllBoard(IllboardVo ibv) {
		sb.setLength(0);
		sb.append("insert into illboard ");
		sb.append("values(pboard_pbnum_seq.nextval, sysdate, ?,?,?,?,0,0,0,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, ibv.getIboardtitle());
			pstmt.setString(2, ibv.getIboardwriter());
			pstmt.setString(3, ibv.getIboardcontent());
			pstmt.setString(4, ibv.getIboardimg());
			pstmt.setInt(5, ibv.getIboardflag());
			
			
			pstmt.executeUpdate();
			System.out.println("삽입 성공?ㅇㅅㅇ!");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//add end
	
	//한건 조회하는  메소드
	
	public IllboardVo getData(int iboardnum) {
		sb.setLength(0);
		sb.append("select * from illboard ");
		sb.append("where iboardnum= ? ");
		
		IllboardVo vo=null;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, iboardnum);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			int no=rs.getInt("iboardnum");
			String writer=rs.getString("iboardwriter");
			String title=rs.getString("iboardtitle");
			String contents=rs.getString("iboardcontent");
			String date=rs.getString("iboarddate");
			String imgpath=rs.getString("iboardimg");
			
			
			
			vo=new IllboardVo(no, date, title, writer, contents, imgpath, 0, 0, 0, 1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}//getData() end
		
	//조회수 증가 
	public void incrementHits(int boardnum) {
		sb.setLength(0);
		sb.append("update illboard ");
		sb.append("set iboardhits = iboardhits +1 ");
		sb.append("where iboardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//조회수 증가
	
	
	//추천수 증가
	public void incrementNomination(int boardnum) {
		sb.setLength(0);
		sb.append("update illboard ");
		sb.append("set iboardnomination = iboardnomination +1 ");
		sb.append("where iboardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//추천수 증가 end
		

	//이름으로 검색하여 최신순 정렬한 뒤 글번호를 가져옴
	public int getDataByName(String writer) {
		sb.setLength(0);
		sb.append("select * from illboard ");
		sb.append("where iboardwriter =? ");
		sb.append("order by iboardnum desc ");
		
		int no =0;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, writer);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			no=rs.getInt("iboardnum");
			
			return no;
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return no;
		}
	
	}//getData() end
		
	
	
}
