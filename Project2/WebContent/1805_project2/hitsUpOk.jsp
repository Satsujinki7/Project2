<%@page import="vo.IllboardVo"%>
<%@page import="dao.PrdBoardDao"%>
<%@page import="dao.EtcBoardDao"%>
<%@page import="dao.ToonBoardDao"%>
<%@page import="dao.IllBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 조회수 올라가는거 만들기  -->
<%
//주소창에 넘어오는 데이터 boardnum= 보드넘버 / category = ill
String bn  = request.getParameter("boardnum");
String cate = request.getParameter("category");
int boardnum = 0;

if(bn != null && cate !=null){
	boardnum = Integer.parseInt(bn);
}else {
	response.sendRedirect("hitsError404.jsp");
}

//카테고리별 대응 해주기!
if(cate.equals("ill")){
	IllBoardDao dao = new IllBoardDao();
	IllboardVo vo = new IllboardVo();
	dao.incrementHits(boardnum);
	
	response.sendRedirect("detail.jsp?boardnum="+boardnum+"&category=ill");
	
}else if(cate.equals("toon")){
	ToonBoardDao dao = new ToonBoardDao();
	
	dao.incrementHits(boardnum);
	
	response.sendRedirect("detail.jsp?boardnum="+boardnum+"&category=toon");
	
}else if(cate.equals("etc")){
	EtcBoardDao dao = new EtcBoardDao();
	
	dao.incrementHits(boardnum);
	
	response.sendRedirect("detail.jsp?boardnum="+boardnum+"&category=etc");
	
}else if(cate.equals("prd")){
	PrdBoardDao dao = new PrdBoardDao();
	
	dao.incrementHits(boardnum);
	
	response.sendRedirect("detail.jsp?boardnum="+boardnum+"&category=prd");
}

%>
