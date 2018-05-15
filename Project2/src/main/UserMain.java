package main;

import java.util.ArrayList;

import dao.UserDAO;
import vo.UserVO;

public class UserMain {
	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
	/*	ArrayList<UserVO> list = dao.getAllData();
		for(UserVO vo : list) {
			System.out.println(vo.getUserId());
		}*/
		
		vo.setUserId("t");
		
		dao.addUser(vo);
		
	}
}
