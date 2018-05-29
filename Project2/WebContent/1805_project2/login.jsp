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
<style type="text/css">
	#wrapper{
		position: relative;
		width: 1600px;
		height: 820px;
	}
	
	#font_logo{
		color: #1fbc02;
		font-size: 30px;		
		width: 98px;
		margin: 0 auto;
		position: relative;
		top: 100px;		
	}
	
	#form{
		width: 460px;
		height: 275px;
		margin: 0 auto;
		position: relative;
	}
	
	#userId{		
		width:400px;
		height:40px;
		position: relative;		
		left: 25px;
		top: 120px;
	}
	
	#userPw{
		width: 400px;
		height: 40px;
		position: relative;
		left: 25px;
		top: 130px;
		
	}
	
	#login{
		width: 404px;
		height: 40px;
		position: relative;
		left: 25px;
		top: 140px;
		color: #fff;
		font-size: 15px;
		background-color: #1fbc02;
	}
	#regs{
		width: 260px;		
		height: 20px;
		position: relative;
		left: 90px;		
		top: 130px;
		font-size: 14px;
		color: gray;				
	}
	#reg{
	
		width: 400px;
		height: 40px;
		position: relative;
		font-weight: bold;
		font-size: 15px;
		color: red;		
	}
	
	
</style>
<script type="text/javascript">
	$(function(){
		$()
	});
</script>
</head>
<body>
	<div id="wrapper">

		
			<h2 id="font_logo">Creative</h2>
		
	<form action="loginOK.jsp" id="form" method="POST">
		
		<input type="text" name="userId" id="userId" placeholder="아이디" style="font-size: 15px;" />		
		<input type="text" name="userPw" id="userPw" placeholder="비밀번호" style="font-size: 15px;" />
		<input type="submit" value="로그인" id="login" onclick="logChk()" />
		<p id="regs">아이디가 없으신분은 <span id="reg"><a href="register.jsp">회원가입</a></span> 해주세요. </p>
	</form>
	
	</div>	
</body>
</html>