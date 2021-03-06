package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.PrdboardVo;

public class PrdBoardDao {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn =null;
	
	public PrdBoardDao(){
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//전체조회 ->업로드 순으로 
	public ArrayList<PrdboardVo> alldataPrdBoard(){
		ArrayList<PrdboardVo> list = new ArrayList<>() ;
		
		sb.setLength(0);
		sb.append("select * from prdboard order by pboardnum desc");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pboardnum =rs.getInt(1);
				String pboarddate = rs.getString(2) ;
				String pboardtitle = rs.getString(3);
				String pboardwriter=rs.getString(4);
				String pboardcontent =rs.getString(5);
				String pboardimg =rs.getString(6);
				int pboardhits = rs.getInt(7);
				int	pboardnomination = rs.getInt(8);
				int pboardtoday = rs.getInt(9);
				int pboardflag = rs.getInt(10);
				
				PrdboardVo pbv = new PrdboardVo(pboardnum, pboarddate, pboardtitle, pboardwriter, pboardcontent, pboardimg, pboardhits, pboardnomination, pboardtoday, pboardflag);
				
				list.add(pbv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}//alldata end
	
	
	public ArrayList<PrdboardVo> alldataPrdBoardByName(String writer){
		ArrayList<PrdboardVo> list = new ArrayList<>() ;
		
		sb.setLength(0);
		sb.append("select * from prdboard where pboardwriter =? order by pboardnum desc");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pboardnum =rs.getInt(1);
				String pboarddate = rs.getString(2) ;
				String pboardtitle = rs.getString(3);
				String pboardwriter=rs.getString(4);
				String pboardcontent =rs.getString(5);
				String pboardimg =rs.getString(6);
				int pboardhits = rs.getInt(7);
				int	pboardnomination = rs.getInt(8);
				int pboardtoday = rs.getInt(9);
				int pboardflag = rs.getInt(10);
				
				PrdboardVo pbv = new PrdboardVo(pboardnum, pboarddate, pboardtitle, pboardwriter, pboardcontent, pboardimg, pboardhits, pboardnomination, pboardtoday, pboardflag);
				
				list.add(pbv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}//alldata end
	
	
	//전체조회 ->좋아요 순으로 
	public ArrayList<PrdboardVo> likePrdBoard(){
		ArrayList<PrdboardVo> list = new ArrayList<>() ;
		
		sb.setLength(0);
		sb.append("select * from prdboard order by pboardnomination desc");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pboardnum =rs.getInt(1);
				String pboarddate = rs.getString(2) ;
				String pboardtitle = rs.getString(3);
				String pboardwriter=rs.getString(4);
				String pboardcontent =rs.getString(5);
				String pboardimg =rs.getString(6);
				int pboardhits = rs.getInt(7);
				int	pboardnomination = rs.getInt(8);
				int pboardtoday = rs.getInt(9);
				int pboardflag = rs.getInt(10);
				
				PrdboardVo pbv = new PrdboardVo(pboardnum, pboarddate, pboardtitle, pboardwriter, pboardcontent, pboardimg, pboardhits, pboardnomination, pboardtoday, pboardflag);
				
				list.add(pbv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}//alldata end

	
	//페이징 처리된 전체조회
	public ArrayList<PrdboardVo> alldataPrdBoard(int startNum , int endNum){
		ArrayList<PrdboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from( select rownum rn, pboardnum, pboarddate, pboardtitle, pboardwriter, pboardcontent, pboardimg, pboardhits, pboardnomination, pboardtoday, pboardflag ");
		sb.append("from(select * ");
		sb.append("from prdboard ");
		sb.append("order by pboardnum desc )");
		sb.append("where rownum <=?) ");
		sb.append("where rn >=?  ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNum);
			pstmt.setInt(2, startNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pboardnum =rs.getInt("pboardnum");
				String pboarddate = rs.getString("pboarddate") ;
				String pboardtitle = rs.getString("pboardtitle");
				String pboardwriter=rs.getString("pboardwriter");
				String pboardcontent =rs.getString("pboardcontent");
				String pboardimg =rs.getString("pboardimg");
				int pboardhits = rs.getInt("pboardhits");
				int	pboardnomination = rs.getInt("pboardnomination");
				int pboardtoday = rs.getInt("pboardtoday");
				int pboardflag = rs.getInt("pboardflag");
				
				PrdboardVo pbv = new PrdboardVo(pboardnum, pboarddate, pboardtitle, pboardwriter, pboardcontent, pboardimg, pboardhits, pboardnomination, pboardtoday, pboardflag);
				
				list.add(pbv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}//alldata end
	
	
	//새글쓰기
	public void addPrdBoard(PrdboardVo pbv) {
		sb.setLength(0);
		sb.append("insert into prdboard ");
		sb.append("values(pboard_pbnum_seq.nextval, sysdate, ?,?,?,?,0,0,0,?,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, pbv.getPboardtitle());
			pstmt.setString(2, pbv.getPboardwriter());
			pstmt.setString(3, pbv.getPboardcontent());
			pstmt.setString(4, pbv.getPboardimg());
			pstmt.setInt(5, pbv.getPboardflag());
			pstmt.setString(6, pbv.getPrdtag());
			
			
			pstmt.executeUpdate();
			System.out.println("삽입 성공?ㅇㅅㅇ!");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}//add end	
	
	
	//한건 조회하는 메소드
	public PrdboardVo getData(int boardnum) {
		sb.setLength(0);
		sb.append("select * from Prdboard ");
		sb.append("where pboardnum= ? ");
		
		PrdboardVo vo=null;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardnum);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			int pboardnum =rs.getInt("pboardnum");
			String pboarddate = rs.getString("pboarddate") ;
			String pboardtitle = rs.getString("pboardtitle");
			String pboardwriter=rs.getString("pboardwriter");
			String pboardcontent =rs.getString("pboardcontent");
			String pboardimg =rs.getString("pboardimg");
			int pboardhits = rs.getInt("pboardhits");
			int	pboardnomination = rs.getInt("pboardnomination");
			int pboardtoday = rs.getInt("pboardtoday");
			int pboardflag = rs.getInt("pboardflag");
			String prdtag = rs.getString("prdtag");
			
			vo = new PrdboardVo(pboardnum, pboarddate, pboardtitle, pboardwriter, pboardcontent, pboardimg, pboardhits, pboardnomination, pboardtoday, pboardflag,prdtag);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return vo;
	}//getData() end
	
	
	//조회수 올리기!
	public void incrementHits(int boardnum) {
		sb.setLength(0);
		sb.append("update prdboard ");
		sb.append("set pboardhits = pboardhits +1 ");
		sb.append("where pboardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}//조회수 증가
	
	
	//추천수 증가
	public void incrementNomination(int boardnum) {
		sb.setLength(0);
		sb.append("update prdboard ");
		sb.append("set pboardnomination = pboardnomination +1 ");
		sb.append("where pboardnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}//추천수 증가 end
	
	//전체 게시글
	public int countData() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) FROM PRDBOARD ");
		
		int DataNum =0;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			rs.next();
			
			DataNum = rs.getInt(1);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return DataNum;
	}//countdata end
	
	//이름으로 검색하여 최신순 정렬한 뒤 글번호를 가져옴
	public int getDataByName(String writer) {
		sb.setLength(0);
		sb.append("select * from prdboard ");
		sb.append("where pboardwriter =? ");
		sb.append("order by pboardnum desc ");
		
		int no =0;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, writer);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			no=rs.getInt("pboardnum");
			
			return no;
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return no;
		} finally {
			close();
		}
	
	}//getData() end
	
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
