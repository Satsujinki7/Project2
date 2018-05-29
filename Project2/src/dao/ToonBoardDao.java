package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.ToonboardVo;

public class ToonBoardDao {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn =null;
	
	public ToonBoardDao(){
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//전체조회 ->업로드 순으로 
	public ArrayList<ToonboardVo> alldataToonBoard(){
		ArrayList<ToonboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from toonboard order by tboardnum desc");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int tboardnum =rs.getInt(1);
				String tboarddate = rs.getString(2) ;
				String tboardtitle = rs.getString(3);
				String tboardwriter=rs.getString(4);
				String tboardcontent =rs.getString(5);
				String tboardimg =rs.getString(6);
				int tboardhits = rs.getInt(7);
				int	tboardnomination = rs.getInt(8);
				int tboardtoday = rs.getInt(9);
				int tboardflag = rs.getInt(10);
				
				ToonboardVo tbv = new ToonboardVo(tboardnum, tboarddate, tboardtitle, tboardwriter, tboardcontent, tboardimg, tboardhits, tboardnomination, tboardtoday, tboardflag);
				
				list.add(tbv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//alldata  end
	
	
	//페이징 전체 조회
	public ArrayList<ToonboardVo> alldataToonBoard(int startNum , int endNum){
		ArrayList<ToonboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from( select rownum rn, tboardnum, tboarddate, tboardtitle, tboardwriter, tboardcontent, tboardimg, tboardhits, tboardnomination, tboardtoday, tboardflag ");
		sb.append("from(select * ");
		sb.append("from Toonboard ");
		sb.append("order by tboardnum desc )");
		sb.append("where rownum <=?) ");
		sb.append("where rn >=?  ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNum);
			pstmt.setInt(2, startNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int tboardnum =rs.getInt("tboardnum");
				String tboarddate = rs.getString("tboarddate") ;
				String tboardtitle = rs.getString("tboardtitle");
				String tboardwriter=rs.getString("tboardwriter");
				String tboardcontent =rs.getString("tboardcontent");
				String tboardimg =rs.getString("tboardimg");
				int tboardhits = rs.getInt("tboardhits");
				int	tboardnomination = rs.getInt("tboardnomination");
				int tboardtoday = rs.getInt("tboardtoday");
				int tboardflag = rs.getInt("tboardflag");
				
				ToonboardVo tbv = new ToonboardVo(tboardnum, tboarddate, tboardtitle, tboardwriter, tboardcontent, tboardimg, tboardhits, tboardnomination, tboardtoday, tboardflag);
				
				list.add(tbv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//alldata  end
	
	
	//조회수 증가
	public void incrementHits(int boardnum) {
		sb.setLength(0);
		sb.append("update toonboard ");
		sb.append("set tboardhits = tboardhits +1 ");
		sb.append("where tboardnum = ? ");
		
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
		sb.append("update toonboard ");
		sb.append("set tboardnomination = tboardnomination +1 ");
		sb.append("where tboardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//추천수 증가 end
	
	
	//전체 레코드 개수 조회
	public int countData() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) FROM TOONBOARD ");
		
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
	public void addtoonBoard(ToonboardVo tbv) {
		sb.setLength(0);
		sb.append("insert into toonboard ");
		sb.append("values(pboard_pbnum_seq.nextval, sysdate, ?,?,?,?,0,0,0,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, tbv.getTboardtitle());
			pstmt.setString(2, tbv.getTboardwriter());
			pstmt.setString(3, tbv.getTboardcontent());
			pstmt.setString(4, tbv.getTboardimg());
			pstmt.setInt(5, tbv.getTboardflag());
			
			
			pstmt.executeUpdate();
			System.out.println("삽입 성공?ㅇㅅㅇ!");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//add end	
	
	
	//한건 조회하는 메소드
	
	public ToonboardVo getData(int tboardnum) {
		sb.setLength(0);
		sb.append("select * from toonboard ");
		sb.append("where tboardnum= ? ");
		
		ToonboardVo vo=null;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, tboardnum);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			String tboarddate = rs.getString("tboarddate") ;
			String tboardtitle = rs.getString("tboardtitle");
			String tboardwriter=rs.getString("tboardwriter");
			String tboardcontent =rs.getString("tboardcontent");
			String tboardimg =rs.getString("tboardimg");
			int tboardhits = rs.getInt("tboardhits");
			int	tboardnomination = rs.getInt("tboardnomination");
			int tboardtoday = rs.getInt("tboardtoday");
			int tboardflag = rs.getInt("tboardflag");
			
			vo = new ToonboardVo(tboardnum, tboarddate, tboardtitle, tboardwriter, tboardcontent, tboardimg, tboardhits, tboardnomination, tboardtoday, tboardflag);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}//getData() end
	
	
	
	//랭킹순 정렬/좋아요 순으로
	public ArrayList<ToonboardVo> likeToonBoard(){
		ArrayList<ToonboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from toonboard order by tboardnomination desc");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int tboardnum =rs.getInt(1);
				String tboarddate = rs.getString(2) ;
				String tboardtitle = rs.getString(3);
				String tboardwriter=rs.getString(4);
				String tboardcontent =rs.getString(5);
				String tboardimg =rs.getString(6);
				int tboardhits = rs.getInt(7);
				int	tboardnomination = rs.getInt(8);
				int tboardtoday = rs.getInt(9);
				int tboardflag = rs.getInt(10);
				
				ToonboardVo tbv = new ToonboardVo(tboardnum, tboarddate, tboardtitle, tboardwriter, tboardcontent, tboardimg, tboardhits, tboardnomination, tboardtoday, tboardflag);
				
				list.add(tbv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}//랭킹순 정렬
	
	//이름으로 검색해 최신순 정렬, 글번호 가져옴
	public int getDataByName(String writer) {
		sb.setLength(0);
		sb.append("select * from toonboard ");
		sb.append("where tboardwriter =? ");
		sb.append("order by tboardnum desc ");
		
		int no =0;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, writer);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			no=rs.getInt("tboardnum");
			
			return no;
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return no;
		}
	}//getData() end
			
			
	
}
