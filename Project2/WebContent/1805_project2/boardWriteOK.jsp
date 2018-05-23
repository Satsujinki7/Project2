<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작성된 게시글</title>
<% 
	String writer = (String)session.getAttribute("userName");
	String boardTitle = request.getParameter("ti");
	String boardContents = request.getParameter("ct");
	
	out.println(writer);
	//DB 접속 전 확인 필수
	/* out.println("writer : " + wr + "<br>");
	out.println("title : " + title + "<br>");
	out.println("contents : " + contents); */
	
	//DB 연결 후 write에서 전달받은 값을 DB에 전송
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	vo.setBoardWriter(writer);
	vo.setBoardTitle(boardTitle);
	vo.setBoardContents(boardContents);
	
	dao.addData(vo);
	
	BoardVO vo2 = dao.boardData(writer);
	//out.println(vo2.getBoardDate());
	
	//DB 저장 후 게시판 메인으로 화면 이동
	//절대주소, 상대주소
//	response.sendRedirect("list.jsp");
%>
</head>
<body>
	<h2>게시글 등록이 완료되었습니다.</h2>
	<br>
	<h3>작성자 : <%= vo.getBoardWriter() %></h3>
	<%-- <h3>작성일 : <%= vo2.getBoardDate() %></h3> --%>
	<h3>제목 : <%= vo.getBoardTitle() %></h3>
	<h3>내용 : <%= vo.getBoardContents() %></h3>
	
	<jsp:forward page="boardPage.jsp"></jsp:forward>
	
</body>
</html>