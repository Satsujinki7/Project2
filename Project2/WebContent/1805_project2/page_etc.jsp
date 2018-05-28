<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.EtcBoardDao"%>
<%@page import="vo.EtcboardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
//------기타 페이지

EtcBoardDao dao = new EtcBoardDao();

%>
<meta charset="UTF-8">
<link rel="stylesheet" href="pageCss.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">


#post_wrap{
	width: 1100px;
	height: 1600px;
	margin: 0 auto;

}

.post{
	display: inline;
	width: 300px;
	height: auto;
	
	border: 1px solid #E1E1E1;
	float: left;
	
	margin: 20px 20px;
	

}

.img_area{

width: 300px;
height: 300px;
background-color: #E1E1E1;
}


.post_img {

}


.info_area{

width: 270px;
height: 70px;
padding: 15px;
background-color: white;
border-top: 1px solid #E1E1E1;
border-bottom: 1px solid #E1E1E1;
}


.info_box{

width: 100%;
height: 100%;

background-color: white;
}

.post_title{
	margin-top: 5px;
	font-size: 17px;
	font-weight: bold;
	text-decoration: none;
	color: black;
	display: block;
	
}


.post_writer{

	display: block;
	margin-top:10px;	
		
}



.post_writer img{
	margin-right: 10px;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	float: left;
}

.post_writer span{
	
	display: block;
	padding-top: 4px;
}

a {
	text-decoration: none;
	color: black;
}


.btn_area{
	margin:15px;

}

.post_like{

margin-right: 10px;
}
#writebtn{
	width:  100px;
	height: 60px;
	background-color: black;
	color: white;
	text-decoration: none;
}

</style>

<title>기타 페이지</title>
</head>
<body>
<!-- nav bar part -->
<div id="container_nav">	
	<jsp:include page="nav.jsp"></jsp:include>
</div>
<a href="illwrite.jsp" id="writebtn">글쓰기</a>
<div id="post_wrap">

<%
	int i=1;
	ArrayList<EtcboardVo> list = dao.alldataEtcBoard();
	
	UserDAO userdao = new UserDAO();
	UserVO uservo = new UserVO();
	String imgpath = "";
	
	
	for(EtcboardVo tbv : list){
		
		uservo = userdao.getData(tbv.getEboardwriter());
		
		//프로필 사진 등록 안했으면 디폴트 이미지 준다 
		if(uservo == null || uservo.getUserImg() == null){
			
			 imgpath = "../images/dog.jpg";
			
			
		}else{
			
			imgpath= uservo.getUserImg();
		}

%>

	<div class="post">
	
		<a href="detail.jsp?boardnum=<%=tbv.getEboardnum() %>&category=toon">
		<div class="img_area">
			<img src="<%=tbv.getEboardimg() %>" alt="이미지" id="img<%=i++%>"/>
		</div></a>
		
		<div class="info_area">
			<div class="info_box">
				<a href="detail.jsp?boardnum=<%=tbv.getEboardnum() %>&category=toon" class="post_title"><%=tbv.getEboardtitle() %></a>
				<a href="myPage.jsp?writer=<%=tbv.getEboardwriter() %> " class="post_writer">
					<img src="<%=imgpath %>" alt="프사" />
					<span><%=tbv.getEboardwriter() %></span>
				</a>
			</div>
		</div>
		<div class="btn_area">
		 <a href="#" class="post_like">
		 	<span>좋아요</span>
		 	<b><%=tbv.getEboardnomination() %></b>
		 	
		 </a>
		 <a href="#" class="comment">
		 	<span>댓글</span>
		 	<b>25</b>
		 </a>
		
		</div>
	</div>
<%
	}// for end
%>
</div>

	<!-- footer part -->
	<div id="footercon">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>


</body>
</html>