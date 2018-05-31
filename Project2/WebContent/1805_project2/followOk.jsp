<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
  <%
  
  String bn = request.getParameter("bn");
  String cat = request.getParameter("cat");
  String w = request.getParameter("writer");
  String fwriter = "";
  
  
  int boardnum=0;
  if(bn !=null){
  	boardnum = Integer.parseInt(bn);
  }else{
  	response.sendRedirect("hitsError404.jsp");
  }
  
  
  
  Object ur =session.getAttribute("userId");
  String myid = ur.toString();
  
  UserDAO dao = new UserDAO();
 
  
 
  
  
  
  if(dao.getAllFollow(myid) != null){
  
  	fwriter = dao.getFollow(myid)+","+w;
  }else
	 fwriter = dao.getFollow(myid);
  
  
  dao.addFollow(myid, fwriter);
  
  
  //tring uri = request.getRequestURI();
  
  
  response.sendRedirect("page_toon.jsp");
    
  %>