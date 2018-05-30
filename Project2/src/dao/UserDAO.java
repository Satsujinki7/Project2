package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXE_ConnectionPJ2;
import vo.IllboardVo;
import vo.UserVO;

public class UserDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public UserDAO() {
		conn = OracleXE_ConnectionPJ2.getInstance().getConnection();
	}
	
	//유저 조회
	// 전체 조회
	public ArrayList<UserVO> getAllData(){
		
		ArrayList<UserVO> list = new ArrayList<>();
		
		sb.setLength(0);
		sb.append("select * from userinfo");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String userId = rs.getString("userid");
				String userPw = rs.getString("userpw");
				String userName = rs.getString("username");
				String userGender = rs.getString("usergender");
				int userBirth = rs.getInt("userbirth");
				String userNicName = rs.getString("usernicname");
				String userAddress = rs.getString("useraddress");
				String userPhone = rs.getString("userphone");
				String userEmail = rs.getString("useremail");
				int userFollower = rs.getInt("userfollower");
				int userFollowing = rs.getInt("userfollowing");
				String userImg = rs.getString("userimg");
				String userBio = rs.getString("userbio");
				
				UserVO vo = new UserVO(userId, userPw, userName, userGender, userBirth, userNicName,
						userAddress, userEmail, userPhone, userFollower, userFollowing, userImg, userBio);
				list.add(vo);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}//getAllData() end
	
	//로그인 정보 
	public UserVO selectedUserData(String Id, String Pw) {
		sb.setLength(0);
		sb.append("select * from userinfo ");
		sb.append("where userid = ? and userpw = ? ");
		
		UserVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, Id);
			pstmt.setString(2, Pw);
			rs = pstmt.executeQuery();
			rs.next();
			
			String userId = rs.getString("userid");
			String userPw = rs.getString("userpw");
			String userName = rs.getString("username");
			String userGender = rs.getString("usergender");
			int userBirth = rs.getInt("userbirth");
			String userNicName = rs.getString("usernicname");
			String userAddress = rs.getString("useraddress");
			String userPhone = rs.getString("userphone");
			String userEmail = rs.getString("useremail");
			int userFollower = rs.getInt("userfollower");
			int userFollowing = rs.getInt("userfollowing");
			String userImg = rs.getString("userimg");
			String userBio = rs.getString("userbio");
			
			

			vo = new UserVO(userId, userPw, userName, userGender, userBirth, userNicName,
					userAddress, userEmail, userPhone, userFollower, userFollowing, userImg, userBio);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return vo;
	} //selectedUserData end
	
	//id로만 회원 존재여부를 파악하기
	public int isExistById(String id) {
		sb.setLength(0);
		sb.append("select userid from userinfo ");
		sb.append("where userid = ? ");
		
		int dup = -1; //중복 확인용 변수(1이면 존재, -1이면 비존재)
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dup = 1;
			} else {
				dup = -1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dup;
	} //isExistById end
	
	//닉네임으로만 회원 존재여부를 파악하기
	public int isExistByNic(String nic) {
		sb.setLength(0);
		sb.append("select userNicName from userinfo ");
		sb.append("where userNicName = ? ");
		
		int dup = -1; //중복 확인용 변수(1이면 존재, -1이면 비존재)
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, nic);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dup = 1;
			} else {
				dup = -1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dup;
	} //isExistById end
	
	//DB에 유저 정보 등록
	public void addUser(UserVO vo) {
		sb.setLength(0);
		sb.append("insert into userinfo ");
		sb.append("values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?) ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getUserPw());
			pstmt.setString(3, vo.getUserName());
			pstmt.setString(4, vo.getUserGender());
			pstmt.setInt(5, vo.getUserBirth());
			pstmt.setString(6, vo.getUserNicName());
			pstmt.setString(7, vo.getUserPhone());
			pstmt.setString(8, vo.getUserEmail());
			pstmt.setString(9, vo.getUserAddress());
			pstmt.setInt(10, vo.getUserFollower());
			pstmt.setInt(11, vo.getUserFollowing());
			pstmt.setString(12, vo.getUserImg());
			pstmt.setString(13, vo.getUserBio());
			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	} //addUser() end
	
	
	//userUpdate
	public void userUpdate(UserVO vo) {
		sb.setLength(0);
		//update userinfo set userpw = 'aaa' , username = 'AAA' where userid = 'aaa';

		sb.append("update userInfo ");
		sb.append("set userpw = ?, usernicname = ?, useremail =?, ");
		sb.append("userbio =? , userimg =? ");
		sb.append("where userid =? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getUserPw());
			pstmt.setString(2, vo.getUserNicName());
			pstmt.setString(3, vo.getUserEmail());
			pstmt.setString(4, vo.getUserBio());
			pstmt.setString(5, vo.getUserImg());
			pstmt.setString(6, vo.getUserId());
			
			pstmt.executeUpdate();
			
			System.out.println("업데이트 완료!!?");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	//한건 조회하는 메소드
 	public UserVO getData(String iboardwriter) {
		sb.setLength(0);
		sb.append("select * from userinfo ");
		sb.append("where username= ? ");
		
		UserVO vo=null;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, iboardwriter);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			String userName =rs.getString("username");
			String userId = rs.getString("userid");
			String userPw = rs.getString("userpw");
			String userGender = rs.getString("usergender");
			int userBirth = rs.getInt("userbirth");
			String userNicName = rs.getString("usernicname");
			String userAddress = rs.getString("useraddress");
			String userPhone = rs.getString("userphone");
			String userEmail = rs.getString("useremail");
			int userFollower = rs.getInt("userfollower");
			int userFollowing = rs.getInt("userfollowing");
			String userImg = rs.getString("userimg");
			String userBio = rs.getString("userbio");
			
			

			vo = new UserVO(userId, userPw, userName, userGender, userBirth, userNicName,
					userAddress, userEmail, userPhone, userFollower, userFollowing, userImg, userBio);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}//getData()  end
	
	
	//유저 아이디로 유저 이름 검색
	public UserVO getDataById(String writer) {
		sb.setLength(0);
		sb.append("select * from userinfo ");
		sb.append("where userid= ? ");
		
		UserVO vo=null;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, writer);
			
			rs=pstmt.executeQuery();
			rs.next();
			
			String userName =rs.getString("username");
			String userId = rs.getString("userid");
			String userPw = rs.getString("userpw");
			String userGender = rs.getString("usergender");
			int userBirth = rs.getInt("userbirth");
			String userNicName = rs.getString("usernicname");
			String userAddress = rs.getString("useraddress");
			String userPhone = rs.getString("userphone");
			String userEmail = rs.getString("useremail");
			int userFollower = rs.getInt("userfollower");
			int userFollowing = rs.getInt("userfollowing");
			String userImg = rs.getString("userimg");
			String userBio = rs.getString("userbio");
			
			

			vo = new UserVO(userId, userPw, userName, userGender, userBirth, userNicName,
					userAddress, userEmail, userPhone, userFollower, userFollowing, userImg, userBio);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}//getData()  end
	
	
	
	
}
