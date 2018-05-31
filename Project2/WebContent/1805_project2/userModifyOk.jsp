<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//String saveDir = request.getRealPath("upload");
	//int maxSize = 1024*1024*5;
	//이미지 업로드용 변수들 
	//절대경로상에 이미지파일 생성됨, 이클립스 경로상에 가상 참조 & 뿌려줌
	//MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());

	String userId = session.getAttribute("userId").toString();
	String userPw = request.getParameter("pw");
	String userNic = request.getParameter("nic");
	String userEmail = request.getParameter("email");
	String userBio = request.getParameter("intro");
	String userImg = request.getParameter("upload");
	String fullname = "";
		
	
	if(userImg == ""){
		fullname = session.getAttribute("userImg").toString();
	}else{
		userImg = request.getParameter("upload");
		fullname = "../upload/" + userImg;
	}
	
		
	UserDAO udao = new UserDAO();
	
	UserVO uvo = udao.getDataById(userId);
	
	uvo.setUserPw(userPw);
	uvo.setUserNicName(userNic);
	uvo.setUserEmail(userEmail);
	uvo.setUserImg(fullname);
	uvo.setUserBio(userBio);
	
	udao.userUpdate(uvo);
	
	
	response.sendRedirect("myPage.jsp?id="+userId);

%>
