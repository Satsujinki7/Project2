<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- project2 file -->
<html>
<head>
<link rel="stylesheet" href="illwriteCss.css" />
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
    	var cat = 0;
    	
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
            
           
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#upload_img').attr('src', e.target.result);
                    $('#upload_img').css('display', 'inline');
                }
              reader.readAsDataURL(input.files[0]);
            }
        }
        
        function subcheck() {
			if (cat != 0  ){
				document.frm.action = "illwriteOk.jsp";
				document.frm.submit();
			}else{
				alert("카테고리를 선택해 주세요");
			}
		}
        function catvalue(data) {
			cat = data.value;
		}
        
    </script>
</head>
<body>
	<%
		String userName = (String)session.getAttribute("userName");
		//로그인 안한 상태에서 글쓰기 접근
		if(userName == null){
			response.sendRedirect("login.jsp");
		}
	%>
        
	<div id="write_div">
    <form id="frm" action="#" method="post" name="frm" enctype="multipart/form-data">
    	<div id="frm_wrap">
    	<div id="writer">
			<p>작성자 : 
				<input type="text" name="wr" id="wr" disabled="disabled" value="<%= userName %>"   />
			</p>
		</div>
    	<div id="file_div">
        		<button id="file_btn">이미지 업로드</button><input type='file' name="upload" id="imgInp"/></div>
        	<div id="img_div">
        		<img id="upload_img" src="#" alt="이미지" /></div>
    		<div id="title_div">
    			<input type="text" name="title" id="title" placeholder="제목을 입력하세요" required="required"/>
    			<select id="option" name="option" onchange="catvalue(this)">
					  <option value="0">카테고리선택</option>
					  <option value="1">일러스트</option>
					  <option value="2">만화</option>
					  <option value="3">2차창작</option>
					  <option value="4">기타</option>
				</select>
    			
    			</div>
    		
        	<div id="textarea_div">
        		<textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea></div>
        	
        	<div id="tag_div">
        		<span>Tag</span>
        		<input type="text" name="tag" id="tag" placeholder="#태그를 달아주세요"  required="required"/>
        	</div>
        	
        	<div id="submit_div">
      		  	 <button value="업로드" id="subbtn" onclick="subcheck()">업로드</button>
        	</div>
        	</div>        
    </form>
    </div>
</body>
</html>


