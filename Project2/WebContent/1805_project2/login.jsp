<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
<!-- <script type="text/javascript">
	function logChk() {
		if(id.value == vo.getUserId() && pw.value == vo.getUserPw()) {
			loginForm.form.submit();
		} else if(id.value != vo.getUserId()) {
			alert("잘못된 ID");
			return false;
		} else if(pw.value != vo.getUserPw()) {
			alert("잘못된 PW");
			return false;
		}
	}
</script> -->
</head>
<body>
	<div id="loginForm">
		<form action="loginOK.jsp" method="POST">
			<h3>ID : </h3>
			<input type="text" name="userId" id="userId" /><br>
			<h3>PW : </h3>
			<input type="text" name="userPw" id="userPw" /><br>
			<input type="submit" value="OK" onclick="logChk()"/>
		</form>
	</div>
</body>
</html>