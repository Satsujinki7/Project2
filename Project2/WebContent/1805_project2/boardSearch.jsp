<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.OracleXE_ConnectionPJ2"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 검색 결과</title>
	<%
		BoardDAO dao = new BoardDAO();
	
		String cp = request.getParameter("cp");
		int currentPage = 0;
		
    	//검색 logic - 타입(제목 or 내용)과 검색어를 받아서 재출력
    	//검색어
		String query = request.getParameter("s_text");
		if(query == null) {
			query = "";
		}
		//타입
		String field = request.getParameter("s_option");
		
		if(cp!=null) {
    		currentPage = Integer.parseInt(cp);
    	} else {
    		currentPage = 1;
    	}
		
    	int s_recordCnt = 10; //한 페이지에 보일 게시글 수
    	//1  2  3  4...
    	//11 21 31 41...
    	//현재 페이지 시작번호
    	int s_startNum = (currentPage-1) * s_recordCnt +1;
    	//현재 페이지 끝번호
    	int s_endNum = currentPage * s_recordCnt;
    	//검색된 레코드 갯수 받아오기
		int searchTotal = dao.getSearchCount(field, query); 
    	//총 페이지 수
    	int s_totalNum = (searchTotal%s_recordCnt==0)?
    			searchTotal/s_recordCnt:searchTotal/s_recordCnt+1;

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
		
		#search_div {
			text-align: center;
		}
		
		#send_main {
			text-align: center;
		}
	</style>
	
	<script type="text/javascript">
		window.onload = function() {
			var userId = <%= session.getAttribute("userName") %>;
			
			if(userId == "" || userId == null) {
				document.getElementById("btn_write").style.display = "none";
			}
		}
		
		function sendMain() {
			location.href = 'layout.jsp';
		}
		
		function init() {
			location.href = 'boardPage.jsp';
		}
	
		function search() {
			if(s_text.value == "") {
				alert("검색어를 입력하세요.");
			} else {
				location.href = 'boardSearch.jsp?s_option=' + <%= field %> + '&s_text=' + <%= query %>;
			}
		}
	</script>
</head>
<body>
	<h2><%= session.getAttribute("userName") %> 님, 환영합니다.</h2>
	
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
				ArrayList<BoardVO> list = dao.searchData(s_startNum, s_endNum, field, query);
				
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
						} else if(i>s_totalNum) {
							break;
						} else {
							
				%>
					<a href="boardSearch.jsp?cp=<%= i %>&s_option=<%= field %>&s_text=<%= query %>">[<%= i %>]</a>
				<%
						}
					}
				%>
				</td>
				<td colspan="4">
					<!-- 등록 누르면 게시글쓰기(DB 입력)로 이동 -->
					<a href="boardWrite.jsp">
						<input type="button" id="btn_write" value="글쓰기" />
					</a>
				</td>
			</tr>
			
		</table>
	</div>
	
	<div id="search_div">
		<form action="boardSearch.jsp">
			<br>
			<select name="s_option" id="s_option">
				<option value="boardtitle" <% if(field.equals("boardtitle")) { %> selected="selected" <% } %>>제목</option>
				<option value="boardcontents" <% if(field.equals("boardcontents")) { %> selected="selected" <% } %>>내용</option>
				<option value="boardwriter" <% if(field.equals("boardwriter")) { %> selected="selected" <% } %>>작성자</option>
			</select>
			<input type="text" name="s_text" id="s_text" value="<%= query %>" />
			<input type="submit" value="검색" />
			<input type="button" value="초기화" onclick="init()"/>
		</form>
	</div>
	
	<div id="send_main">
		<br>
		<input type="button" value="메인으로" onclick="sendMain()"/>
	</div>
</body>
</html>