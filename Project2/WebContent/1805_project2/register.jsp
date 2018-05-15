<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
	<style>
		#regDiv {
			width: 600px;
			margin: 0 auto;
		}
		
		table, tr, th, td {
			border: 1px solid black;
			border-collapse: collapse;
			/* text-align: center; */
		}
		
		tr {
			height: 40px;
		}
		
		.text_class {
			margin-left: 20px;
			width: 80px;
		}
		
		#result {
			text-align: center;
			background-color: blue;
		}
		
		#mp0 {
			margin-left: 20px;
			background-color: white;
			text-align: center;
		} 
		
		#reg {
			background-color: cyan;
		}
	</style>
	
	<script>
		//유효성 검사
		function chkValidate() {
			/* var gender = Integer.parseInt(re)
			for(var i=0; i<gender.value.length; i++){
				if(phone.value[i].checked == true) {
					console.log(gender.value);
				}
			} */
			
			if(id.value.length != 16 && id.value.length > 16) {
				alert("아이디는 16자리까지만 입력하세요.");
				id.value = "";
				return false;
			} else if(pw.value.length != 16 && pw.value.length > 16) {
				alert("비밀번호는 16자리까지만 입력하세요.");
				pw.value = "";
				return false;
			} else if(pw.value != repw.value) {
				alert("확인 비밀번호가 일치하지 않습니다.");
				repw.value = "";
				return false;
			} else if(birth.value.length != 6 || isNaN(birth.value)) {
				alert("생년월일을 잘못 입력했습니다.\n생년월일은 숫자만 입력해야 하며\n반드시 6자리로 입력해야합니다.\n\nex) 180426(o) 18-04-26(x) 18426(x)");		
				birth.value = "";
				return false;
			} else if(nic.value.length != 16 && nic.value.length > 16) {
				alert("닉네임은 16자리까지만 입력하세요.");
				nic.value = "";
				return false;
			} else if(phone.value.length != 11) {
				alert("전화번호는 11자리로 구성되어야 합니다.");
				phone.value = "";
				return false;
			} 
			
			//뭐지???
			//한글 입력 제한(오류있어서 안먹힘)
			/* else if(isNaN(id.value)) {
				alert("아이디는 영문 대소문자만 입력할 수 있습니다.");
				id.value = "";
				return false;
			} */
			
			//전화번호 입력 원본
			/* else if((mp1.value.length != 4 && mp1.value.length > 4) ||
					(mp2.value.length != 4 && mp2.value.length > 4)) {
				alert("전화번호란은 각각 4자리를 초과할 수 없습니다.");
				mp1.value = "";
				mp2.value = "";
				return false;
			}  */
			
	
			return true;
		};
		
		//아이디 중복 확인
		function dupCheckID() {
			if(id.value == "") {
				alert("아이디를 입력해주세요.");
			} else {
				url = "checkId.jsp?id=" + id.value;
				
				open(url, "confirm", "toolbar=no, location=no, resizable=no, width=300px, height=200px");
			}
		} //dupCheckID end
		
		//닉네임 중복 확인
		function dupCheckNic() {
			if(nic.value == "") {
				alert("닉네임을 입력해주세요.");
			} else {
				url = "checkNic.jsp?nic=" + nic.value;
				
				open(url, "confirm", "toolbar=no, location=no, resizable=no, width=300px, height=200px");
			}
		} //dupCheckNic end
		
		/* function chk() {
			alert("진입");
			if(pw.value.length != 6 && pw.value.length > 6) {
				alert("비밀번호는 6자리까지만 입력하세요.");
				pw.value = "";
				return false;
			}
		}; */
	</script>
</head>
<body>
	<div id="regDiv">
		<form action="registerOK.jsp" method="GET">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input class="text_class" type="text" name="id" id="id" required/>
						<input type="button" id="id_check" value="중복확인" onclick="dupCheckID()"/>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input class="text_class" type="text" name="pw" id="pw" required/>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input class="text_class" type="text" name="repw" id="repw" required/>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input class="text_class" type="text" name="name" id="name" required/>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="1" checked="checked" />남
						<input type="radio" name="gender" value="2" />여
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input class="text_class" type="text" name="birth" id="birth"
						placeholder="생년월일 6자리" required/>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input class="text_class" type="text" name="nic" id="nic" required />
						<input type="button" id="nic_check" value="중복확인" onclick="dupCheckNic()" />
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<!-- <input type="text" name="mp0" id="mp0" value="010" size="1" disabled="disabled"/>
						<input type="text" name="mp1" id="mp1" size="3" required />
						<input type="text" name="mp2" id="mp2" size="3" required /> -->
						<input type="text" name="phone" id="phone" required />
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>
						<input type="text" name="email" id="email" required/>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" id="address" required/>
					</td>
				</tr>
				<tr id="result">
					<td colspan="2">
						<input type="submit" value="Go" id="reg" onclick="chkValidate()"  />
						<input type="reset" value="Reset" id="reset"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>