<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="vo.IllboardVo"%>
<%@page import="dao.IllBoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//-------일러스트 리스트


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>frame.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style type="text/css">


#post_wrap{
	width: 1100px;
	height: 1100px;
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

</head>
<body>

<a href="illwrite.jsp" id="writebtn">글쓰기</a>

<%
	IllBoardDao dao = new IllBoardDao();
	ArrayList<IllboardVo> list =  dao.alldataIllBoard();

	int j = 1;
	
	UserDAO userdao = new UserDAO();
	UserVO uservo = new UserVO();
	String imgpath = "";
	
	
	for(IllboardVo vo : list){
		
		uservo = userdao.getData(vo.getIboardwriter());
		
		//프로필 사진 등록 안했으면 디폴트 이미지 준다 
		if(uservo == null || uservo.getUserImg() == null){
			
			 imgpath = "../images/dog.jpg";
			
			
		}else{
			
			imgpath= uservo.getUserImg();
		}

%>


<div id="post_wrap">
<div class="post">

	<a href="detail.jsp?boardnum=<%=vo.getIboardnum() %>&category=ill">
	<div class="img_area">
		<img src="<%=vo.getIboardimg() %>" alt="이미지" id="img<%=j++%>" class="post_img"/>
	</div>
	</a>
	
	<div class="info_area">
		<div class="info_box">
			<a href="detail.jsp?boardnum=<%=vo.getIboardnum() %>&category=ill" class="post_title"><%=vo.getIboardtitle() %></a>
			<a href="myPage.jsp?writer=<%=vo.getIboardwriter() %> " class="post_writer">
				<img src="<%=imgpath %>" alt="프사" />
				<span><%=vo.getIboardwriter() %></span>
			</a>
		</div>
	</div>
	<div class="btn_area">
	 <a href="#" class="post_like">
	 	<span>좋아요</span>
	 	<b>10</b>
	 	
	 </a>
	 <a href="#" class="comment">
	 	<span>댓글</span>
	 	<b>25</b>
	 </a>
	
	
	</div>
</div>





<%

	}
%>




</div>


</body>
</html>
<script type="text/javascript">
$(function(){
	for(var i=1 ; i < 10 ; i++){
			
		var imgwidth = $("#img"+i).width();
		var imgheight = $("#img"+i).height();

		
		if(imgwidth > imgheight){
			$("#img"+i).css("width","300px");
			imgheight = $("#img"+i).height();
			var margin = (300-imgheight)/2;
			$("#img"+i).css({
					"margin-top": margin,
					"margin-bottom": margin
			});
		}//if end
		else{
			$("#img"+i).css("height","300px");
			imgwidth = $("#img"+i).width();
			var margin = (300-imgwidth)/2;
			$("#img"+i).css({
				"margin-left": margin,
				"margin-right": margin	
			});
		}//else end
	}//for end
	
});





</script>


