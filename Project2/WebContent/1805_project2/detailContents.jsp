<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
	<%
		session.getAttribute("userName");
		
		String bn = request.getParameter("boardnum");
		int bnum = 0;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
	
		if(bn!=null) {
			bnum = Integer.parseInt(bn);
			
			//먼저 조회수부터 증가시키고
			dao.incrementHits(bnum);
			
			//vo에 내용을 담아야 밑에서 출력해주지!
			vo = dao.boardnumData(bnum);
		} else {
			response.sendRedirect("boardPage.jsp");
		}
	%>
	<style>
		table {
			width: 800px;
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
		#context {
			background-color: #6699ff;
		}
		
		#uname, #cname {
			display: none;
		}
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<%-- <script type="text/javascript">
		$(document).ready(function(){
			$("btn_del").on('click', function(){
				var flag = confirm("게시글을 삭제하겠습니까?");
				
				if(flag) {
					location.href = "deleteOK.jsp?boardnum=<%= vo.getBoardNum() %>";
				}
			});
		});
	</script> --%>
	
	<script type="text/javascript">
		/* function chkID() {
			var currentID = session.getAttribute("userName");
			
			if(currentID == vo.getBoardWriter()) {
				alert("게시글을 수정합니다.");
				location.href = 'boardModify.jsp';
			} else {
				alert("수정 권한이 없습니다.");
			}
		} */
		
		function pageBack() {
			location.href = 'boardPage.jsp';
		}
		function boardModify() {
			location.href = 'boardModify.jsp?boardnum=' + <%= vo.getBoardNum() %>;
		}
		function boardDelete() {
			location.href = 'boardDelete.jsp?boardnum=' + <%= vo.getBoardNum() %>;
		}
		function nominate() {
			alert("추천되었습니다.");
			location.href = 'nominateOK.jsp?boardnum=' + <%= vo.getBoardNum() %>;
		}
		
		//글쓴이와 현재 유저가 동일한지 판단
		//동일하다면 자기 글 추천 비활성화
		//동일하지 않다면 수정 및 삭제 버튼 비활성화
		window.onload = function() {
			if(uname.value == cname.value) {
				document.getElementById("btn_nom").style.display = "none";
			} else {
				document.getElementById("btn_mod").style.display = "none";
				document.getElementById("btn_del").style.display = "none";
			}
		}

	</script>
</head>
<body>
	<%-- <jsp:useBean id="vo" class="bean.UserBean" scope="session"></jsp:useBean> --%>
	<h2><%= session.getAttribute("userName") %> 님, 환영합니다. </h2>
	
	<table>
		<tr id="top">
			<th id="t1">작성자</th>
			<td><%= vo.getBoardWriter() %></td>
			<th id="t2">조회수</th>
			<td><%= vo.getBoardHits() %></td>
			<th id="t3">추천수</th>
			<td><%= vo.getBoardNomination() %></td>
		</tr>
		<tr>
			<th id="t4">작성일</th>
			<td colspan="5"><%= vo.getBoardDate() %></td>
		</tr>
		<tr id="title">
			<th>제목</th>
			<td colspan="5">
				<%= vo.getBoardTitle() %>
			</td>
		</tr>
		<tr id="image">
			<th>이미지</th>
			<td colspan="5">
				<img src="<%= vo.getBoardImage() %>" alt="" />
			</td>
		</tr>
		<tr id="contents">
			<th>내용</th>
			<td colspan="5">
				<textarea name="context" id="context" cols="30" rows="10" disabled="disabled">
					<%= vo.getBoardContents() %>
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<%-- <a href="boardPage.jsp">
					<input type="button" value="목록" />
				</a>
				<a href="boardModify.jsp?boardnum=<%= vo.getBoardNum() %>">
					<input type="button" id="btn_mod" name="btn_mod" value="수정" />
				</a>
				
				<a href="boardDelete.jsp?boardnum=<%= vo.getBoardNum() %>" id="btn_del">
					<input type="button" value="삭제" />
				</a>
				<a href="nominateOK.jsp?boardnum=<%= vo.getBoardNum() %>">
					<input type="button" value="추천" onclick="nominate()"/>
				</a> --%>
				
				<%-- <form action="boardPage.jsp">
					<input type="button" value="목록" onclick="pageBack()"/>
				</form>
				<form action="boardModify.jsp?boardnum=<%= vo.getBoardNum() %>">
					<input type="button" id="btn_mod" name="btn_mod" value="수정" onclick="boardModify()"/>
				</form>
				<form action="boardDelete.jsp?boardnum=<%= vo.getBoardNum() %>">
					<input type="button" value="삭제" onclick="boardDelete()" />
				</form>
				<form action="nominateOK.jsp?boardnum=<%= vo.getBoardNum() %>">
					<input type="button" value="추천" onclick="nominate()"/>
				</form> --%>
				
				<input type="button" value="목록" onclick="pageBack()"/>
				<input type="button" id="btn_mod" name="btn_mod" value="수정" onclick="boardModify()"/>
				<input type="button" id="btn_del" name="btn_del" value="삭제" onclick="boardDelete()" />
				<input type="button" id="btn_nom" name="btn_nom" value="추천" onclick="nominate()"/>
			</td>
		</tr>
	</table>
	
	<div id="test">
		<textarea name="cname" id="cname" cols="10" rows="10">
			<%= session.getAttribute("userName") %>
		</textarea>
		<textarea name="uname" id="uname" cols="10" rows="10">
			<%= vo.getBoardWriter() %>
		</textarea>
	</div>
</body>
</html>