<%@page import="vo.PrdboardVo"%>
<%@page import="dao.PrdBoardDao"%>
<%@page import="vo.EtcboardVo"%>
<%@page import="dao.EtcBoardDao"%>
<%@page import="vo.ToonboardVo"%>
<%@page import="dao.ToonBoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.IllboardVo"%>
<%@page import="dao.IllBoardDao"%>
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
	margin : 0 auto;
	padding: 0;
	background-color: #dfdfdf;
	padding-bottom: 50px;
	
	
	}

	#myinfo{
	 width:800px;
	 height: 300px;
	 background-color: ;
	 margin : 0 auto;
	
	}
	


	#mycontents{
	 width:749px;
	 
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
	
	
	
	/*----post출력 부분 -----*/
	
	#postbox {
		margin : 20px auto;
		width : 580px;
		overflow: hidden;
	}
	#postimg{
		width:  580px;
		
	}
	#postimg img{
		width : 580px;
	}
	
	#posttitle{
		position: relative;
		top: -30px;
		height: 30px;
		color: white;
		padding-left: 30px;
		background-color: rgba(0,0,0,0.8);
	}
	
</style>



</head>
<body>

	<%
	Object ur =session.getAttribute("userName");
	String user ="";
	
	if(ur != null){
		user =ur.toString();
	}
	
	UserDAO dao = new UserDAO();
	UserVO vo = new UserVO();
	
	
	String writer = request.getParameter("id");
	if(writer == null){
		response.sendRedirect("hits404.jsp");
	}
	vo = dao.getDataById(writer);
	
	String wri = vo.getUserName();
	
	String img = vo.getUserImg();
	if(img == null){
		img = "../images/abokado.JPG";
		
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
			<!--
			<a href="#" id="like">좋아요</a>
			 <a href="#" id="gonggam">공감</a> -->
			 </div>
		<%
		String postWriter = vo.getUserName();
		
		IllBoardDao idao = new IllBoardDao();
		
		ArrayList<IllboardVo> ilist = idao.alldataIllBoardByName(postWriter);
		
		for(IllboardVo ivo : ilist){
		%>
		<div id="postbox" onclick="location.href='detail.jsp?boardnum=<%=ivo.getIboardnum()%>&category=ill'">
			<div id="postimg"><img src="<%=ivo.getIboardimg() %>" alt="" /></div>
			<div id="posttitle"><%=ivo.getIboardtitle() %></div>
		</div>
		
		<%}//for end 
		
		ToonBoardDao tdao = new ToonBoardDao();
		ArrayList<ToonboardVo> tlist = tdao.alldataToonBoardByNAME(postWriter);
				
		for(ToonboardVo tvo : tlist){
			
		%>
		<div id="postbox"  onclick="location.href='detail.jsp?boardnum=<%=tvo.getTboardnum()%>&category=toon'">
			<div id="postimg"><img src="<%=tvo.getTboardimg() %>" alt="" /></div>
			<div id="posttitle"><%=tvo.getTboardtitle() %></div>
		</div>
		<%
		}//toon for end
		
		EtcBoardDao edao = new EtcBoardDao();
		ArrayList<EtcboardVo> elist = edao.alldataEtcBoardByName(postWriter);
				
		for(EtcboardVo evo : elist){
		%>
		<div id="postbox"  onclick="location.href='detail.jsp?boardnum=<%=evo.getEboardnum()%>&category=etc'">
			<div id="postimg"><img src="<%=evo.getEboardimg() %>" alt="" /></div>
			<div id="posttitle"><%=evo.getEboardtitle() %></div>
		</div>
		<%
		}//etc for end
		
		PrdBoardDao pdao = new PrdBoardDao();
		ArrayList<PrdboardVo> plist = pdao.alldataPrdBoardByName(postWriter);
				
		for(PrdboardVo pvo  : plist){
		%>
		<div id="postbox"  onclick="location.href='detail.jsp?boardnum=<%=pvo.getPboardnum()%>&category=prd'">
			<div id="postimg"><img src="<%=pvo.getPboardimg() %>" alt="" /></div>
			<div id="posttitle"><%=pvo.getPboardtitle() %></div>
		</div>
		<%
		}
		%>	
		
		
		</div>
		
		<div id="footercon">	
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
	</div>

</body>
</html>
