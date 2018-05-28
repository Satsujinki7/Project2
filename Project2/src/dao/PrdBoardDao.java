package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.PrdboardVo;
import vo.ToonboardVo;

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
		ArrayList<PrdboardVo> list = new ArrayList<>();
		
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
		}
		
		return list;
	}//alldata end
	
	
	//새글쓰기
	public void addPrdBoard(PrdboardVo pbv) {
		sb.setLength(0);
		sb.append("insert into prdboard ");
		sb.append("values(pboard_pbnum_seq.nextval, sysdate, ?,?,?,?,0,0,0,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, pbv.getPboardtitle());
			pstmt.setString(2, pbv.getPboardwriter());
			pstmt.setString(3, pbv.getPboardcontent());
			pstmt.setString(4, pbv.getPboardimg());
			pstmt.setInt(5, pbv.getPboardflag());
			
			
			pstmt.executeUpdate();
			System.out.println("삽입 성공?ㅇㅅㅇ!");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
			
			int no=rs.getInt("pboardnum");
			String writer=rs.getString("pboardwriter");
			String title=rs.getString("pboardtitle");
			String contents=rs.getString("pboardcontent");
			String date=rs.getString("pboarddate");
			String imgpath=rs.getString("pboardimg");
			
			vo=new PrdboardVo(no, date, title, writer, contents, imgpath, 0, 0, 0, 1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}//getData() end
}
