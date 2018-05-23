<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<script type="text/javascript">
	function pageMoveLog() {
		location.href = 'login.jsp';
	}
	
	function pageMoveReg() {
		location.href = 'register.jsp';
	}
</script>
</head>
<body>
	<input type="button" value="로그인" id="login" name="login" onclick="pageMoveLog()"/><br>
	<input type="button" value="회원가입" id="reg" name="reg" onclick="pageMoveReg()"/><br>
</body>
</html>