<!-- project2 -->
<%@page import="dao.EtcBoardDao"%>
<%@page import="vo.EtcboardVo"%>
<%@page import="dao.PrdBoardDao"%>
<%@page import="vo.PrdboardVo"%>
<%@page import="dao.ToonBoardDao"%>
<%@page import="vo.ToonboardVo"%>
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

String writer =(String)session.getAttribute("userName");
String title = multi.getParameter("title");
String content = multi.getParameter("content");
//파일 이름을 온전하게 받아오기 위해 사용함
String filename = multi.getOriginalFileName("upload");


//경로포함 fullname //DB에 넣을수 있는값 (감덩);
String fullname = "../upload/" + filename;



//카테고리 넘버 받아온거로 결정
int cat = Integer.parseInt(multi.getParameter("option"));
if(cat==1){//일러스트
	IllboardVo ibv = new IllboardVo();
	IllBoardDao ibd = new IllBoardDao();
	ibv.setIboardtitle(title);
	ibv.setIboardwriter(writer);
	ibv.setIcoardcontent(content);
	ibv.setIboardimg(fullname);
	ibv.setIboardflag(1);
	
	ibd.addIllBoard(ibv);
	response.sendRedirect("page_ill.jsp");
	
}else if(cat == 2){//만화
	ToonboardVo tbv = new ToonboardVo();
	ToonBoardDao tbd = new ToonBoardDao();
	tbv.setTboardtitle(title);
	tbv.setTboardwriter(writer);
	tbv.setTboardcontent(content);
	tbv.setTboardimg(fullname);
	tbv.setTboardflag(1);
	
	tbd.addtoonBoard(tbv);
	response.sendRedirect("page_toon.jsp");
	
}else if(cat==3){//2차창작 (패러디)
	PrdboardVo pbv = new PrdboardVo();
	PrdBoardDao pbd = new PrdBoardDao();
	
	pbv.setPboardtitle(title);
	pbv.setPboardwriter(writer);
	pbv.setPboardcontent(content);
	pbv.setPboardimg(fullname);
	pbv.setPboardflag(1);
	
	pbd.addPrdBoard(pbv);
	response.sendRedirect("page_prd.jsp");
	
}else if(cat ==4){ //기타등등 page
	EtcboardVo ebv = new EtcboardVo();
	EtcBoardDao ebd = new EtcBoardDao();
	
	ebv.setEboardtitle(title);
	ebv.setEboardwriter(writer);
	ebv.setEboardcontent(content);
	ebv.setEboardimg(fullname);
	ebv.setEboardflag(1);
	
	ebd.addEtcBoard(ebv);
	response.sendRedirect("page_etc.jsp");
}

//임시로 해둔 페이지 전환입니다


%>