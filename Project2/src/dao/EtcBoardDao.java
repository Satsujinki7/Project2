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
		}
		
		return list;
	}//alldata end
	
	
	//새글쓰기
	public void addEtcBoard(EtcboardVo ebv) {
		sb.setLength(0);
		sb.append("insert into etcboard ");
		sb.append("values(eboard_ebnum_seq.nextval, sysdate, ?,?,?,?,0,0,0,?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, ebv.getEboardtitle());
			pstmt.setString(2, ebv.getEboardwriter());
			pstmt.setString(3, ebv.getEboardcontent());
			pstmt.setString(4, ebv.getEboardimg());
			pstmt.setInt(5, ebv.getEboardflag());
			
			
			pstmt.executeUpdate();
			System.out.println("삽입 성공?ㅇㅅㅇ!");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
				
				int no=rs.getInt("eboardnum");
				String writer=rs.getString("eboardwriter");
				String title=rs.getString("eboardtitle");
				String contents=rs.getString("eboardcontent");
				String date=rs.getString("eboarddate");
				String imgpath=rs.getString("eboardimg");
				
				
				
				vo=new EtcboardVo(no, date, title, writer, contents, imgpath, 0, 0, 0, 1);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;
		}//getData() end
		
	
	
}
