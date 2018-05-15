<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//ID 중복확인용 페이지
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	UserDAO dao = new UserDAO();
	int dup = dao.isExistById(id);
	
	if(dup == 1) {
		out.println("입력한 ID는 이미 존재하는 ID입니다.");
	} else if(dup == -1) {
		out.println("입력한 ID는 사용이 가능합니다.");
	}
%>