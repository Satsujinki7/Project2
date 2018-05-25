<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="nav">

<div id="navwrap">
	<div id="logo">
	<a href="layout.jsp"><img src="../images/logo2.png" alt="메인로고" /></a>
	</div>
	<div id="menu">
		<ul id="mainul">
			<li class="mainmenu"><a href="#" class="maina">타임라인</a></li>
			<li class="mainmenu"><a href="#" class="maina">랭킹</a></li>
			<li class="mainmenu"><a href="#" class="maina">카테고리</a></li>
			<li class="mainmenu" id="etc"><a href="#" class="maina">···</a>
				<ul id="downul" >
					<li class="downmenu"><a href="#">숨김1</a></li>
					<li class="downmenu"><a href="#">숨김2</a></li>
					<li class="downmenu"><a href="#">숨김3</a></li>
					<li class="downmenu"><a href="#">숨김4</a></li>
					<li ><a href="#">숨김5</a></li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div id="navright">
	<%
	Object user = session.getAttribute("userName");
	if(user != null){
		//로그인된 상태라면
	%>
		<input type="button" value="<%=user %>" />
		<input type="button" value="로그아웃" onclick="logout()" style="color: skyblue"/>
	<%
	}else{
	//로그인 된 상태 아니라면
	%>
		<input type="button" value="로그인" onclick="pageMoveLog()"/>
		<input type="button" value="회원가입" onclick="pageMoveReg()" />
	<%
	}//else end
	%>
	</div>
	
	<div id="search">
		<input type="text" name="" id="searchtf" />
		<button type="submit"><i class="fa fa-search"></i></button>
	
	</div>
	
	
</div>
</div>

<script type="text/javascript">
	function pageMoveLog() {
		location.href = 'login.jsp';
	}
	
	function pageMoveReg() {
		location.href = 'register.jsp';
	}
	function logout() {

		location.href= 'logoutOk.jsp';
	}
</script>