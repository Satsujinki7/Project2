<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	//이미지 업로드용 변수들
	//실제로 이미지 출력할 값이 담기는 이클립스 폴더 경로
	//어떤 컴에서는 request 객체로 해도 되고 어떤 컴에서는 또 안되더라.
	//안될 경우 밑의 getServletContext 객체로 써라.
//	String saveDir = request.getRealPath("upload");
	String saveDir = getServletContext().getRealPath("upload");
	int maxSize = 1024*1024*5;
	
	//이렇게 생성하면 절대경로상에 이미지파일이 생성됨
	//이것을 위의 이클립스 경로상에서 가상으로 참조하여 뿌려주는 형식
	MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());

	
	String writer = (String)session.getAttribute("userName");
	String boardTitle = multi.getParameter("ti");
	String boardContents = multi.getParameter("ct");
	//파일의 이름을 온전하게 받아오기 위해 사용
	String fn = multi.getOriginalFileName("upload");
	
	//DB 연결 후 write에서 전달받은 값을 DB에 전송
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	vo.setBoardWriter(writer);
	vo.setBoardTitle(boardTitle);
	vo.setBoardImage("../upload/" + fn);
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
	<img src="<%= vo.getBoardImage() %>" width=512 height=384></img>
	
	<jsp:forward page="boardPage.jsp"></jsp:forward>
	
</body>
</html>