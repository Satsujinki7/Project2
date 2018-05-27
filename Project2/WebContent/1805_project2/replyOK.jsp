<%@page import="vo.ReplyVO"%>
<%@page import="dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String boardNum = request.getParameter("boardnum");
	//String userId = request.getParameter("userid");
	String userId = (String)session.getAttribute("userName");
	String replyComment = request.getParameter("reply");
	
	int bno = 0;
	
	if(boardNum != null) {
		bno = Integer.parseInt(boardNum);
		
		ReplyDAO dao = new ReplyDAO();
		ReplyVO vo = new ReplyVO();
		vo.setReplyBoardNum(bno);
		vo.setReplyWriter(userId);
		vo.setReplyComment(replyComment);
		
		dao.addReply(vo);
		
		response.sendRedirect("detailContents.jsp?boardnum=" + bno);
	} else {
		response.sendRedirect("detailContents.jsp");
	}
%>