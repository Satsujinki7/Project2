<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
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

function pageMoveWrite() {
	location.href = 'illwrite.jsp';
}


</script>

<div id="header">
<div id="nav">



	<div id="logo">
	<a href="page_rank.jsp"><img src="../images/logo.JPG" alt="검색" /></a>
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
		Object ur = session.getAttribute("userName");
	
		UserDAO dao = new UserDAO();
		UserVO  vo = new UserVO();
		
		
	
	%>
	
	<div id="navright">
	<%
	   if(ur == null){
	%>
		<input type="button" value="로그인" onclick="pageMoveLog()"/>
		<input type="button" value="회원가입" onclick="pageMoveReg()" />
		
		<%
	   }else {
		   
			String user = ur.toString();
			vo = dao.getData(user);
		%>
		
		<input type="button" value="업로드" onclick="pageMoveWrite()"/>
		<a href="myPage.jsp?id=<%=vo.getUserId()%>">
		<input type="button" value="<%=user %>"  /></a>
		<a href="logoutOk.jsp">로그아웃</a>
		
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



