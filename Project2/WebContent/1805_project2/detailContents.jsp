<%@page import="dao.ReplyV2_DAO"%>
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
			/* background: -webkit-gradient(linear, 78% 20%, 10% 20%, from(#6699ff), to(#00ffff)); */
			background: cyan;
		}
		/* #context {
			background-color: #6699ff;
		} */
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
			margin-bottom: 50px;
		}
		#reply_div {
			width: 800px;
			border: 2px solid blue;
			/* text-align: center; */
			margin: 0 auto;
			margin-bottom: 50px;
		}
		#re_reply, #re_replyOK {
			display: none;
		}
		.showReply {
			padding-left: 150px;
			padding-top: 20px;
			/* text-align: left; */
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
		
		//홈으로 돌아가기
		function pageBack() {
			location.href = 'boardPage.jsp';
		}
		//게시글 수정
		function boardModify() {
			location.href = 'boardModify.jsp?boardnum=' + <%= vo.getBoardNum() %>;
		}
		//게시글 삭제
		function boardDelete() {
			location.href = 'boardDelete.jsp?boardnum=' + <%= vo.getBoardNum() %>;
		}
		//게시글 추천
		function nominate() {
			alert("추천되었습니다.");
			location.href = 'nominateOK.jsp?boardnum=' + <%= vo.getBoardNum() %>;
		}
		
		//댓글 삭제하기(현재 연쇄삭제 오류가 있음)
		function deleteReply(replynum) {

			if(!confirm("댓글을 삭제하시겠습니까?")) {
				return;
			}
			
			//document.getElementByName('rep_num')[0].value = replynum;
			//rep_num.value = replynum;
			
			var form = document.frm;
			form.action = "replyDelete.jsp";
			form.submit();
		}
		
		//댓글 작성하기
		function goReply() {
			//var form = document.reply_form;
			var form = document.frm;
			form.action = "replyOK.jsp";
			form.submit();
		}
		
		//대댓글 작성하기
		function goRereply(repno) {
			//var form = document.reply_form;
			var form = document.frm;
			form.action = "rereplyOK.jsp";
			form.submit();
		}
		
		function showReplyBoard() {
			document.getElementById("re_reply").style.display = "inline-block";
			document.getElementById("re_replyOK").style.display = "inline-block";
		}

	</script>
</head>
<body>
<div id="container_nav">	
	<jsp:include page="nav.jsp"></jsp:include>
</div>
	<%-- <jsp:useBean id="vo" class="bean.UserBean" scope="session"></jsp:useBean> --%>
<div id="wrap">
	<form id="frm" name="frm">
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
					
					<%-- <div id="showReply">
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
						<a href="replyDelete.jsp?replynum=<%= r_vo.getReplyNum() %>">[삭제]</a>
						
						
						<br><br>
						<%
							}
						%>
						
					</div> --%>
					<div id="isHidden">
					<hr><br>
						<input type="text" name="userid" id="userid" value="<%= session.getAttribute("userName") %>" disabled="disabled"/>
						<%-- <label for=""><%= session.getAttribute("userName") %></label> --%>
						<textarea name="reply" id="reply" cols="40" rows="4"></textarea>
						<!-- <input type="submit" value="댓글등록" /> -->
						<input type="button" value="댓글등록" onclick="goReply()" />
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
		
		<div id="reply_div">
			<input type="hidden" name="board_num" value="<%= vo.getBoardNum() %>"/>
			<%
				//ReplyDAO r_dao = new ReplyDAO();
				ReplyV2_DAO r_dao = new ReplyV2_DAO();
				int boardNum = vo.getBoardNum();
				
				ArrayList<ReplyVO> r_list = r_dao.getAllReply(boardNum);
				//ArrayList<ReplyVO> r_list = r_dao.getAll(boardNum);
				
			
				ReplyVO r_vo = new ReplyVO();
				
				/* for(int i=0; i<r_list.size(); i++) {
					r_vo = r_list.get(i);
					System.out.println(r_vo.getReplyNum());
				} */
			
				
				
				//for(ReplyVO r_vo : r_list) {
				for(int i=0; i<r_list.size(); i++) {
					r_vo = r_list.get(i);
			%>
			<%-- <input type="hidden" name="rep_num" value="<%= r_vo.getReplyNum() %>"/> --%>
			<input type="hidden" name="rep_groupnum" value="<%= r_vo.getGroupNum() %>"/>
			<input type="hidden" name="rep_depth" value="<%= r_vo.getDepth() %>"/>
			<input type="hidden" name="rep_parentnum" value="<%= r_vo.getParentReplyNum() %>"/>
			<input type="hidden" name="rep_ordernum" value="<%= r_vo.getOrderNum() %>"/>
			
				<div class="showReply" style="margin-left: <%= 40*r_vo.getDepth() %>px">
					<%= r_vo.getReplyWriter() %>&nbsp; <%= r_vo.getReplyComment() %>&nbsp; <%= r_vo.getReplyDate() %>&nbsp; 
					<a href="#" onclick="showReplyBoard()">[답글]</a>
					<input type="button" value="<%= r_vo.getReplyNum() %>댓글삭제" onclick="deleteReply(<%= r_vo.getReplyNum() %>)"/><br>
					<!-- <input type="submit" value="삭제" /><br> -->
				<%
					out.println(r_vo.getReplyNum());
				%>
					<textarea name="re_reply" id="re_reply" cols="40" rows="4"></textarea>
					<%-- <input type="button" id="re_replyOK" name="re_replyOK" value="쓰기" onclick="goRereply(<%= r_vo.getReplyNum() %>)"/><br> --%>
					<input type="button" id="re_replyOK" name="re_replyOK" value="쓰기" onclick="goRereply()"/><br>
				</div>
	
			<br>
			<%
				}
			%>
			<input type="hidden" name="rep_num" value="<%= r_vo.getReplyNum() %>"/>
			<%-- <input type="hidden" name="rep_parentnum" value="<%= r_vo.getParentReplyNum() %>"/> --%>
		</div>
	</form>
