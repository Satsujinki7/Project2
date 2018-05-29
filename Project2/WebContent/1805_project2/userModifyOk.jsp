<%@page import="java.util.Base64.Encoder"%>
<%@page import="bean.UserBean"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String userId = request.getParameter("id");
	String userPw = request.getParameter("pw");
	String userNic = request.getParameter("nic");
	String userEmail = request.getParameter("email");
	String userAddress = request.getParameter("address");
	
	/* UserDAO dao = new UserDAO();
	UserVO vo = new UserVO();
	
	vo.setUserId(userId);
	vo.setUserPw(userPw);
	vo.setUserNicName(userNic);
	vo.setUserEmail(userEmail);
	vo.setUserAddress(userAddress);
	
	dao.updateUser(vo); */
	
	//out.println(session.getAttribute(userId));
	
	Object obj = session.getAttribute(userId);
	if(obj!=null){
		String str = (String)obj;
	out.println(str);
	response.sendRedirect("myPage.jsp?writer="+str);
		
	}

/* out.println(userId + userPw + userNic + userEmail + userAddress); */
//---------------------------------------------------------------------------------------
	

//response.sendRedirect("myPage.jsp?writer="+vo.getUserName()); // null 값
%>
	<%-- <% response.sendRedirect("myPage.jsp?writer=" + session.getAttribute("userName")); // ??? 값 %> --%>
<%-- response.sendRedirect("myPage.jsp?writer=<%=session.getAttribute("userName") %>"); --%>
 
</body>
</html>