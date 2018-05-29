<%@page import="dao.EtcBoardDao"%>
<%@page import="vo.EtcboardVo"%>
<%@page import="dao.PrdBoardDao"%>
<%@page import="vo.PrdboardVo"%>
<%@page import="vo.ToonboardVo"%>
<%@page import="dao.ToonBoardDao"%>
<%@page import="dao.IllBoardDao"%>
<%@page import="vo.IllboardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<style type="text/css">

#detail_container{
	width: 1000px;
	height: auto;
	margin: 20px auto;


}

#detail_title{
	
	width: 800px;
	height: auto;
	margin: 40px auto 20px auto;

}

#detail_title span{
	display: block;
	
	width: 800px;
	text-align: center;
	font-size: 22px;
	font-weight: bold;
	
}

#postinfo{
	
	width: 800px;
	height: auto;
	margin: 20px auto 40px auto;

}

#info_wrap{
	display:block;
	text-align: center;
	margin: 20px auto;
	color:gray;

}


#img_area{
	
	width: 800px;
	height: auto;
	margin: 20px auto;

}

#img_area img{

	max-width: 800px;

}


#img_area span{
	display: block;
	text-align: center;
	margin:0 auto;


}

.gubun{

	margin: auto 5px;

}


#post_text{
	
	width: 600px;
	height: auto;
	margin: 40px auto 100px auto;

}
 
 

#post_text p{

	text-align: center;
}



#like_area {


	width: 800px;
	height: auto;
	margin: 40px auto 10px auto;

}


#like_box{
	width: 70px;
	margin: 0 auto;
	padding: 6px 10px 6px 7px;
	border: 2px solid gray;
	
	cursor: pointer;

}

#like_box:hover #heart{

	color: red;
}

#copyright {
	width: 800px;
	height: auto;
	margin: 10px auto 100px auto;

}

#copywrap{
	display: block;
	width: 800px;
	text-align: center;

}

#copywrap span{
	color: #ccc;
	font-size: 14px;

}



#tag_area{
	
	width: 800px;
	height: auto;
	margin: 40px auto;

}


#tag_area a{

	padding: 3px;
	margin: auto 2px;
	border-radius: 5px;
	background-color: #EAEAEA;
	text-decoration: none;
	color: gray;

}


#tag_area span{
	font-weight: bold;
	margin-right: 10px;

}


#writer_area{

	width: 800px;
	height: 100px;
	margin: 100px auto 40px auto;
	border: 1px solid #EAEAEA;

}


#w_pic{
	
	width: 70px;
	height: 70px;
	margin: 15px 30px 15px 60px;
	border-radius: 50%;
	background-color: gray;
	float:left;
	overflow: hidden;

}

#w_info{
	float:left;
	width: 450px;
	height: auto;
	margin: 25px 0;
	/* border: 1px solid gray; */
	overflow: hidden;


}

#w_pic img{
	width: 70px;
	height: 70px;
	
}

#w_info span{
	display: block;

}

#writer_name{
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 5px;

}

#writer_bio{

	font-size: 13px;
	color: gray;
}


#w_follow{
	float:left;
	padding: 10px;
	color: white;
	font-weight: bold;
	font-size: 14px;
	cursor:pointer;
	margin: 30px 58px 25px 28px;
	background: gray;
	border-radius: 3px;

}

/* #w_follow span{
	padding: 10px;
	color: white;
	text-align: center;

} */


#comment_write{

	width: 800px;
	height: 70px;
	margin: 40px auto;

}


#comment_txa{

	width: 640px;
	height: 55px;
	padding: 15px 15px 0 15px;
	float: left;
	outline: none;
	resize: none;
}

#comment_btn{
	width: 124px;
	height: 72px;
	float:left;
	background-color: #ccc;
	border: 1px solid gray;
	border-left:none;
	font-weight: bold;

}

</style>



</head>
 

<body>
<!-- nav bar part -->
<div id="container_nav">	
	<jsp:include page="nav.jsp"></jsp:include>
</div>