</div>
	
<%-- <div id="reply_div">
	<form id="reply_form" name="reply_form">
		<input type="hidden" name="board_num" value="<%= vo.getBoardNum() %>"/>
		<%
			//ReplyDAO r_dao = new ReplyDAO();
			ReplyV2_DAO r_dao = new ReplyV2_DAO();
		
			int boardNum = vo.getBoardNum();
			
			//ArrayList<ReplyVO> r_list = r_dao.getAllReply(boardNum);
			ArrayList<ReplyVO> r_list = r_dao.getAll(boardNum);
			for(ReplyVO r_vo : r_list) {

		%>
		<input type="hidden" name="rep_num" value="<%= r_vo.getReplyNum() %>"/>
		<input type="hidden" name="rep_groupnum" value="<%= r_vo.getGroupNum() %>"/>
		<input type="hidden" name="rep_parentnum" value="<%= r_vo.getParentReplyNum() %>"/>
		<input type="hidden" name="rep_depth" value="<%= r_vo.getDepth() %>"/>
		<input type="hidden" name="rep_ordernum" value="<%= r_vo.getOrderNum() %>"/>
		
			<div class="showReply" style="margin-left: <%= 40*r_vo.getDepth() %>px">
				<%= r_vo.getReplyWriter() %>&nbsp; <%= r_vo.getReplyComment() %>&nbsp; <%= r_vo.getReplyDate() %>&nbsp; 
				<a href="#" onclick="showReplyBoard()">[답글]</a>
				<input type="button" value="삭제" onclick="deleteReply(<%= r_vo.getReplyNum() %>)"/><br>
				<!-- <input type="submit" value="삭제" /><br> -->
			
			<%
				out.println(r_vo.getReplyNum());
			%>
				<textarea name="re_reply" id="re_reply" cols="40" rows="4"></textarea>
				<input type="button" id="re_replyOK" name="re_replyOK" value="쓰기" onclick="goRereply()"/><br>
			</div>

		<br>
		<%
			}
		%>
	</form>
</div> --%>


	
	<div id="footercon">
		 <jsp:include page="footer.jsp"></jsp:include> 
	</div>
</body>
</html>