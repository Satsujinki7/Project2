<%@page import="dao.PrdBoardDao"%>
<%@page import="dao.ToonBoardDao"%>
<%@page import="dao.EtcBoardDao"%>
<%@page import="dao.IllBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String bn = request.getParameter("bn");
String cat = request.getParameter("cat");
int boardnum=0;
if(bn !=null){
	boardnum = Integer.parseInt(bn);
}else{
	response.sendRedirect("hitsError404.jsp");
}

if(cat.equals("ill")){
	IllBoardDao dao = new IllBoardDao();
	dao.incrementNomination(boardnum);
	
	response.sendRedirect("detail.jsp?boardnum="+boardnum+"&category=ill");
	
}else if(cat.equals("etc")){
	EtcBoardDao dao = new EtcBoardDao();
	dao.incrementNomination(boardnum);
	
	response.sendRedirect("detail.jsp?boardnum="+boardnum+"&category=etc");
	
}else if(cat.equals("toon")){
	ToonBoardDao dao = new ToonBoardDao();
	dao.incrementNomination(boardnum);
	
	response.sendRedirect("detail.jsp?boardnum="+boardnum+"&category=toon");

}else if(cat.equals("prd")){
	PrdBoardDao dao = new PrdBoardDao();
	dao.incrementNomination(boardnum);
	
	response.sendRedirect("detail.jsp?boardnum="+boardnum+"&category=prd");
	
}else{
	response.sendRedirect("hitsError404.jsp");
}

%>
