<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- project2 file -->
<html>
<head>
<link rel="stylesheet" href="illwriteCss.css" />
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
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
                    var width = $('#upload_img').width()
                    console.log(width);
                }
              reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</head>
<body>

	<div id="write_div">
    <form id="frm" action="illwriteOk.jsp" method="post" name="frm" enctype="multipart/form-data">
    	<div id="frm_wrap">
    	<div id="writer">
			<p>작성자 : 
				<input type="text" name="wr" id="wr"  />
			</p>
		</div>
    	<div id="file_div">
        		<button id="file_btn">이미지 업로드</button><input type='file' name="upload" id="imgInp"/></div>
        	<div id="img_div">
        		<img id="upload_img" src="#" alt="이미지" /></div>
    		<div id="title_div">
    			<input type="text" name="title" id="title" placeholder="제목을 입력하세요"/>
    			<select>
					  <option value="">카테고리선택</option>
					  <option value="">일러스트</option>
					  <option value="">카테고리2</option>
					  <option value="">카테고리3</option>
					  <option value="">카테고리4</option>
				</select>
    			
    			</div>
    		
        	<div id="textarea_div">
        		<textarea name="content" id="content" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea></div>
        	
        	<div id="tag_div">
        		<span>Tag</span>
        		<input type="text" name="" id="tag" />
        	</div>
        	
        	<div id="submit_div">
        			<button>업로드</button>
        			<input type="submit" value="업로드" />
        	</div>
        	</div>        
    </form>
    </div>
</body>
</html>


