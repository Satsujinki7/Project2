<%@page import="vo.ReplyVO"%>
<%@page import="dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bnum = request.getParameter("board_num");
	int bno = Integer.parseInt(bnum);

	ReplyDAO dao = new ReplyDAO();
	//ReplyVO vo = new ReplyVO();
	
	String rnum = request.getParameter("rep_num");
	
	int repno = 0;
	
	if(rnum!=null) {
		repno = Integer.parseInt(rnum);
		out.println("들어왔냐?");
		out.println(repno);
		
		dao.deleteReplyNum(repno);
		
		//response.sendRedirect("detailContents.jsp?boardnum=" + bno);
	} else {
		//response.sendRedirect("boardPage.jsp");
		out.println("???");
	}
%>