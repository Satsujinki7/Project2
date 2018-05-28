package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyDAO;
import vo.ReplyVO;
import vo.UserVO;

public class DoWriteReply extends HttpServlet {
	private ReplyDAO r_dao;
	
	public DoWriteReply() {
		super();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Error!!!");
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int replyBoardNum = Integer.parseInt(req.getParameter("replyboardnum"));
		int replyNum = Integer.parseInt(req.getParameter("replynum"));
		int groupNum = Integer.parseInt(req.getParameter("groupnum"));
		int orderNum = Integer.parseInt(req.getParameter("ordernum"));
		int depth = Integer.parseInt(req.getParameter("depth"));
		int parentReplyNum = Integer.parseInt(req.getParameter("parentreplynum"));
		String replyComment = req.getParameter("replycomment");
		replyComment = replyComment.replaceAll("\n", "<br>");
		
		System.out.println("depth : " + depth);
		System.out.println("groupNum : " + groupNum);
		System.out.println("orderNum : " + orderNum);
		System.out.println("parentReplyNum : " + parentReplyNum);
		
		ReplyVO r_vo = new ReplyVO();
		r_vo.setReplyBoardNum(replyBoardNum);
		r_vo.setReplyNum(replyNum);
		r_vo.setGroupNum(groupNum);
		r_vo.setOrderNum(orderNum);
		r_vo.setParentReplyNum(parentReplyNum);
		r_vo.setDepth(depth);
		r_vo.setReplyComment(replyComment);
		
		HttpSession session = req.getSession();
		UserVO u_name = (UserVO) session.getAttribute("userName");
		
		if(u_name != null) {
			r_vo.setReplyWriter(u_name.getUserName());
		}
		
		r_dao.addNewReplyDepth(r_vo);
		resp.sendRedirect("../WebContent/detailContents?replyboardnum=" + replyBoardNum);
	}
}
