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
	
	
	//새글쓰기
	public void addtoonBoard(ToonboardVo tbv) {
		sb.setLength(0);
		sb.append("insert into toonboard ");
		sb.append("values(tboard_tbnum_seq.nextval, sysdate, ?,?,?,?,0,0,0,?) ");
		
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
	
			public ToonboardVo getData(int toonboardnum) {
				sb.setLength(0);
				sb.append("select * from toonboard ");
				sb.append("where tboardnum= ? ");
				
				ToonboardVo vo=null;
				
				try {
					pstmt=conn.prepareStatement(sb.toString());
					pstmt.setInt(1, toonboardnum);
					
					rs=pstmt.executeQuery();
					rs.next();
					
					int no=rs.getInt("tboardnum");
					String writer=rs.getString("tboardwriter");
					String title=rs.getString("tboardtitle");
					String contents=rs.getString("tboardcontent");
					String date=rs.getString("tboarddate");
					String imgpath=rs.getString("tboardimg");
					
					
					
					vo=new ToonboardVo(no, date, title, writer, contents, imgpath, 0, 0, 0, 1);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return vo;
			}//getData() end
	
}
