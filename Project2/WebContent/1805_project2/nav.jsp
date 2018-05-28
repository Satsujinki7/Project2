<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="nav.css" />

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

<div id="header">
<div id="nav">



	<div id="logo">
	<a href="page_rank.jsp"><img src="../images/logo2.png" alt="검색" /></a>
	</div>
	
	<div id="menu">
	
		<ul id="mainul">
			<li class="mainmenu"><a href="#" class="maina">타임라인</a></li>
			<li class="mainmenu"><a href="page_rank.jsp" class="maina">랭킹</a></li>
			<li class="mainmenu" id="cate" >
				<a href="#" class="maina category">카테고리</a>
 				<div id="catediv" class="category">
						<a href="page_ill.jsp" class="catemenu">일러스트</a>
						<a href="page_toon.jsp" class="catemenu">만화</a>
						<a href="page_prd.jsp" class="catemenu">창작</a>
						<a href="page_etc.jsp" class="catemenu">기타</a>
						<a href="boardPage.jsp" class="catemenu">자유게시판</a>
			
						
				</div> 
			</li>
			<li class="mainmenu" id="etc">
				<a href="#" class="maina">···</a>
					<div id="etcdiv" >
						<a href="#">기타1</a>
						<a href="#">기타2</a>
						<a href="#">기타3</a>
						<a href="#">기타4</a>
						<a href="#">기타5</a>
					
					</div> 
				
			</li>
		</ul>
	</div>
	
	
	
	
	<% 
		Object user = session.getAttribute("userName");
	
	%>
	
	<div id="navright">
		<%
	   if(user == null){
	%>
		<input type="button" value="로그인" onclick="pageMoveLog()"/>
		<input type="button" value="회원가입" onclick="pageMoveReg()" />
		
		<%
	   }else {
		   
		
		%>
		
		<a href="illwrite.jsp">업로드</a>
		<span><%=user %></span>
		
		<%
		
	   }
	
		%>		
	</div>
	
	<div id="search">
	 <form class="example" action="#">
		  <input type="text" placeholder="Search.." name="search">
		  <button type="submit"><i class="fa fa-search"></i></button>
		</form>
	 
	</div>
	
	
	
</div>
</div>



