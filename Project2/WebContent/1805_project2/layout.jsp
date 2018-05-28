<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- layout from pj2 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout.jsp</title>
<link rel="stylesheet" href="newcss.css" />

 </head>
<body>

	
	
	
	<div id="container">

		<div id="header">
			<jsp:include page="nav.jsp"></jsp:include>
		</div>
		
		<div id="contents">
		 <jsp:include page="frame_ill.jsp"></jsp:include> 
		</div>
		<%-- <jsp:include page="content.jsp"></jsp:include> --%>
		
	</div>
	<!-- 
	<div id="footercon">
		 <jsp:include page="footer.jsp"></jsp:include> 
	</div>
	
	 -->


</body>
</html>
