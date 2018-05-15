<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//닉네임 중복확인용 페이지
	request.setCharacterEncoding("UTF-8");
	String nic = request.getParameter("nic");
	
	UserDAO dao = new UserDAO();
	int dup = dao.isExistByNic(nic);
	
	if(dup == 1) {
		out.println("입력한 닉네임은 이미 존재하는 닉네임입니다.");
	} else if(dup == -1) {
		out.println("입력한 닉네임은 사용이 가능합니다.");
	}
%>