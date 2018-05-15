<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration confirm</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");	
	
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		String userName = request.getParameter("name");
		//성별을 라디오박스로 했으니 어떻게 넘길것인지 해결해보자
		//String userGender = request.getParameter("gender");
		
		int t_gender = Integer.parseInt(request.getParameter("gender"));
		String userGender = "";
		if(t_gender == 1) {
			userGender = "남";
		} else {
			userGender = "여";
		}
		
		int userBirth = Integer.parseInt(request.getParameter("birth"));
		String userNicName = request.getParameter("nic");
		//연락처를 현재 3개로 쪼개서 보내게 되어 있는데 한개로 통일하도록 바꾸자
		String userPhone = request.getParameter("phone");
		String userEmail = request.getParameter("email");
		String userAddress = request.getParameter("address");
		
		int userFollower = 0;
		int userFollowing = 0;
		/* out.println(id + ", " + pw + ", " + name + ", " + birth + ", " + 
				mp1 + ", " + mp2 + ", " + email); */
				
		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO(userId, userPw, userName, userGender, userBirth, userNicName,
				userPhone, userEmail, userAddress, userFollower, userFollowing);
				
		dao.addUser(vo); 

	%>
	<h2><%= userName %> 의 가입이 완료되었습니다.</h2>
	<h3>ID : <%= vo.getUserId() %><br>
		PW : <%= vo.getUserPw() %><br>
		NAME : <%= vo.getUserName() %><br>
		GENDER : <%= vo.getUserGender() %><br>
		BIRTH : <%= vo.getUserBirth() %><br>
		NICNAME : <%= vo.getUserNicName() %><br>
		PHONE : <%= vo.getUserPhone() %><br>
		EMAIL : <%= vo.getUserEmail() %><br>
		ADDRESS : <%= vo.getUserAddress() %><br>
	</h3>
</body>
</html>