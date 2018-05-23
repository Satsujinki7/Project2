<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String boardNum = request.getParameter("boardnum");
	int bnum = 0;
	
	if(boardNum!=null) {
		bnum = Integer.parseInt(boardNum);
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		dao.incrementNomination(bnum);
		vo = dao.boardnumData(bnum);
		
		response.sendRedirect("detailContents.jsp?boardnum=" + bnum);
	} else {
		response.sendRedirect("boardPage.jsp");
	}
%>