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
<title>tagsearch</title>
</head>
<body>
<div id="container_nav">	
	<jsp:include page="nav.jsp"></jsp:include>
</div>
<!-- <a href="illwrite.jsp" id="writebtn">글쓰기</a> -->
<%
String searchtag = request.getParameter("searchtag");

%>


<h3>#<%=searchtag %> 검색결과</h3>

<div id="post_wrap">

<%

	
	
	
	TagDAO dao = new TagDAO();
	
	ArrayList<IllboardVo> itaglist = dao.illTagList(searchtag);
	ArrayList<ToonboardVo> ttaglist = dao.toonTagList(searchtag);
	ArrayList<PrdboardVo> ptaglist = dao.prdTagList(searchtag);
	ArrayList<EtcboardVo> etaglist = dao.etcTagList(searchtag);

	
	int i=1;
	
	UserDAO userdao = new UserDAO();
	UserVO uservo = new UserVO();
	String imgpath = "";
	String cp = request.getParameter("cp");
	
	/* //페이징 처리
	 int currnetPage =1;
	if(cp!=null){
		currnetPage = Integer.parseInt(cp);
	}else{
		currnetPage = 1;
	}
	int total = itaglist.countData();
	int recodNum = 9;
	//현재페이지 시작번호
	int startNum = (currnetPage -1) * recodNum +1;
	//현재 페이지 끝번호
	int endNum = currnetPage * recodNum;
	//총 페이지 수
	int pageNum = (total % recodNum ==0)?
			total/recodNum : total/recodNum +1;
 */
	
			
			
	/* String searchtag = request.getParameter("searchtag");
			
	
	TagDAO dao = new TagDAO();
	
	ArrayList<IllboardVo> itaglist = dao.illTagList(searchtag);
	ArrayList<ToonboardVo> ttaglist = dao.toonTagList(searchtag);
	ArrayList<PrdboardVo> ptaglist = dao.prdTagList(searchtag);
	ArrayList<EtcboardVo> etaglist = dao.etcTagList(searchtag); */
	
	/* list.add(dao.illTagList(searchtag));
	list.add(dao.toonTagList(searchtag));
	list.add(dao.prdTagList(searchtag));
	list.add(dao.etcTagList(searchtag)); */
	
/* 	IllboardVo ivo = (IllboardVo)list.get(0);
	ToonboardVo tvo = (ToonboardVo)list.get(1);
	PrdboardVo pvo = (PrdboardVo)list.get(2);
	EtcboardVo evo = (EtcboardVo)list.get(3);  */
	
	
	if(itaglist != null){
		
	for(IllboardVo ivo : itaglist ){
		uservo = userdao.getData(ivo.getIboardwriter());
		
		//프로필 사진 등록 안했으면 디폴트 이미지 준다 
		if(uservo == null || uservo.getUserImg() == null){
			
			 imgpath = "../images/kobugi.jpg";
			
			
		}else{
			
			imgpath= uservo.getUserImg();
		}
%>


<div class="post">

		<a href="hitsUpOk.jsp?boardnum=<%=ivo.getIboardnum() %>&category=ill">
		<div class="img_area">
			<img src="<%=ivo.getIboardimg() %>" alt="이미지" id="img<%=i++%>"/>
		</div></a>
		
		<div class="info_area">
			<div class="info_box">
				<a href="detail.jsp?boardnum=<%=ivo.getIboardnum() %>&category=ill" class="post_title"><%=ivo.getIboardtitle() %></a>
				<a href="myPage.jsp?writer=<%=ivo.getIboardwriter() %> " class="post_writer">
					<img src="<%=imgpath %>" alt="프사" />
					<span><%=ivo.getIboardwriter() %></span>
				</a>
			</div>
		</div>
		
		<div class="btn_area" onclick="">
		 <a href="#" class="post_like">
		 	<span>좋아요</span>
		 	<b><%=ivo.getIboardnomination() %></b>
		 	
		 </a>
		 <a href="#" class="comment">
		 	<span>댓글</span>
		 	<b>25</b>
		 </a>
		
		</div>
		
	</div>
	
	
<%
	}// for end
	
	}// 일러스트 if end

	
	
