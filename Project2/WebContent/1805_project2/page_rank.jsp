<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이거 랭킹탭 페이지!!!!! -->
<!-- 기본적으로 이페이지는 == 랭킹 탭의 페이지 입니다아아ㅏㅏㅏㅏㅏㅏㅏ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%
		BoardDAO dao = new BoardDAO(); 
	
		String cp = request.getParameter("cp");
		int currentPage = 0;
		
		if(cp!=null) {
    		currentPage = Integer.parseInt(cp);
    	} else {
    		currentPage = 1;
    	}
    
    	int total = dao.getCount(); //DB 레코드 갯수 받아오기
    	
    	int p_recordCnt = 10; //한 페이지에 보일 게시글 수
    	//1  2  3  4...
    	//11 21 31 41...
    	//현재 페이지 시작번호
    	int p_startNum = (currentPage-1) * p_recordCnt +1;
    	//현재 페이지 끝번호
    	int p_endNum = currentPage * p_recordCnt;
    	//총 페이지 수
    	int p_totalNum = (total%p_recordCnt==0)?
    			total/p_recordCnt:total/p_recordCnt+1;
	%>
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
	        <div id="new_rank" class="body_div"><a href="illwrite.jsp">테스트 페이지</a></div>
	        <div id="board_new" class="body_div">
	       		<h3 align="center">자유게시판</h3>
	       		<hr />
		        <%
					ArrayList<BoardVO> list = dao.getAllData(p_startNum, p_endNum);
				
					
					for(BoardVO vo : list) {
				%>
				<h4 align="center" style="color: red">제목 : 
				<a href="detailContents.jsp?boardnum=<%= vo.getBoardNum() %>" id="de_con">
					<%= vo.getBoardTitle() %>
				</a>
				</h4>
				<%
					}
				%>
				
	        </div>
		</div>
		
	</div>
	
	</div>
	<div id="footercon">
		<jsp:include page="footer.jsp"></jsp:include> 
	</div>

</body>

</html>
