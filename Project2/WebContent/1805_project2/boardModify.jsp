<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
	<%
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
			width: 700px;
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
	</style>
	
	<!-- 스마트 에디터 사용하기 1
		json 방식으로 데이터 받음(name : value) -->
	<script type="text/javascript" src="../se/js/HuskyEZCreator.js"></script>
	<script type="text/javascript">
		var oEditors = [];
		
		window.onload = function(){
			nhn.husky.EZCreator.createInIFrame({
		
			    oAppRef: oEditors,
		
			    elPlaceHolder: "context",
		
			    sSkinURI: "../se/SmartEditor2Skin.html",
		
			    fCreator: "createSEditor2"
		
			});

		}
			//스마트 에디터 사용하기 2
			 // 에디터의 내용이 textarea에 적용된다.
		function modifyForm(obj) {
		 oEditors.getById["context"].exec("UPDATE_CONTENTS_FIELD", []);
		    // 에디터의 내용에 대한 값 검증은 이곳에서
		    // document.getElementById("ir1").value를 이용해서 처리한다.
		
		    try {
		
		        obj.form.submit();
		
		    } catch(e) {}
		}
	</script>
</head>
<body>
	<h2><%= session.getAttribute("userName") %></h2>
	<form action="boardModifyOK.jsp">
		<input type="hidden" name="boardNum" value="<%= vo.getBoardNum() %>" />
		<table>
			<tr id="top">
				<th id="t1">작성자</th>
				<td><%= vo.getBoardWriter() %></td>
				<th id="t2">조회수</th>
				<td><%= vo.getBoardHits() %></td>
				<th id="t3">작성일</th>
				<td><%= vo.getBoardDate() %></td>
			</tr>
			<tr id="title">
				<th>제목</th>
				<td colspan="5">
					<textarea name="boardTitle" id="boardTitle" value="<%= vo.getBoardTitle() %>" required></textarea>
				</td>
			</tr>
			<tr id="contents">
				<th>내용</th>
				<td colspan="5">
					<textarea name="context" id="context" cols="30" rows="10">
						<%= vo.getBoardContents() %>
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<a href="boardPage.jsp">
						<input type="button" value="목록" />
					</a>
					<input type="submit" value="수정" onclick="modifyForm(this)"/>
					<a href="detailContents.jsp?boardnum=<%= vo.getBoardNum() %>" id="btn_del">
						<input type="button" value="취소" />
					</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>