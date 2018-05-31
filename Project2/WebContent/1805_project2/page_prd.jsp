<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="vo.PrdboardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PrdBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 2차 창작 리스트 페이지!!!  -->
<%
	PrdBoardDao dao = new PrdBoardDao();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="pageCss.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">


#post_wrap{
	width: 1030px;
	height: 1500px;
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

/*--페이징 하는부분 CSS ---*/
#pagingNum{
	width : 100%;
	height: 50px;
}
#pagecon{
	width: 400px;
	height: 50px;
	margin: 0 auto;
}
#pageNum{
	background-color: skyblue;
	width : 30px;
	height: 30px;
	float: left;
	text-align: center;
	margin: 10px;
	color: white;
}
#pageNum:hover{
	background-color: black;
}

/*-----현재페이지 가르쳐주는 파트------*/
#whereis{
  margin: 0 auto;
  margin-bottom : 40px;
  width : 1030px;
  height: 30px;
  background-color: #638f0a;
}
h3{
  padding-left: 30px;
  color: white;
}

/*-----현재페이지 가르쳐주는 파트------*/
#whereis{
  margin: 0 auto;
  margin-bottom : 40px;
  width : 1030px;
  height: 30px;
  background-color: #638f0a;
}
h3{
  padding-left: 30px;
  color: white;
}
</style>

<title>2차 창작 페이지</title>
</head>
<body>
<!-- Scroll Top Button -->
		<jsp:include page="top.jsp"></jsp:include>
<!-- nav bar part -->
<div id="container_nav">	
	<jsp:include page="nav.jsp"></jsp:include>
</div>
<div id="whereis"><h3> >> 카테고리  > 2차창작</h3></div>
<div id="post_wrap">

<%
	int i=1;
	
	UserDAO userdao = new UserDAO();
	String imgpath = "";
	String userid = "";
	
	String cp = request.getParameter("cp");
	
	//페이징 처리
	int currnetPage =1;
	if(cp!=null){
		currnetPage = Integer.parseInt(cp);
	}else{
		currnetPage = 1;
	}
	int total = dao.countData();
	int recodNum = 9;
	//현재페이지 시작번호
	int startNum = (currnetPage -1) * recodNum +1;
	//현재 페이지 끝번호
	int endNum = currnetPage * recodNum;
	//총 페이지 수
	int pageNum = (total % recodNum ==0)?
			total/recodNum : total/recodNum +1;
	
	
	ArrayList<PrdboardVo> lsit = dao.alldataPrdBoard(startNum, endNum);
	
	for(PrdboardVo vo : lsit){
		UserVO uservo = userdao.getData(vo.getPboardwriter());
		userid = uservo.getUserId();
		
		//프로필 사진 등록 안했으면 디폴트 이미지 준다 
		if(uservo == null || uservo.getUserImg() == null){
			
			 imgpath = "../images/kobugi.jpg";
			
		}else{
			
			imgpath= uservo.getUserImg();
		}
%>
<div class="post">		
		<a href="hitsUpOk.jsp?boardnum=<%=vo.getPboardnum() %>&category=prd">
		<div class="img_area" >
			<img src="<%=vo.getPboardimg() %>" alt="이미지" id="img<%=i++%>"/>
		</div></a>
		
		<div class="info_area">
			<div class="info_box">
				<a href="hitsUpOk.jsp?boardnum=<%=vo.getPboardnum() %>&category=prd" class="post_title"><%=vo.getPboardtitle() %></a>
				<a href="myPage.jsp?id=<%=userid %> " class="post_writer">
					<img src="<%=imgpath %>" alt="프사" />
					<span><%=vo.getPboardwriter() %></span>
				</a>
			</div>
		</div>
		<div class="btn_area">
		 <a href="#" class="post_like">
		 	<span>좋아요</span>
		 	<b><%=vo.getPboardnomination() %></b>
		 	
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
<div id="pagingNum">
	<div id="pagecon">
	<%
	//페이징 처리부분
	for(int j = 1 ; j <= pageNum; j++){
	%>
		<a href="page_prd.jsp?cp=<%=j%>"><div id="pageNum"><%=j %></div></a>
	<%	
	}//for end
	%>
	</div>
</div>

<div id="footercon">
		 <jsp:include page="footer.jsp"></jsp:include> 
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
