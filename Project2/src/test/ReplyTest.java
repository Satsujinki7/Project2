package test;

import java.util.ArrayList;

import dao.ReplyV2_DAO;
import vo.ReplyVO;

public class ReplyTest {
	public static void main(String[] args) {
		ReplyV2_DAO r_dao = new ReplyV2_DAO();
	
		
		ArrayList<ReplyVO> r_list = r_dao.getAllReply(6);
		
		ReplyVO vo = new ReplyVO();
		
		
		for(int i=0; i<r_list.size(); i++) {
			vo = r_list.get(i);
			System.out.println(vo.getReplyNum());
		}
		
		
		
	}
}
