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
	
	
	//새글쓰기
	public void addIllBoard(IllboardVo ibv) {
		sb.setLength(0);
		sb.append("insert into illboard ");
		sb.append("values(iboard_ibnum_seq.nextval, sysdate, ?,?,?,?,0,0,0,?) ");
		
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
		
	
	
}
