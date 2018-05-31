<%@page import="vo.EtcboardVo"%>
<%@page import="vo.PrdboardVo"%>
<%@page import="vo.ToonboardVo"%>
<%@page import="vo.IllboardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TagDAO"%>
<%@page import="dao.IllBoardDao"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

<style type="text/css">


#post_wrap{
	width: 1100px;
	height: 1100px;
	margin: 30px auto;

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

h3 {
	position: absolute;
	top: 15%;
	left: 42%;
	

}

</style>



<meta charset="UTF-8">
<title>timeline</title>
</head>
<body>
<div id="container_nav">	
	<jsp:include page="nav.jsp"></jsp:include>
</div>
<!-- <a href="illwrite.jsp" id="writebtn">글쓰기</a> -->

<div id="post_wrap">

<%

	Object ur =session.getAttribute("userId");
	String myid ="";
	String imgpath = "";
	int i = 1;
	
	if(ur != null){
		myid =ur.toString();
	}
	
	UserDAO userdao = new UserDAO();
	UserVO uservo = new UserVO();
	
	ArrayList<ToonboardVo> flist = userdao.getAllFollow(myid);
	
	

	if(flist != null){
		
	for(ToonboardVo vo : flist ){
		uservo = userdao.getData(vo.getTboardwriter());
		
		//프로필 사진 등록 안했으면 디폴트 이미지 준다 
		if(uservo == null || uservo.getUserImg() == null){
			
			 imgpath = "../images/kobugi.jpg";
			
			
		}else{
			
			imgpath= uservo.getUserImg();
		}
%>


<div class="post">

		<a href="hitsUpOk.jsp?boardnum=<%=vo.getTboardnum() %>&category=ill">
		<div class="img_area">
			<img src="<%=vo.getTboardimg() %>" alt="이미지" id="img<%=i++%>"/>
		</div></a>
		
		<div class="info_area">
			<div class="info_box">
				<a href="detail.jsp?boardnum=<%=vo.getTboardnum() %>&category=ill" class="post_title"><%=vo.getTboardtitle() %></a>
				<a href="myPage.jsp?writer=<%=vo.getTboardwriter() %> " class="post_writer">
					<img src="<%=imgpath %>" alt="프사" />
					<span><%=vo.getTboardwriter() %></span>
				</a>
			</div>
		</div>
		
		<div class="btn_area" onclick="">
		 <a href="#" class="post_like">
		 	<span>좋아요</span>
		 	<b><%=vo.getTboardnomination() %></b>
		 	
		 </a>
		 <a href="#" class="comment">
		 	<span>댓글</span>
		 	<b>25</b>
		 </a>
		
		</div>
		
	</div>
	
	
<%
	}// for end
	
	}// if end



%>


	
</div>




<%-- <div id="pagingNum">
	<div id="pagecon">
	<%
	//페이징 처리부분
	for(int j = 1 ; j <= pageNum; j++){
	%>
		<a href="page_ill.jsp?cp=<%=j%>"><div id="pageNum"><%=j %></div></a>
	<%	
	}//for end
	%>
	</div>
</div> --%>

<div id="footercon">
		 <jsp:include page="footer.jsp"></jsp:include> 
	</div>
</body>
</html>
