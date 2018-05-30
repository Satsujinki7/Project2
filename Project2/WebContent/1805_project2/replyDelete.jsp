<%@page import="dao.ReplyV2_DAO"%>
<%@page import="vo.ReplyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bnum = request.getParameter("board_num");
 	String rnum = request.getParameter("rep_num");
 	String gnum = request.getParameter("rep_groupnum");
 	String pnum = request.getParameter("rep_parentnum");
	
	
	int bno = Integer.parseInt(bnum);
	int pno = Integer.parseInt(pnum);

	//ReplyDAO dao = new ReplyDAO();
	ReplyV2_DAO dao2 = new ReplyV2_DAO();
	//ReplyVO vo = new ReplyVO();
	
	
	int repno = 0;
	
	if(rnum!=null) {
		repno = Integer.parseInt(rnum);
		
		out.println("들어왔냐?");
		out.println(repno);
		
		ReplyVO pvo = dao2.getCurrentReply(repno);
		ReplyVO vo = new ReplyVO();
		
		out.println(pvo.getReplyNum() + ", " + pvo.getParentReplyNum());
		
		dao2.deleteReplyNum(repno);
		
		response.sendRedirect("detailContents.jsp?boardnum=" + bno);
	} else {
		//response.sendRedirect("boardPage.jsp");
		out.println("???");
	}
%>