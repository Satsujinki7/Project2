<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CSS 불러오기 -->
<link rel="stylesheet" href="homeCss.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
	<div id="container">
		<div id="con_head">
			<!-- 본격적 네비바 들어갈요소들 -->
			<div id="con_head_nav">
			<!-- 반응형 만들기 위해 홈버튼 부분 -->
			<div id="con_head_lg">
				<div id="ch_nav_lg">
					<a href="#"><img src="../images/deden.jpg" alt="홈이미지" id="logo"/></a>
				</div>
			</div>
			<!-- 로고빼고 기타등등 -->
			<div id="con_head_notlog">			
				<div id="ch_nav_cat">
					<ul>
						<li><a href="mainHome.jsp?fno=timeline">타임라인</a></li>
						<li><a href="mainHome.jsp?fno=lanking">랭킹</a></li>
						<li><a href="#">카테고리</a>
							<!-- ?????왜안뜨냐 이거 -->
						</li>
					</ul>		
				</div>
				<div id="ch_nav_etc">
					<ul>
						<li>...</li>
					</ul>
				</div>		
				<div id="ch_nav_search">
					<input type="text" name="nav_ser" id="nav_ser" />
					<input type="button" value="%" id="nav_ser_btn"/>
				</div>
				<div id="ch_nav_log">
					<a href="#">로그인</a>
					<a href="#">회원가입</a>
				</div>
			</div>
			</div>
		</div>
	</div>
