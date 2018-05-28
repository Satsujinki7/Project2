<%@page import="vo.ReplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReplyDAO"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
	<%
		String currentUser = (String)session.getAttribute("userName");
		
		String bn = request.getParameter("boardnum");
		int bnum = 0;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		ReplyDAO re_dao = new ReplyDAO();
		ReplyVO re_vo = new ReplyVO();
	
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
			padding: 20px;
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
		#userid {
			width: 50px;
		}
		
		#rep_writer {
			text-align: center;
			color: red;
		}
		#rep_context {
			color: green;
		}
		#rep_date {
			color: blue;
		}
		
		#uname, #cname {
			display: none;
		}
		
		#wrap {
			margin-bottom: 100px;
		}
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		window.onload = function() {		
			var userId = "<%= currentUser %>";
			
			//세션 정보가 없으면 모든 기능 봉쇄
			//글쓴이와 현재 유저가 동일한지 판단
			//동일하다면 자기 글 추천 비활성화
			//동일하지 않다면 수정 및 삭제 버튼 비활성화
			if(userId == "null" || userId == null) {
				document.getElementById("btn_nom").style.display = "none";
				document.getElementById("btn_mod").style.display = "none";
				document.getElementById("btn_del").style.display = "none";
				document.getElementById("isHidden").style.display = "none";
			} else if(userId == boardwriter.value) {
				document.getElementById("btn_nom").style.display = "none";
			} else {
				document.getElementById("btn_mod").style.display = "none";
				document.getElementById("btn_del").style.display = "none";
			}
		}
		
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
		
		function deleteReply(repno) {
			if(!confirm("삭제하시겠습니까?")) {
				return;
			}
			
			var form = document.frm;
			form.action = "replyDelete.jsp";
			form.submit();
			
		}

	</script>
</head>
<body>
<div id="container_nav">	
	<jsp:include page="nav.jsp"></jsp:include>
</div>
	<%-- <jsp:useBean id="vo" class="bean.UserBean" scope="session"></jsp:useBean> --%>
<div id="wrap">
	<form id="frm" name="frm" action="replyOK.jsp">
		<input type="hidden" id="boardnum" name="boardnum" value="<%= vo.getBoardNum() %>"/>
		<input type="hidden" id="boardwriter" name="boardwriter" value="<%= vo.getBoardWriter() %>"/>
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
			
			<%-- <c:if test="${ sessionScope.sessionID != null }"></c:if> --%>
			
			<tr>
				<th>댓글</th>
				<td colspan="5">
					<div id="showReply">
						<%
							ReplyDAO r_dao = new ReplyDAO();
						
							int boardNum = vo.getBoardNum();
							ArrayList<ReplyVO> r_list = r_dao.getAllReply(boardNum);
							for(ReplyVO r_vo : r_list) {
							
						%>
						<input type="hidden" name="rep_num" value="<%= r_vo.getReplyNum() %>"/>
						<label for=""><%= r_vo.getReplyWriter() %></label>&nbsp;
						<label for=""><%= r_vo.getReplyComment() %></label>&nbsp;
						<label for=""><%= r_vo.getReplyDate() %></label>
						<a href="#">[답글]</a>
						<a href="#" onclick="deleteReply(<%= r_vo.getReplyNum() %>)">[삭제]</a>
						<%-- <a href="replyDelete.jsp?replynum=<%= r_vo.getReplyNum() %>">[삭제]</a> --%>
						
						
						<br><br>
						<%
							}
						%>
						
					</div>
					<div id="isHidden">
					<hr><br>
						<input type="text" name="userid" id="userid" value="<%= session.getAttribute("userName") %>" disabled="disabled"/>
						<%-- <label for=""><%= session.getAttribute("userName") %></label> --%>
						<textarea name="reply" id="reply" cols="40" rows="4"></textarea>
						<input type="submit" value="댓글등록" />
					</div>
					
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
	</form>
</div>
	
	
	
	
	<%-- <div id="anotherPart" align="center">
		<div id="anotherWrap">
			<form id="reply_write">
				<input type="hidden" id="replyboardnum" name="replyboardnum" value="${board.boardNum}" />
				<input type="hidden" id="replynum" name="replynum" value="0" />
				<input type="hidden" id="groupnum" name="groupnum" value="0" />
				<input type="hidden" id="parentreplynum" name="parentreplynum" value="0" />
				<input type="hidden" id="ordernum" name="ordernum" value="0" />
				<input type="hidden" id="depth" name="depth" value="0" />
				
				<textarea rows="" cols=""></textarea>
			</form>
		</div>
	</div> --%>
	
	<div id="footercon">
		 <jsp:include page="footer.jsp"></jsp:include> 
	</div>
</body>
</html>