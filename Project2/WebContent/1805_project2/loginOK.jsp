<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="bean.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginOK</title>
<%
	//전 화면의 입력정보 받아오기
	String u_id = request.getParameter("userId");
	String u_pw = request.getParameter("userPw");
	
	//사용변수 선언
	UserDAO u_dao = new UserDAO();
	UserVO u_vo = u_dao.selectedUserData(u_id, u_pw);
	
	if(u_dao.isExistById(u_id) == 1) {
		String u_name = u_vo.getUserName();
		String u_nicname = u_vo.getUserNicName();
		int u_follower = u_vo.getUserFollower();
		int u_following = u_vo.getUserFollowing();
		
		//세션에 회원정보 저장
		session.setAttribute("userId", u_id);
		session.setAttribute("userName", u_name);
		session.setAttribute("userNicName", u_nicname);
		session.setAttribute("userFollower", u_follower);
		session.setAttribute("userFollowing", u_following);
	} else {
		out.println("ID not exist");
	}
	

%>
<script type="text/javascript">
	/* window.onload = chkExist;
		
	function chkExist() {
		if(id == u_vo.getUserId() && pw == u_vo.getUserPw()) {
			alert("성공");
		} else {
			alert("실패");
			location href = "login.jsp";
		}
	} */
	
</script>
</head>
<body>
	<%
		int ext = u_dao.isExistById(u_id);
	
		if(ext == 1) {
			if(u_id.equals(u_vo.getUserId()) && u_pw.equals(u_vo.getUserPw())) {
				//out.println(u_vo.getUserId() + "," + u_vo.getUserPw());
				//out.println("되냐?");
		
	%>
	<%-- <jsp:useBean id="vo" class="bean.UserBean" scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="vo" ></jsp:setProperty> --%>
	<%-- <jsp:setProperty property="userId" name="vo" param="userId"  ></jsp:setProperty>
	<jsp:setProperty property="userPw" name="vo" param="userPw"  ></jsp:setProperty> --%>
	
	<%-- <jsp:forward page="loginMain.jsp"></jsp:forward> --%>
	
	<jsp:forward page="boardPage.jsp"></jsp:forward>
	<%
			} 
		} else {
			out.println("Login Error");
		}
		
	%>
</body>
</html>