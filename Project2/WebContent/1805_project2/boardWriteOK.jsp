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
	/* String writer = (String)session.getAttribute("userName");
	String boardTitle = request.getParameter("ti");
	String boardContents = request.getParameter("ct"); */
	
	String writer = "";
	String boardTitle = "";
	String boardContents = "";
	
	//이미지 업로드용 변수들
	request.setCharacterEncoding("UTF-8");
	String realPath = "";
	String fileName = "";
	int maxSize = 1024*1024*5;
	String encType = "UTF-8";
	String saveFile = "up_img";
	
	ServletContext scontext = getServletContext();
	realPath = scontext.getRealPath(saveFile);

	try {
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());

		Enumeration<?> files = multi.getFileNames();
		String file1 = (String)files.nextElement();
		fileName = multi.getFilesystemName(file1);
		
		writer = (String)session.getAttribute("userName");
		boardTitle = multi.getParameter("ti");
		boardContents = multi.getParameter("ct");
	} catch(Exception e) {
		  e.printStackTrace();
	}

	String fullPath = realPath + "\\" + fileName;
	//이미지 업로드 끝

	
	
	//DB 연결 후 write에서 전달받은 값을 DB에 전송
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	vo.setBoardWriter(writer);
	vo.setBoardTitle(boardTitle);
	vo.setBoardImage(fullPath);
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
	
	<%-- <jsp:forward page="boardPage.jsp"></jsp:forward> --%>
	
</body>
</html>