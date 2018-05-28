<%@page import="vo.ReplyVO"%>
<%@page import="dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String rnum = request.getParameter("rep_num");
	String bnum = request.getParameter("boardnum");
	
	int repno = 0;
	int bno = 0;
	
	if(rnum!=null && bnum!=null) {
		repno = Integer.parseInt(rnum);
		bno = Integer.parseInt(bnum);
		out.println("들어왔냐?");
		out.println(repno + "," + bno);
		
		ReplyDAO dao = new ReplyDAO();
		ReplyVO vo = new ReplyVO();
		
		dao.deleteReplyNum(bno, repno);
		
		//response.sendRedirect("detailContents.jsp?boardnum=" + bno);
	} else {
		//response.sendRedirect("boardPage.jsp");
		out.println("???");
	}
%>