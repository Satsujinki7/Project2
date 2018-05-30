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
<link rel="stylesheet" href="../css/detailContents.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
	<%
		String currentUser = (String)session.getAttribute("userName");
		
		String bn = request.getParameter("boardnum");
		int bnum = 0;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		ReplyV2_DAO r_dao = new ReplyV2_DAO();
		ReplyVO r_vo = new ReplyVO();
	
		if(bn!=null) {
			bnum = Integer.parseInt(bn);
			
			//먼저 조회수부터 증가시키고
			dao.incrementHits(bnum);
			
			//vo에 내용을 담아 출력
			vo = dao.boardnumData(bnum);
		} else {
			response.sendRedirect("boardPage.jsp");
		}
	%>

	
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
				document.getElementById("comment_write").style.display = "none";
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
		
		//댓글 삭제하기
		function deleteReply(replynum, replywriter) {

			if(!confirm("댓글을 삭제하시겠습니까?")) {
				return;
			}
			var cuser = "<%= currentUser %>";
			var buser = "<%= vo.getBoardWriter() %>";
			var r_buser = replywriter;
			console.log(cuser + ", " + buser);
			
			if(cuser == "null" || buser == null) {
				alert("권한이 없습니다.");
				return false;
			} else if(cuser != r_buser) {
				alert("다른 사람의 글은 지울수 없습니다.");
				return false;
			} else {
				document.frm.rep_num.value = replynum;
				//rep_num.value = replynum;
				
				var form = document.frm;
				form.action = "replyDelete.jsp";
				form.submit();
			}
		}
		
		//댓글 작성하기
		function goReply() {
			if("<%= currentUser %>" == "null" || "<%= currentUser %>" == null) {
				alert("권한이 없습니다.");
				return false;
			} else {
				var form = document.frm;
				form.action = "replyOK.jsp";
				form.submit();
			}
		}
		
		//대댓글 작성하기
		/*function goRereply(replynum) {
			alert(replynum + "번 댓글에 댓글을 작성합니다.");
			//var form = document.reply_form;
			document.frm.rep_num.value = replynum;
			
			var form = document.frm;
			form.action = "rereplyOK.jsp";
			form.submit();
		}*/
		
		//새창으로 대댓글 입력란 띄우기
		function showReplyBoard(replynum) {
			if("<%= currentUser %>" == "null" || "<%= currentUser %>" == null) {
				alert("권한이 없습니다.");
				return false;
			} else {
				document.frm.rep_num.value = replynum;
				alert(document.frm.rep_num.value + "번 댓글에 댓글을 작성합니다.");
				
				var url = "rereply.jsp?replynum=" + replynum;
				var frame = "width=500, height=500, toolbar=no, menubar=no, status=no, scrollbars=no ,resizable=no";
				//window.open(url, frame, false);
				
				var form = document.frm;
				//window.open('', 'POP', url, frame, false);
				//form.target='POP';
				form.action = "rereply.jsp";
				form.submit();
			}
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
					<%-- <textarea name="context" id="context" cols="30" rows="10" disabled="disabled">
						<%= vo.getBoardContents() %> --%>
					</textarea>
					<label for=""><%= vo.getBoardContents() %></label>
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
					<%-- <div id="isHidden">
					<hr><br>
						<div id="session_user">
							<label for=""><%= session.getAttribute("userName") %></label>
						</div>
						<textarea name="reply" id="reply" cols="40" rows="4"></textarea>
						<!-- <input type="submit" value="댓글등록" /> -->
						<input type="button" value="댓글등록" onclick="goReply()" />
					</div>--%>
					
					
				</td>
			</tr>
		</table>
			<div id="comment_write">
				<textarea id="comment_txa" name="reply" id="reply" cols="30" rows="10"
				placeholder="댓글은 1000자 이내로 입력해 주세요."
				></textarea>
				<button id="comment_btn" onclick="goReply()">댓글 쓰기</button>
			</div>
				
		<div id="board_btn_wrap">
				<input type="button" value="목록" onclick="pageBack()"/>
				<input type="button" id="btn_mod" name="btn_mod" value="수정" onclick="boardModify()"/>
				<input type="button" id="btn_del" name="btn_del" value="삭제" onclick="boardDelete()" />
				<input type="button" id="btn_nom" name="btn_nom" value="추천" onclick="nominate()"/>
		</div>
		
		<div id="reply_div">
			<input type="hidden" name="board_num" value="<%= vo.getBoardNum() %>"/>
			<%
				//댓글 부분
				
				int boardNum = vo.getBoardNum();
				
				ArrayList<ReplyVO> r_list = r_dao.getAllReply(boardNum);
	
				/* for(int i=0; i<r_list.size(); i++) {
					r_vo = r_list.get(i);
					System.out.println(r_vo.getReplyNum());
				} */
			

				//for(ReplyVO r_vo : r_list) {
				for(int i=0; i<r_list.size(); i++) {
					r_vo = r_list.get(i);
			%>
			<%-- <input type="hidden" name="rep_num" value="<%= r_vo.getReplyNum() %>"/> 
			<input type="hidden" name="rep_groupnum" value="<%= r_vo.getGroupNum() %>"/>
			<input type="hidden" name="rep_depth" value="<%= r_vo.getDepth() %>"/>
			<input type="hidden" name="rep_parentnum" value="<%= r_vo.getParentReplyNum() %>"/>
			<input type="hidden" name="rep_ordernum" value="<%= r_vo.getOrderNum() %>"/> --%>
			
				<div class="showReply" style="margin-left: <%= 25*r_vo.getDepth() %>px">
					<%
						if(r_vo.getDepth() <= 0) {	//첫 댓글이면 re 없음
					%>
					<%= r_vo.getReplyWriter() %>&nbsp; <%= r_vo.getReplyComment() %>&nbsp; <%= r_vo.getReplyDate() %>&nbsp; 
					<%
						} else {	//대댓글이면 re 붙여 출력
					%>
					<label class="re_lb" for="">▶[re:]</label> <%= r_vo.getReplyWriter() %>&nbsp; <%= r_vo.getReplyComment() %>&nbsp; <%= r_vo.getReplyDate() %>&nbsp; 
					<%
						}
					%>
						<a class="rp" href="#" onclick="showReplyBoard(<%= r_vo.getReplyNum() %>)">[답글]</a>
						<a class="rp" href="#" onclick="deleteReply(<%= r_vo.getReplyNum() %>, '<%= r_vo.getReplyWriter() %>')">[삭제]</a><br>
					
					<%-- <input type="button" value="댓글삭제" onclick="deleteReply(<%= r_vo.getReplyNum() %>)"/><br> --%>
					<!-- <input type="submit" value="삭제" /><br> -->
				<%
					out.println(r_vo.getReplyNum());
				%>
				</div>
	
			<br>
			<%
				}
			%>
			<input type="hidden" name="rep_num" value="<%= r_vo.getReplyNum() %>"/>
			<input type="hidden" name="rep_wri" value="<%= r_vo.getReplyWriter() %>"/>
			<%-- <input type="hidden" name="rep_parentnum" value="<%= r_vo.getParentReplyNum() %>"/> --%>
		</div>
	</form>
</div>
	
	<div id="footercon">
		 <jsp:include page="footer.jsp"></jsp:include> 
	</div>
</body>
</html>