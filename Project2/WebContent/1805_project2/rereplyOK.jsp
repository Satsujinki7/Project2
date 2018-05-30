<%@page import="dao.ReplyV2_DAO"%>
<%@page import="vo.ReplyVO"%>
<%@page import="dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bnum = request.getParameter("board_num");
	int bno = Integer.parseInt(bnum);
	String userId = (String)session.getAttribute("userName");
	String replyComment = request.getParameter("re_reply");

	
	String rnum = request.getParameter("rep_num");
	/* String rgnum = request.getParameter("rep_groupnum");
	String rdepth = request.getParameter("rep_depth");
	String ronum = request.getParameter("rep_ordernum"); */
	String rpnum = request.getParameter("rep_parentnum");
	
	//ReplyDAO dao = new ReplyDAO();
	
	if(rnum!=null) {
		int repno = 0;
		int parent = 0;
		repno = Integer.parseInt(rnum);
		parent = Integer.parseInt(rpnum);
		/* int pnum = Integer.parseInt(rpnum);
		int gnum = Integer.parseInt(rgnum);
		int depth = Integer.parseInt(rdepth);
		int onum = Integer.parseInt(ronum);
		out.println("들어왔냐?");
		out.println(repno); */
		
		ReplyV2_DAO dao = new ReplyV2_DAO();
		
		ReplyVO pvo = dao.getCurrentReply(repno);
		ReplyVO vo = new ReplyVO();
		dao.modDepthData(pvo);
		
		/* vo.setReplyBoardNum(bno);
		vo.setReplyWriter(userId);
		vo.setReplyComment(replyComment);
		vo.setGroupNum(gnum);
		vo.setDepth(depth);
		vo.setParentReplyNum(repno);
		vo.setOrderNum(onum);
		dao.addReReply(vo); */
		
		vo.setReplyBoardNum(bno);
		vo.setReplyWriter(userId);
		vo.setReplyComment(replyComment);
		vo.setGroupNum(pvo.getGroupNum());
		vo.setDepth(pvo.getDepth());
		vo.setOrderNum(pvo.getOrderNum());
		vo.setParentReplyNum(pvo.getReplyNum());
		/* vo.setParentReplyNum(parent); */
		
		//dao.updateOrderNumByGroupNum(vo);
		dao.addReReply(vo);
		
		out.println("대댓글 작성완료");
		out.println(repno + ", " + vo.getParentReplyNum());
		response.sendRedirect("detailContents.jsp?boardnum=" + bno);
	} else {
		response.sendRedirect("boardPage.jsp");
	}
%>