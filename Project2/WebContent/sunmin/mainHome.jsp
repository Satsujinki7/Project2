<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pika</title>
<!-- CSS 불러오기 -->
<link rel="stylesheet" href="homeCss.css" />
</head>
<%
	String fname = "";

	Object obj = request.getParameter("fno");
	
	if(obj==null){
		fname = "lanking.jsp";
	}else{
		fname = (String)obj +".jsp";
	}
	

%>

<body>
	<div id="container_all">
		<!-- header.jsp -->
		<div id="container_head">
			<jsp:include page="home.jsp"></jsp:include>
		</div>
		<div id="contsiner_body">
			<!-- div id 를 같게 한 후 선택되는 것에 따라 변환하고 싶음 -->
			<jsp:include page="<%=fname %>"></jsp:include>
		</div>
	</div>
</body>
</html>