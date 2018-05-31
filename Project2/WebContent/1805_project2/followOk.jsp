<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
  <%
  
  String bn = request.getParameter("bn");
  String cat = request.getParameter("cat");
  String w = request.getParameter("writer");
  
  
  int boardnum=0;
  if(bn !=null){
  	boardnum = Integer.parseInt(bn);
  }else{
  	response.sendRedirect("hitsError404.jsp");
  }
  
  
  
  Object ur =session.getAttribute("userId");
  String myid = ur.toString();
  
  UserDAO dao = new UserDAO();
  
  UserVO vo = dao.getData(w);
  
 
  
  
  
  if(dao.getAllFollow(myid) != null){
  
  	w = dao.getFollow(myid)+","+w;
  }else
	 w = dao.getFollow(myid);
  
  
  dao.addFollow(myid, w);
  
  
  String uri = request.getRequestURI();
  
  
  response.sendRedirect(uri);
    
  %>