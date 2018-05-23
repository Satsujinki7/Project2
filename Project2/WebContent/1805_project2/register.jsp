<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
<style>	
	#regDiv {
		width: 800px;
		height: 740px;		
		border: 1px solid black;
		position:relative;
		margin: 0 auto;		
	}	
	h3{
		position: relative;
		display: inline;
		margin: 10px;
	}
	.basic{
		background-color: gray;
		color: white;
		width: 140px;
		height: 60px;
		position:relative;
		margin: 0 0 2px 10px;		
		text-align: center;
	}
	strong{
		position: relative;
		top: 15px;			
	}
	span{
		font-size: 8px;
	}
	#req{
		position: relative;
		left: 580px;
		top: -40px;							
	}
	#tp1{
		position: relative;
		left: 140px;
		top: -60px;					
	}
	#reg:hover{cursor: pointer; border: 1px solid black; color: black;}
	#reset:hover{cursor: pointer; border: 1px solid black; color: white;}
		
	#id{width: 120px; height: 20px;}
	#id_check{font-size: 12px; border: 1px solid black;}
	#id_check:hover{background-color: gray;}
	#pid{font-size: 12px; color: brown;	position: relative; left: 20px;}
	
	#pwbox{height: 90px; position: relative; top: -60px;}
	#pwsp{position: relative; top: 30px;}
	#pw{position: relative; left: 140px; width: 120px; height: 20px; top: -142px;}
	#ppw{font-size: 12px; color: brown;	position: relative; left: 160px; top: -145px;}
	
	#pwckbox{top: -135px; height: 50px;}
	#repw{position: relative; left: 140px; width: 115px; height: 20px; top: -175px;}
			
	#namebox{top: -155px; height: 50px;}
	#name{position: relative; left: 140px; width: 115px; height: 20px; top: -195px;}
	
	#genderck{top: -175px; height: 50px;} 
	#gender{position: relative; left: 160px; width: 115px; height: 20px; top: -215px;}
	.gendersp{position: relative; font-size:12px; top: -3px; font-weight: bold;}
	
	#birthbox{top: -190px; height: 50px;}
	#birth{position: relative; left: 140px; width: 115px; height: 20px; top: -230px;}
	
	#nickbox{top: -210px; height: 50px;}	
	#nic{position: relative; left: 140px; width: 115px; height: 20px; top: -250px;}
	#nic_check{position: relative; left: 140px; width: 115px; height: 20px; top: -249px; border: 1px solid black;}
	#nic_check{font-size: 12px;}
	#nic_check:hover{background-color: gray;}
	
	#phonebox{top: -230px; height: 50px;}
	#phone{position: relative; left: 160px; width: 115px; height: 20px; top: -270px;}
	
	#emailbox{top: -250px; height: 50px;}
	#email{position: relative; left: 160px; width: 115px; height: 20px; top: -290px;}
	
	#addressbox{top: -270px; height: 50px;}
	#address{position: relative; left: 160px; width: 115px; height: 20px; top: -310px;}
	
	#reg{position: relative; top: -290px; width: 100px; height: 40px; border: 1px solid brown; background-color: brown; color: white; font-weight: bold;}
	#reset{position: relative; top: -290px; width: 100px; height: 40px; border: 1px solid gray; background-color: gray; font-weight: bold;}	
	
	
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
	}
	
	
	#mp0 {
		margin-left: 20px;
		background-color: white;
		text-align: center;
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
		<br />			
		<h3>※ 기본정보</h3><br />
		<span id="req" style="font-size: 12px">✓ 표시 항목은 필수 항목입니다.</span>
		<form action="registerOK.jsp" method="GET">
			<div>
				<div>
					<div class="basic"><strong><span>✓</span> 아이디</strong></div>
					<div id="tp1">
						<input class="text_class" type="text" name="id" id="id" placeholder="ID" required/>																		
						<input type="button" id="id_check" value="✓ 아이디중복확인" onclick="dupCheckID()"/>
						<p id="pid">＊ 6~16자까지 영문자(소문자), 숫자 사용 가능합니다.</p>
					</div>
				</div>
				<div>
					<div class="basic" id="pwbox"><strong id="pwsp"><span>✓</span> 비밀번호</strong></div>
					<div>
						<input class="text_class" type="text" name="pw" id="pw" placeholder="PW" required/>
						<p id="ppw">＊ 6~16자까지 영문자(대소문자), 숫자 및 특수문자 사용 가능합니다.<br />
							   &nbsp;&nbsp;&nbsp;&nbsp;3자리 연속 또는 같은 문자, 아이디는 사용하실 수 없습니다.</p>							   						
					</div>
				</div>
				<div>
					<div id="pwckbox" class="basic"><strong><span>✓</span> 비밀번호 확인</strong></div>
					<div>
						<input class="text_class" type="text" name="repw" id="repw" placeholder="PW 재입력" required/>
					</div>
				</div>
				<div>
					<div class="basic" id="namebox" ><strong><span>✓</span> 이름</strong></div>
					<div>
						<input class="text_class" type="text" name="name" id="name" placeholder="이름" required/>
					</div>
				</div>
				<div>
					<div class="basic" id="genderck"><strong><span>✓</span> 성별</strong></div>
					<div id="gender">
						<input type="radio" name="gender" value="1" checked="checked" /><span class="gendersp">남자</span>
						<input type="radio" name="gender" value="2" /><span class="gendersp">여자</span>
					</div>
				</div>
				<div>
					<div class="basic" id="birthbox"><strong><span>✓</span> 생년월일</strong></div>
					<div>
						<input class="text_class" type="text" name="birth" id="birth"
						placeholder="6자리(ex : 910505)" required/>
					</div>
				</div>
				<div>
					<div class="basic" id="nickbox"><strong><span>✓</span> 닉네임</strong></div>
					<div>
						<input class="text_class" type="text" name="nic" id="nic" required placeholder="닉네임" />
						<input type="button" id="nic_check" value="✓ 닉네임중복확인" onclick="dupCheckNic()" />
					</div>
				</div>
				<div>
					<div class="basic" id="phonebox"><strong><span>✓</span> 연락처</strong></div>
					<div>
						<!-- <input type="text" name="mp0" id="mp0" value="010" size="1" disabled="disabled"/>
						<input type="text" name="mp1" id="mp1" size="3" required />
						<input type="text" name="mp2" id="mp2" size="3" required /> -->
						<input type="text" name="phone" id="phone" required placeholder="하지마아!" />
					</div>
				</div>
				<div>
					<div class="basic" id="emailbox"><strong><span>✓</span> Email</strong></div>
					<div>
						<input type="text" name="email" id="email" placeholder="하지마아!" required/>
					</div>
				</div>
				<div>
					<div class="basic" id="addressbox"><strong><span>✓</span> 주소</strong></div>
					<div>
						<input type="text" name="address" id="address" placeholder="하지마아!" required/>
					</div>
				</div>
				<div id="result">
					<div colspan="2">
						<input type="submit" value="Go" id="reg" onclick="chkValidate()"  />
						<input type="reset" value="Reset" id="reset"/>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>