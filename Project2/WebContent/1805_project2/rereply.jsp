<%@page import="dao.ReplyV2_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대댓글</title>
	<%
		String bnum = request.getParameter("board_num");
		String rnum = request.getParameter("rep_num");
		
		String userId = (String)session.getAttribute("userName");
		
		int bno = 0;
		int rno = 0;
		
		if(rnum!=null) {
			bno = Integer.parseInt(bnum);
			rno = Integer.parseInt(rnum);
			
			ReplyV2_DAO dao = new ReplyV2_DAO();
		}
	%>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		function goRereply() {
			var form = document.frm;
			form.action = "rereplyOK.jsp";
			form.submit();
			
			/*window.opener.location.reload();
			window.close();*/
		}
	</script>
	<style>
		#wrap {
			width: 400px;
			height: 400px;
			text-align: center;
		}
		#contents {
			width: 80%;
			height: 70%;
		}
		#re_replyOK {
			width: 80px;
			height: 40px;
			text-align: center;
		}
	</style>
</head>
<body>
	
	<div id="wrap">
		<div id="contents">
			<form id="frm" name="frm">
				<input type="hidden" name="board_num" value="<%= bno %>"/>
				<input type="hidden" name="rep_num" value="<%= rno %>"/>
				<input type="hidden" id="boardwriter" name="boardwriter" value="<%= userId %>"/>
				
				<div id="writer">
					<label for="">답글 작성할 글번호 : <%= rno %></label><br><br>
					<label for="">작성자 : <%= userId %></label><br><br>
				</div>
				<div id="contents">
					<textarea name="re_reply" id="re_reply" cols="40" rows="4" ></textarea>
				</div>
				<div id="btn">
					<br><input type="button" id="re_replyOK" name="re_replyOK" value="댓글쓰기" onclick="goRereply()"/><br>
				</div>
			</form>
		</div>
	</div>
</body>
</html>