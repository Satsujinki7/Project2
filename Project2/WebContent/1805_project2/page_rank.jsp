<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이거 랭킹탭 페이지!!!!! -->
<!-- 기본적으로 이페이지는 == 랭킹 탭의 페이지 입니다아아ㅏㅏㅏㅏㅏㅏㅏ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랭킹 페이지</title>
<link rel="stylesheet" href="pageCss.css" />
<link rel="stylesheet" href="page_rank.css" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/jax/libs/jquery/3.3.1/jquery.min.js"></script>

 </head>
<body>
	<div id="container">	
		<div id="header">
			<jsp:include page="nav.jsp"></jsp:include>
		</div>
		<div id="content_rank"> 
			<div id="container_body">
	        <div id="right_rank" class="body_div"><jsp:include page="today_ranking.jsp"></jsp:include></div>
	        <div id="left_rank" class="body_div"><jsp:include page="cat_ranking.jsp"></jsp:include></div>
	        <div id="tag_rank" class="body_div"><jsp:include page="tag_ranking.jsp"></jsp:include></div>
	        <div id="new_rank" class="body_div"><a href="illwrite.jsp">글쓰러가아아아기!!!!!!</a></div>
	        <div id="board_new" class="body_div"></div>
		</div>
		
	</div>
	
	</div>
	<div id="footercon">
		<jsp:include page="footer.jsp"></jsp:include> 
	</div>

</body>

</html>
