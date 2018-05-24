<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String bnum = request.getParameter("bnum");
	int bno = 0;
	out.println(bnum);
	
	if(bnum!=null) {
		bno = Integer.parseInt(bnum);
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		dao.deleteBoardData(bno);
		
		response.sendRedirect("boardPage.jsp");
	} else {
		response.sendRedirect("boardPage.jsp");
	}
%>