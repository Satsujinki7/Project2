<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#contentsbar a").click(function(){
			$("#contentsbar").children().css("background-color","white");
			$(this).css("background-color","#B2EBF4");
			
		});
		
		
		
	});
	


</script>

<title>Insert title here</title>
<style type="text/css">

	#mycontainer{
	width: 958px;
	height : auto;
	margin : 0 auto;
	padding: 0;
	background-color: #dfdfdf;
	
	
	}

	#myinfo{
	 width:800px;
	 height: 300px;
	 background-color: ;
	 margin : 0 auto;
	
	}
	


	#mycontents{
	 width:749px;
	 height: 1000px;
	 background-color: white;
	 margin : 0 auto;
	 border: 1px solid #D5D5D5;
	
	 
	}
	
	
	#myinfo_img{
		display:block;
		width: 200px;
		height: 200px;
		background-color: ;
		margin: 50px 20px auto 20px;
		float: left;
	
		
	}
	
	
	#myinfo_text{
		display:block;
		width: 500px;
		height: 200px;
		background-color: ;
		margin: 50px 20px auto 40px;
		float: left;
	
		
	}
	
	#myinfo_img img{
	
		width: 150px;
		height: 150px;
		border-radius: 50%;
		border : 5px solid white;
		background-color: gray;
		margin : 25px;
		
	}
	#myinfo_text h2{
		margin-top: 40px;
	}
	
	#bio {
		display: block;
		margin-bottom: 25px;
	}
	
	
	#myinfo_text a{
		text-decoration: none;
		color: black;
		margin-right: 10px;
	
	}
	
	#myinfo_text a span{
		margin-left: 5px;
		font-weight: bold;
	
	}
	
	#p_modify{
		
		padding: 7px;
		margin-left: 370px;
		border: 1px solid black;
		font-size: 13px;
		font-weight: bold;
	}
	
	#follow{
		display: block;
		margin-bottom: 10px;
	}
	
	#contentsbar{
		width: 754px;
		height: 50px;
		
		
	}
	
	#contentsbar a{
		font-size: 15px;
		font-weight: bold;
		padding: 11px 168.2px ;
		background-color:white;
		float:left;
		text-align: center;
		text-decoration: none;
		color: black;
		border-bottom: 1px solid #D5D5D5;
		
	}
	
	#mypost,#like{
		border-right: 1px solid #D5D5D5;
	}
	
	
	
	/* -----------------반응형--------------------- */
	
	@media(max-width : 975px){

	
	
	#mycontainer{
	width: 80%;
	height : auto;
	margin : 0 auto;
	padding: 0;
	background-color: #dfdfdf;
	
	
	}

	#myinfo{
	 width:80%;
	 height: 200px;
	 margin : 0 auto;
	 background-color: yellow;
	 
	}
	


	#mycontents{
	 width:80%;
	 height: 1000px;
	 background-color: white;
	 margin : 0 auto;
	 border: 1px solid #D5D5D5;
	 
	 
	}
	
	
	#myinfo_img{
		display:block;
		width: 20%;
		height: 80%; 
		 margin: 0; 
		float: left;
		margin: 4% 10% 4% 5%;
		
	}
	
	
	#myinfo_text{
		display:block;
		width: 50%;
		height: 80%;
		background-color: ;
		 margin: 4% 5% 4% 10%; 
		float: left;
		
	}
	
	#myinfo_img {
	
		width: 150px;
		height: 150px;
		border-radius: 50%;
		background-color: gray;
		margin : 25px;
	}
	#myinfo_text h2{
		margin-top: 40px;
	}
	
	#bio {
		display: block;
		margin-bottom: 25px;
	}
	
	
	#myinfo_text a{
		text-decoration: none;
		color: black;
		margin-right: 10px;
	
	}
	
	#myinfo_text a span{
		margin-left: 5px;
		font-weight: bold;
	
	}
	
	#p_modify{
		
		padding: 7px;
		margin-left: 370px;
		border: 1px solid black;
		font-size: 13px;
		font-weight: bold;
	}
	
	#follow{
		display: block;
		margin-bottom: 10px;
	}
	
	#contentsbar{
		width: 754px;
		height: 50px;
		
		
	}
	
	#contentsbar a{
		font-size: 15px;
		font-weight: bold;
		padding: 11px 107px ;
		background-color:white;
		float:left;
		text-align: center;
		text-decoration: none;
		color: black;
		border-bottom: 1px solid #D5D5D5;
		
	}
	
	#mypost,#like{
		border-right: 1px solid #D5D5D5;
	}
	
	
	
	
	
	
	}
	
	
	
	
</style>



</head>
<body>

	<%
	Object ur =session.getAttribute("userName");
	String user = ur.toString();
	
	UserDAO dao = new UserDAO();
	UserVO vo = new UserVO();
	
	
	String writer = request.getParameter("id");
	vo = dao.getDataById(writer);
	
	String wri = vo.getUserName();
	
	String img = vo.getUserImg();
	if(img == null){
		img = "../images/kobugi.jpg";
	}
	String bio = vo.getUserBio();
	if(bio == null){
		bio ="";
	}
	%>
	<!-- nav bar part -->
	<div id="container_nav">	
	<jsp:include page="nav.jsp"></jsp:include>
	</div>
	
	
	<div id="mycontainer">
	
	<!-- -------------글쓴이 정보 부분-------------- -->
	<div id="myinfo">
	
	<!-- 프로필 이미지 -->
	<div id="myinfo_img">
		<img src="<%=img %>" alt="프사" />
	</div>
	<!-- 닉네임,팔로워등 텍스트 정보 -->
	<div id="myinfo_text">
		<h2><%=vo.getUserName() %></h2>
		<span id="bio"><%=bio %></span>
		<span id="follow">
		<a href="#" id="follower">팔로우<span>10</span></a>
		<a href="#" id="following">팔로워<span>20</span></a>
		</span>
	<%
	if(user.equals(wri)){
		//user이랑 해당 글의 writer 가 일치한다면
	%>
			<a href="userModify.jsp" id="p_modify">프로필수정</a>	
	<%
	}
	%>
		</div>
	</div>
		
	<%
	%>
		
	<!-- ----------내 컨텐츠 보기------------ -->
	<div id="mycontents">
		
	<!-- 컨텐츠바- 누를때마다 내용바뀜 -->
		<div id="contentsbar">
			<a href="#" id="mypost">작품</a>
			<a href="#" id="like">좋아요</a>
			<!-- <a href="#" id="gonggam">공감</a> -->
		</div>
			
		
		</div>
	</div>

</body>
</html>
