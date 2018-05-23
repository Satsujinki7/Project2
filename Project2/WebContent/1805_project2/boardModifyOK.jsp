<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String boardNum = request.getParameter("boardNum");
	String boardTitle = request.getParameter("boardTitle");
	String boardContents = request.getParameter("context");

	int bno = 0;
	
	if(boardNum!=null) {
		bno = Integer.parseInt(boardNum);
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setBoardNum(bno);
		vo.setBoardTitle(boardTitle);
		vo.setBoardContents(boardContents);
		
		dao.modifyBoardData(vo);
		
		response.sendRedirect("boardPage.jsp");
	} else {
		response.sendRedirect("boardPage.jsp");
	}
%>