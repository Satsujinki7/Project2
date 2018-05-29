<%@page import="vo.ReplyVO"%>
<%@page import="dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bnum = request.getParameter("board_num");
	int bno = Integer.parseInt(bnum);
	String userId = (String)session.getAttribute("userName");
	String replyComment = request.getParameter("re_reply");

	ReplyDAO dao = new ReplyDAO();
	//ReplyVO vo = new ReplyVO();
	
	String rnum = request.getParameter("rep_num");
	String rgnum = request.getParameter("rep_groupnum");
	String rpnum = request.getParameter("rep_parentnum");
	String rdepth = request.getParameter("rep_depth");
	String ronum = request.getParameter("rep_ordernum");
	//String bnum = request.getParameter("board_num");
	
	int repno = 0;
	
	if(rnum!=null) {
		repno = Integer.parseInt(rnum);
		int pnum = Integer.parseInt(rpnum);
		int gnum = Integer.parseInt(rgnum);
		int depth = Integer.parseInt(rdepth);
		int onum = Integer.parseInt(ronum);
		out.println("들어왔냐?");
		out.println(repno);
		
		ReplyVO vo = new ReplyVO();
		vo.setReplyBoardNum(bno);
		vo.setReplyWriter(userId);
		vo.setReplyComment(replyComment);
		vo.setGroupNum(gnum);
		vo.setDepth(depth+1);
		vo.setParentReplyNum(repno);
		vo.setOrderNum(onum+1);
		dao.addReply(vo);
		
		//response.sendRedirect("detailContents.jsp?boardnum=" + bno);
	} else {
		//response.sendRedirect("boardPage.jsp");
		out.println("???");
	}
%>