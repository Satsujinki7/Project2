package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.EtcboardVo;

public class EtcBoardDao {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn =null;
	
	public EtcBoardDao(){
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//전체조회 ->업로드 순으로 
	public ArrayList<EtcboardVo> alldataEtcBoard(){
		ArrayList<EtcboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from etcboard order by eboardnum desc");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int eboardnum =rs.getInt(1);
				String eboarddate = rs.getString(2) ;
				String eboardtitle = rs.getString(3);
				String eboardwriter=rs.getString(4);
				String eboardcontent =rs.getString(5);
				String eboardimg =rs.getString(6);
				int eboardhits = rs.getInt(7);
				int	eboardnomination = rs.getInt(8);
				int eboardtoday = rs.getInt(9);
				int eboardflag = rs.getInt(10);
				
				EtcboardVo ebv = new EtcboardVo(eboardnum, eboarddate, eboardtitle, eboardwriter, eboardcontent, eboardimg, eboardhits, eboardnomination, eboardtoday, eboardflag);
				
				list.add(ebv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}//alldata end
	
	
	//좋아요 순 으로 정렬
	public ArrayList<EtcboardVo> likeEtcBoard(){
		ArrayList<EtcboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from etcboard order by eboardnomination desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int eboardnum =rs.getInt(1);
				String eboarddate = rs.getString(2) ;
				String eboardtitle = rs.getString(3);
				String eboardwriter=rs.getString(4);
				String eboardcontent =rs.getString(5);
				String eboardimg =rs.getString(6);
				int eboardhits = rs.getInt(7);
				int	eboardnomination = rs.getInt(8);
				int eboardtoday = rs.getInt(9);
				int eboardflag = rs.getInt(10);
				
				EtcboardVo ebv = new EtcboardVo(eboardnum, eboarddate, eboardtitle, eboardwriter, eboardcontent, eboardimg, eboardhits, eboardnomination, eboardtoday, eboardflag);
				
				list.add(ebv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}//alldata end
	
	
	//페이징 된 전체조회
	public ArrayList<EtcboardVo> alldataEtcBoard(int startNum, int endNum){
		ArrayList<EtcboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from( select rownum rn, eboardnum, eboarddate, eboardtitle, eboardwriter, eboardcontent, eboardimg, eboardhits, eboardnomination, eboardtoday, eboardflag ");
		sb.append("from(select * ");
		sb.append("from etcboard ");
		sb.append("order by eboardnum desc )");
		sb.append("where rownum <=?) ");
		sb.append("where rn >=?  ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNum);
			pstmt.setInt(2, startNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int eboardnum =rs.getInt("eboardnum");
				String eboarddate = rs.getString("eboarddate") ;
				String eboardtitle = rs.getString("eboardtitle");
				String eboardwriter=rs.getString("eboardwriter");
				String eboardcontent =rs.getString("eboardcontent");
				String eboardimg =rs.getString("eboardimg");
				int eboardhits = rs.getInt("eboardhits");
				int	eboardnomination = rs.getInt("eboardnomination");
				int eboardtoday = rs.getInt("eboardtoday");
				int eboardflag = rs.getInt("eboardflag");
				
				EtcboardVo ebv = new EtcboardVo(eboardnum, eboarddate, eboardtitle, eboardwriter, eboardcontent, eboardimg, eboardhits, eboardnomination, eboardtoday, eboardflag);
				
				list.add(ebv);
			}//while end
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}//alldata end
	
	//총 게시글 개수 조회
	public int countData() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) FROM ETCBOARD ");
		
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
	
	//새글쓰기
	public void addEtcBoard(EtcboardVo ebv) {
		sb.setLength(0);
		sb.append("insert into etcboard ");
		sb.append("values(pboard_pbnum_seq.nextval, sysdate, ?,?,?,?,0,0,0,?,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, ebv.getEboardtitle());
			pstmt.setString(2, ebv.getEboardwriter());
			pstmt.setString(3, ebv.getEboardcontent());
			pstmt.setString(4, ebv.getEboardimg());
			pstmt.setInt(5, ebv.getEboardflag());
			pstmt.setString(6, ebv.getEtctag());
			
			pstmt.executeUpdate();
			System.out.println("삽입 성공?ㅇㅅㅇ!");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}//add end
	
	//한건 조회하는  메소드
	public EtcboardVo getData(int eboardnum) {
		sb.setLength(0);
		sb.append("select * from etcboard ");
		sb.append("where eboardnum= ? ");
		
		EtcboardVo vo=null;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, eboardnum);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			String eboarddate = rs.getString("eboarddate") ;
			String eboardtitle = rs.getString("eboardtitle");
			String eboardwriter=rs.getString("eboardwriter");
			String eboardcontent =rs.getString("eboardcontent");
			String eboardimg =rs.getString("eboardimg");
			int eboardhits = rs.getInt("eboardhits");
			int	eboardnomination = rs.getInt("eboardnomination");
			int eboardtoday = rs.getInt("eboardtoday");
			int eboardflag = rs.getInt("eboardflag");
			String etctag = rs.getString("etctag");
			
			vo = new EtcboardVo(eboardnum, eboarddate, eboardtitle, eboardwriter, eboardcontent, eboardimg, eboardhits, eboardnomination, eboardtoday, eboardflag,etctag);
			
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
		sb.append("update etcboard ");
		sb.append("set eboardhits = eboardhits +1 ");
		sb.append("where eboardnum = ? ");
		
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
		sb.append("update etcboard ");
		sb.append("set eboardnomination = eboardnomination +1 ");
		sb.append("where eboardnum = ? ");
		
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
	
	//이름으로 검색하여 최신순 정렬한 뒤 글번호를 가져옴
	public int getDataByName(String writer) {
		sb.setLength(0);
		sb.append("select * from Etcboard ");
		sb.append("where eboardwriter =? ");
		sb.append("order by eboardnum desc ");
		
		int no =0;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, writer);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			no=rs.getInt("eboardnum");
			
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
