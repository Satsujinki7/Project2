<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인된 화면</title>

</head>
<body>
	<form action="boardWrite.jsp">
		<jsp:useBean id="vo" class="bean.UserBean" scope="session"></jsp:useBean>
		<%-- <h1>ID : <jsp:getProperty property="userId" name="vo"/></h1>
		<h1>PW : <jsp:getProperty property="userPw" name="vo"/></h1> --%>
		<h1><%= session.getAttribute("userName") %> 님, 환영합니다.</h1>
		<h2>ID : <%= session.getAttribute("userId") %> </h2>
		<h2>NICNAME : <%= session.getAttribute("userNicName") %> </h2>
		<h2>FOLLOWER : <%= session.getAttribute("userFollower") %> </h2>
		<h2>FOLLOWING : <%= session.getAttribute("userFollowing") %> </h2>
		<hr>
		<input type="submit" value="글쓰기" />
	</form>
	
	<%-- <%
		out.println(session.getAttribute("userId"));
		out.println(session.getAttribute("userName"));
	%> --%>
</body>
</html>