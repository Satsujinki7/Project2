<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 쓰기</title>
	<%
		String userName = (String)session.getAttribute("userName");
	%>
	<style>
		#container {
			margin: 0 auto;
			width: 600px;
			border: 1px solid black;
		}
		#top {
			text-align: center;
			color: #33ffbb;
			border-bottom: 1px solid black;
		}
		#context {
			text-align: center;
		}
		#button {
			margin-left: 30px;
			margin-bottom: 20px;
		}
		#writer, #title {
			margin-left: 10px;
		}
	</style>

</head>
<body>
	<form action="boardWriteOK.jsp" name="frm" enctype="multipart/form-data" method="post">
		<div id="container">
			<div id="top">
				<p>
					<h3>게시글 작성</h3>
				</p>
			</div>
			<div id="writer">
				<p>작성자 : 
					<input type="text" name="wr" id="wr" disabled="disabled" value="<%= userName %>" />
				</p>
			</div>
			<div id="title">
				<p>제목 : 
					<input type="text" name="ti" id="ti" required />
				</p>
			</div>
			<div id="context">
				<p>
					<textarea name="ct" id="ct" cols="35" rows="10" ></textarea>
				</p>
			</div>
			<div id="fileUp">
				<p>첨부파일 : 
					<input type="file" name="upload" id="upload" />
				</p>
			</div>
			<div id="button">
				<a href="boardPage.jsp">
					<input type="button" value="목록보기" />
				</a>
				<input type="submit" value="작성하기" onclick="submitForm(this)"/>
				<input type="reset" value="다시쓰기" />
			</div>
		</div>
	</form>
</body>
</html>