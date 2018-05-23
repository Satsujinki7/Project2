<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 삭제</title>
</head>
<body>
	<%
		String bnum = request.getParameter("boardnum");
		int bno = 0;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		if(bnum!=null) {
			bno = Integer.parseInt(bnum);
			
			//vo에 내용을 담아야 밑에서 출력해주지!
			vo = dao.boardnumData(bno);
		} else {
			response.sendRedirect("boardPage.jsp");
		}
	%>
	
	<form action="boardDeleteOK.jsp">
		<input type="hidden" name="bnum" value="<%= vo.getBoardNum() %>"/>
		<p>
			게시물을 삭제하시겠습니까? <br><br>
			<input type="submit" name="delete" value="삭제" />
			<a href="detailContents.jsp?boardnum=<%= vo.getBoardNum() %>">
				<input type="button" name="cancel" value="취소" />
			</a>
		</p>
	</form>
</body>
</html>