<%

	


	String n = request.getParameter("boardnum");
	
	String cate = request.getParameter("category");
	
	
	String title = "";
	String writer = "";
	String date = "";
	String img = "";
	String content = "";
	String cat= "";
	int hits =0;
	int like = 0;
	int boardnum= 0;
	String t = "";
	String tag[] = null;
	int tlength= 0;
	

	
	//null처리 
	if(cate != null && n != null) {
	
	//카테고리가 일러스트
	if(cate.equals("ill")){
		
		IllBoardDao dao = new IllBoardDao();
		IllboardVo vo = new IllboardVo();
		
	
		boardnum = Integer.parseInt(n);
		vo = dao.getData(boardnum);
		
		title = vo.getIboardtitle();
		writer = vo.getIboardwriter();
		date = vo.getIboarddate();
		img = vo.getIboardimg();
		content = vo.getIboardcontent();
		hits = vo.getIboardhits();
		like = vo.getIboardnomination();
		cat = "일러스트";
		
		t = vo.getIlltag();
		
		
		t = t.substring(1, t.length());

		tag= t.split("#");
		
		tlength = tag.length;
		
	}
	
	 //카테고리가 만화라면 
	else if (cate.equals("toon")){
		
		ToonBoardDao dao = new ToonBoardDao();
		ToonboardVo vo = new ToonboardVo();
		
		boardnum = Integer.parseInt(n);
		vo = dao.getData(boardnum);
		
		title = vo.getTboardtitle();
		writer = vo.getTboardwriter();
		date = vo.getTboarddate();
		img = vo.getTboardimg();
		content = vo.getTboardcontent();
		hits = vo.getTboardhits();
		like = vo.getTboardnomination();
		cat = "만화";
		
		t = vo.getToontag();
		
		
		t = t.substring(1, t.length());

		tag= t.split("#");
		
		tlength = tag.length;
		
	}
	//카테고리 패러디(2차창작)
	else if (cate.equals("prd")){
		
		PrdboardVo vo = new PrdboardVo();
		PrdBoardDao dao = new PrdBoardDao();
		
		boardnum = Integer.parseInt(n);
		vo = dao.getData(boardnum);
		
		title = vo.getPboardtitle();
		writer = vo.getPboardwriter();
		date = vo.getPboarddate();
		img = vo.getPboardimg();
		content = vo.getPboardcontent();
		hits = vo.getPboardhits();
		like = vo.getPboardnomination();
		cat = "2차창작";
		
		t = vo.getPrdtag();
		
		
		t = t.substring(1, t.length());

		tag= t.split("#");
		
		tlength = tag.length;
	}
	
	//카테고리 기타
	else if (cate.equals("etc")){
		
		EtcboardVo vo = new EtcboardVo();
		EtcBoardDao dao = new EtcBoardDao();
		
		boardnum = Integer.parseInt(n);
		vo = dao.getData(boardnum);
		
		title = vo.getEboardtitle();
		writer = vo.getEboardwriter();
		date = vo.getEboarddate();
		img = vo.getEboardimg();
		content = vo.getEboardcontent();
		like = vo.getEboardnomination();
		hits = vo.getEboardhits();
		cat = "기타";
		
		t = vo.getEtctag();
		
		
		t = t.substring(1, t.length());

		tag= t.split("#");
		
		tlength = tag.length;
	}
	
	}//외부 if end  
	else{
		
		response.sendRedirect("page_rank.jsp");
	}
	
	


%>

	
	<div id="detail_container">
		
		<div id="detail_title">
			<span><%=title %></span>
		</div>
		
		<div id="postinfo">
			<span id="info_wrap">
			<span><%=cat %></span>
			<span class="gubun">|</span>
			<span><%=date.substring(0,16) %></span>
			<span class="gubun">|</span>
			<span>조회수</span>
			<span><%=hits %></span>
			
			</span>
		</div>
		
		<div id="img_area">
			<span><img src="<%=img %>" alt="이미지" /></span>
		
		</div>
		
		
		<div id="post_text">
		
			<p>
			<%
				if(content != null){
					out.print(content);
				}else {}
			
			
			%>
			</p>
		</div>
		
		 <div id="like_area">
			
			<a href="likeOk.jsp?bn=<%=boardnum %>&cat=<%=cate%>">
			<div id="like_box">
				<span id="heart">♥</span>
				<span>좋아요</span>
				<span id="likecount"><%=like %></span>
			</div>
			</a>
		
		</div>
		
		<div id="copyright">
			<span id="copywrap">
			<span>Copyright ©</span>
			<span><%=writer %></span>
			<span>All Rights Reserved</span>
			</span>
		</div>
	
	
		<div id="tag_area">
			<span>Tag</span>
			<%
				for(int i = 0; i<tlength; i++){
			
			%>
			<a href="">#<%=tag[i] %></a>
			<%
			
				}
			%>
			
		</div>
		
		
		<div id="writer_area">
			<div id="w_pic"><img src="../images/dog2.jpg" alt="" /></div>
			<div id="w_info">
				<span id="writer_name"><%=writer %></span>
				<span id="writer_bio">자기소개 어쩌고 저쩌고 어쩌고 저쩌고</span>
			</div>
			<div id="w_follow">
			  팔로우하기
			
			</div>
		</div>
		
	
	
		<div id="comment_write">
			<form action="" id="comment_frm">
				<textarea id="comment_txa" name="" id="" cols="30" rows="10"
				placeholder="댓글은 1000자 이내로 입력해 주세요."
				></textarea>
				<button id="comment_btn">댓글 쓰기</button>
			</form>
			
		</div>
	
	</div>


</body>
<script type="text/javascript">
	function likeclick() {
		location.href = 'likeOk.jsp?bn'+<%=boardnum%>;
	}
</script>
</html>
