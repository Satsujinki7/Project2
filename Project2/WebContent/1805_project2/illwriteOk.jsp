<!-- project2 -->
<%@page import="dao.IllBoardDao"%>
<%@page import="vo.IllboardVo"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//이미지 업로드용 변수들 
String saveDir = request.getRealPath("upload");
int maxSize = 1024*1024*5;

//절대경로상에 이미지파일 생성됨, 이클립스 경로상에 가상 참조 & 뿌려줌
MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());

String writer = multi.getParameter("wr");
String title = multi.getParameter("title");
String content = multi.getParameter("content");

//파일 이름을 온전하게 받아오기 위해 사용함
String filename = multi.getOriginalFileName("upload");
//경로포함 fullname //DB에 넣을수 있는값 (감덩);
String fullname = "../upload/" + filename;

IllboardVo ibv = new IllboardVo();
IllBoardDao ibd = new IllBoardDao();

ibv.setIboardtitle(title);
ibv.setIboardwriter(writer);
ibv.setIcoardcontent(content);
ibv.setIboardimg(fullname);
ibv.setIboardflag(1);

ibd.addIllBoard(ibv);


//임시로 해둔 페이지 전환입니다
response.sendRedirect("frame.jsp");

%>