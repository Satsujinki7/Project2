<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- layout from pj2 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일러스트 페이지 </title>
<link rel="stylesheet" href="pageCss.css" />

 </head>
<body>
	<div id="container">

		<div id="header">
			<jsp:include page="nav.jsp"></jsp:include>
		</div>
		
		<div id="contents">
		 <jsp:include page="frame_ill.jsp"></jsp:include> 
		</div>
		
	 
	
	</div>
	
	<div id="footercon">
		 <jsp:include page="footer.jsp"></jsp:include> 
	</div>


</body>
</html>
