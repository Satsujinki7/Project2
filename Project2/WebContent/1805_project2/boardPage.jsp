<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
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
	<style>
		table {
			width: 1000px;
			margin: 0 auto;
		}
		
		table, tr, th, td {
			border: 1px solid black;
			border-collapse: collapse;
			text-align: center;
			padding: 20px;
		}
		th {
			padding: 3px;
			color: white;
			text-shadow: 2px 2px 2px black;
			/* background: -webkit-gradient(linear, 78% 20%, 10% 20%, from(#6699ff), to(#00ffff)); */
			background: cyan;
		}
		.col, .col4, .col5 {
			width: 10%;
			text-align: center;
			padding: 20px;
		}
		.col2 {
			width: 50%;
		}
		.col3 {
			width: 20%;
		}
		
		.red {
			color: red;
			font-size: 20px;
		}
		
		#search_div {
			text-align: center;
		}
		
		#send_main {
			text-align: center;
		}
		
		
		#pageCon{
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
		#de_con:hover{
			color: red;
			font-weight: bold;
		}
	</style>
	
<!-- 	<script type="text/javascript">
		function changeBoard() {
			console.log("들어오냐?");
			
			if(boardSelect.value == "자유") {
				location.href = 'boardPage.jsp?boardcategory=자유';
			} else if(boardSelect.value == "일러스트") {
				location.href = 'boardPage.jsp?boardcategory=2';
			} else if(boardSelect.value == "2차창작") {
				location.href = 'boardPage.jsp?boardcategory=3';
			} else if(boardSelect.value == "게임") {
				location.href = 'boardPage.jsp?boardcategory=4';
			}
		}
	</script> -->
	
	<script type="text/javascript">
		window.onload = function() {
			var userId = "<%= session.getAttribute("userName") %>";
			
			if(userId == "" || userId == null) {
				document.getElementById("btn_write").style.display = "none";
			}
		}
		
		function sendMain() {
			location.href = 'page_rank.jsp';
		}
	
		function search() {
			if(s_text.value == "") {
				alert("검색어를 입력하세요.");
			} else {
				
			}
		}
	</script>
</head>
<body>
<div id="container_nav">	
	<jsp:include page="nav.jsp"></jsp:include>
</div>
	<h2 align="center"><%= session.getAttribute("userName") %> 님, 환영합니다.</h2>
<!-- 	<select name="boardSelect" id="boardSelect" onchange="changeBoard()">
		<option value="-----">-----</option>
		<option value="자유">자유 게시판</option>
		<option value="일러스트">일러스트 게시판</option>
		<option value="2차창작">2차 창작 게시판</option>
		<option value="게임">게임 게시판</option>
	</select> -->
	
	<div id="wrap">
		<table>
			<tr>
				<th class="col1">게시글번호</th>
				<th class="col2">제목</th>
				<th class="col3">작성자</th>
				<th class="col4">조회수</th>
				<th class="col5">추천수</th>
			</tr>
			
			<%
				ArrayList<BoardVO> list = dao.getAllData(p_startNum, p_endNum);
			
				
				for(BoardVO vo : list) {
			%>
			
			<tr>
				<td class="col"><%= vo.getBoardNum() %></td>
				<td class="col">
					<a href="detailContents.jsp?boardnum=<%= vo.getBoardNum() %>" id="de_con">
						<%= vo.getBoardTitle() %>
					</a>
				</td>
				<td class="col"><%= vo.getBoardWriter() %></td>
				<td class="col"><%= vo.getBoardHits() %></td>
				<td class="col"><%= vo.getBoardNomination() %></td>
			</tr>
			<%
				}
			%>
			
			<!-- 페이징 목록 -->
			<tr>
				<%-- <td colspan="4" id="page">
				<%
					for(int i=currentPage-4; i<currentPage+4; i++) {
						if(i<=0) {
							continue;
						} else if(i>p_totalNum) {
							break;
						} else {
							
				%>
					<a href="boardPage.jsp?cp=<%= i %>"><div id="pageNum">[<%=i%>]</div></a>
				<%
						}
					}

				%>
				</td> --%>
				<td colspan="5">
					<!-- 등록 누르면 게시글쓰기(DB 입력)로 이동 -->
					<a href="boardWrite.jsp">
						<input type="button" id="btn_write" value="글쓰기" />
					</a>
				</td>
			</tr>
			
			<%-- <tr>
				<td colspan="4">
					<!-- 등록 누르면 게시글쓰기(DB 입력)로 이동 -->
					<a href="boardWrite.jsp">
						<input type="button" value="글쓰기" />
					</a>
				</td>
			</tr> --%>
		</table>
	</div>
	
	<div id="pageCon">
	<%
		for(int i=currentPage-4; i<currentPage+4; i++) {
			if(i<=0) {
				continue;
			} else if(i>p_totalNum) {
				break;
			} else {
				
	%>
		<a href="boardPage.jsp?cp=<%= i %>"><div id="pageNum">[<%=i%>]</div></a>
	<%
			}
		}

	%>
	</div>
	
	<!-- 검색 기능 -->
	<div id="search_div">
		<br>
		<!-- 이거 클래스 보면 알겠지만 파일 업로드처럼 규격화된 기능임
			사용법 정확히 지킬 것 -->
		<form id="search_frm" action="boardSearch.jsp" class="article-search-form" method="get">
			<select name="s_option" id="s_option">
				<option value="boardtitle" selected="selected">제목</option>
				<option value="boardcontents">내용</option>
				<option value="boardwriter">작성자</option>
			</select>
			<input type="text" name="s_text" id="s_text" />
			<input type="submit" value="검색" />
		</form>
	</div>
	
	<div id="send_main">
		<br>
		<input type="button" value="메인으로" onclick="sendMain()"/>
		<br>
	</div>
	
	<div id="footercon">
		 <jsp:include page="footer.jsp"></jsp:include> 
	</div>
</body>
</html>