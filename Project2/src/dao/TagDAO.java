package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.catalina.connector.Request;

import connection.OracleXE_ConnectionPJ2;
import vo.EtcboardVo;
import vo.IllboardVo;
import vo.PrdboardVo;
import vo.ToonboardVo;

public class TagDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public TagDAO() {
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	
	
	//tag가 이미 존재하는지 확인 
	public boolean isExistByTag(String tag) {
		
		sb.setLength(0);
		sb.append("select "+tag+" from tag ");

	
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			return true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		
	
	}
	
	
	
	
	//태그가 없을 때 태그를 추가
	public void addNewTag(String tag) {
		
		sb.setLength(0);
		sb.append("alter table tag ");
		sb.append("add ("+tag+" number(10)) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		
	}//addNewTag() end

	
	
	
	//태그에 데이터 추가 
	public void addData(String tag,int number) {
		
		sb.setLength(0);
		sb.append("insert into tag("+tag+") ");
		sb.append("values (?) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, number);
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}//addData() end
	

	
	//태그 서칭시 태그이름 넘겨주기 
	
	
	public ArrayList<IllboardVo> illTagList(String searchtag) {
		
		ArrayList<IllboardVo> list = new ArrayList<>();
			
		sb.setLength(0);
		sb.append("select * from illboard ");
		sb.append("where iboardnum in (select "+searchtag+" from tag where "+searchtag+" is not null) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
		
			
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
			
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
		
	}
		
	
	
	
	
	public ArrayList<ToonboardVo> toonTagList(String searchtag) {
		
		ArrayList<ToonboardVo> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from toonboard ");
		sb.append("where tboardnum in (select "+searchtag+" from tag where "+searchtag+" is not null) ");
		

		try {
			pstmt = conn.prepareStatement(sb.toString());
		
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
	}
		
		
	
	
	
	public ArrayList<PrdboardVo> prdTagList(String searchtag) {
		
		ArrayList<PrdboardVo> list = new ArrayList<>();

		
		sb.setLength(0);
		sb.append("select * from prdboard ");
		sb.append("where pboardnum in (select "+searchtag+" from tag where "+searchtag+" is not null) ");
		
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
		
	}
		
	
	public ArrayList<EtcboardVo> etcTagList(String searchtag) {
	
		ArrayList<EtcboardVo> list = new ArrayList<>();

		
		sb.setLength(0);
		sb.append("select * from etcboard ");
		sb.append("where eboardnum in (select "+searchtag+" from tag where "+searchtag+" is not null) ");
		
		
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
		
	}

	
	
}
