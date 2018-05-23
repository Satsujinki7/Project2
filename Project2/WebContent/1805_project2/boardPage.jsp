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
		}
		th {
			padding: 3px;
			color: white;
			text-shadow: 2px 2px 2px black;
			background: -webkit-gradient(linear, 78% 20%, 10% 20%, from(#6699ff), to(#00ffff));
		}
		.col, .col4, .col5 {
			width: 10%;
			text-align: center;
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
</head>
<body>
	<h2><%= session.getAttribute("userName") %> 님, 환영합니다.</h2>
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
					<a href="detailContents.jsp?boardnum=<%= vo.getBoardNum() %>">
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
				<td colspan="4" id="page">
				<%
					for(int i=currentPage-4; i<currentPage+4; i++) {
						if(i<=0) {
							continue;
						} else if(i>p_totalNum) {
							break;
						} else {
							
				%>
					<a href="boardPage.jsp?cp=<%= i %>">[<%=i%>]</a>
				<%
						}
					}
				%>
				</td>
				<td colspan="4">
					<!-- 등록 누르면 게시글쓰기(DB 입력)로 이동 -->
					<a href="boardWrite.jsp">
						<input type="button" value="글쓰기" />
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
</body>
</html>