if(ttaglist != null){
		
	for(ToonboardVo tvo : ttaglist ){
		uservo = userdao.getData(tvo.getTboardwriter());
		
		//프로필 사진 등록 안했으면 디폴트 이미지 준다 
		if(uservo == null || uservo.getUserImg() == null){
			
			 imgpath = "../images/kobugi.jpg";
			
			
		}else{
			
			imgpath= uservo.getUserImg();
		}
%>



<div class="post">
		<a href="hitsUpOk.jsp?boardnum=<%=tvo.getTboardnum() %>&category=toon">
		<div class="img_area">
			<img src="<%=tvo.getTboardimg() %>" alt="이미지" id="img<%=i++%>"/>
		</div></a>
		
		<div class="info_area">
			<div class="info_box">
				<a href="detail.jsp?boardnum=<%=tvo.getTboardnum() %>&category=toon" class="post_title"><%=tvo.getTboardtitle() %></a>
				<a href="myPage.jsp?writer=<%=tvo.getTboardwriter() %> " class="post_writer">
					<img src="<%=imgpath %>" alt="프사" />
					<span><%=tvo.getTboardwriter() %></span>
				</a>
			</div>
		</div>
		<div class="btn_area" onclick="">
		 <a href="#" class="post_like">
		 	<span>좋아요</span>
		 	<b><%=tvo.getTboardnomination() %></b>
		 	
		 </a>
		 <a href="#" class="comment">
		 	<span>댓글</span>
		 	<b>25</b>
		 </a>
		
		</div>
	</div>
	
	
<%
	}// for end
	
	}// 만화 if end 


if(ptaglist != null){
	
	for(PrdboardVo pvo : ptaglist ){
		uservo = userdao.getData(pvo.getPboardwriter());
		
		//프로필 사진 등록 안했으면 디폴트 이미지 준다 
		if(uservo == null || uservo.getUserImg() == null){
			
			 imgpath = "../images/kobugi.jpg";
			
			
		}else{
			
			imgpath= uservo.getUserImg();
		}
%>



<div class="post">
		<a href="hitsUpOk.jsp?boardnum=<%=pvo.getPboardnum() %>&category=prd">
		<div class="img_area">
			<img src="<%=pvo.getPboardimg() %>" alt="이미지" id="img<%=i++%>"/>
		</div></a>
		
		<div class="info_area">
			<div class="info_box">
				<a href="detail.jsp?boardnum=<%=pvo.getPboardnum() %>&category=prd" class="post_title"><%=pvo.getPboardtitle() %></a>
				<a href="myPage.jsp?writer=<%=pvo.getPboardwriter() %> " class="post_writer">
					<img src="<%=imgpath %>" alt="프사" />
					<span><%=pvo.getPboardwriter() %></span>
				</a>
			</div>
		</div>
		<div class="btn_area" onclick="">
		 <a href="#" class="post_like">
		 	<span>좋아요</span>
		 	<b><%=pvo.getPboardnomination() %></b>
		 	
		 </a>
		 <a href="#" class="comment">
		 	<span>댓글</span>
		 	<b>25</b>
		 </a>
		
		</div>
	</div>
	
	
<%
	}// for end
	
	}// 2차창작 if end



if(etaglist != null){
	
	for(EtcboardVo evo : etaglist ){
		uservo = userdao.getData(evo.getEboardwriter());
		
		//프로필 사진 등록 안했으면 디폴트 이미지 준다 
		if(uservo == null || uservo.getUserImg() == null){
			
			 imgpath = "../images/kobugi.jpg";
			
			
		}else{
			
			imgpath= uservo.getUserImg();
		}
%>



<div class="post">
		<a href="hitsUpOk.jsp?boardnum=<%=evo.getEboardnum() %>&category=etc">
		<div class="img_area">
			<img src="<%=evo.getEboardimg() %>" alt="이미지" id="img<%=i++%>"/>
		</div></a>
		
		<div class="info_area">
			<div class="info_box">
				<a href="detail.jsp?boardnum=<%=evo.getEboardnum() %>&category=etc" class="post_title"><%=evo.getEboardtitle() %></a>
				<a href="myPage.jsp?writer=<%=evo.getEboardwriter() %> " class="post_writer">
					<img src="<%=imgpath %>" alt="프사" />
					<span><%=evo.getEboardwriter() %></span>
				</a>
			</div>
		</div>
		<div class="btn_area" onclick="">
		 <a href="#" class="post_like">
		 	<span>좋아요</span>
		 	<b><%=evo.getEboardnomination() %></b>
		 	
		 </a>
		 <a href="#" class="comment">
		 	<span>댓글</span>
		 	<b>25</b>
		 </a>
		
		</div>
	</div>
	
	
<%
	}// for end
	
	}// 2차창작 if end






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
