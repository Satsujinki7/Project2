

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<html>
<head>
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
                    
                }

              reader.readAsDataURL(input.files[0]);
            }
        }


    </script>
    
    
    
 <style type="text/css">
    
    
    #upload_img {
    	display : none;
    	width: 500px;
		margin: 0;
	}
    
    
    #write_div {
    
    border: 1px solid black;
   	width: 1000px;
   	height: auto;
   	margin : 20px auto;
    
    }
    
    #frm_wrap{
    	
    	/*  border: 1px solid black; */
    	 width: 80%;
    	 height: auto;
    	 margin: 5px auto;
    	
    	
    
    }
    
    #title_div {
    	 width: 500px;
    	 height: auto;
    	 margin: 20px auto;
    }
    
    #title_div input{
    
    	width: 310px;
    	height: 30px;
    	border: none;
    	border-bottom: 3px solid gray;
    	font-size: 15px;
    	outline: none;
    }
    
    
    #title_div select{
    
    	width: 170px;
    	height: 30px;
    	margin-left:10px;
    	border: 2px solid gray;
    }
   
   #imgInp{
   
   	opacity:0;
   	position:relative;
   	width: 130px;
	height: 40px;
	 cursor: pointer;
   }


	#file_btn{
	 position: absolute;
	  width: 130px;
	  height: 40px;
	  
	  font-weight: bold;
	  border: 3px solid gray;
	  font-size: 15px;
	  background: white;
	  color: black;
	  cursor: pointer;
	
	}
	
	#file_div{
	
		width: 140px;
    	 height: auto;
    	 margin: 20px auto;
	
	}
	
	
	
	
	#img_div{
		width: 500px;
		height: auto;
		margin: 20px auto;
	
	}
	
	#textarea_div{
	
	
		width: 500px;
		height: auto;
		margin: 5px auto;
	
	}
	
	#textarea_div textarea{
	
		width: 500px;
		height: 70px;
		font-size: 15px;
		border: 3px solid #ccc;
	    -webkit-transition: 0.5s;
	    transition: 0.5s;
	    outline: none;
	    resize: none;
	}
	
	
	#tag_div {
	
		width: 500px;
		height: auto;
		margin: 20px auto;
	}
	
	#tag_div span {
		
		width: 30px;
		height: auto;
		font-size: 15px;
		font-weight: bold;
	
	}
	
	#tag_div input{
		
		margin-left: 10px;
		font-size: 15px;
		width: 450px;
		height: 30px;
		border:none;
		border-bottom: 2px solid gray;
		 outline: none;
	
	}
	
	#submit_div {
		width:140px;
		height: 40px;
		margin: 30px auto;
	
	}
	
	#submit_div input{
	
	opacity:0;
   	position:relative;
   	width: 130px;
	height: 40px;
	 cursor: pointer;
	
	}	
	#submit_div button{
	
		width: 130px;
	  height: 40px;
	  
	  font-weight: bold;
	  border: 3px solid gray;
	  font-size: 15px;
	  background: gray;
	  color: white;
	  cursor: pointer;
	
	}
	
	
	
	
</style>
</head>
<body>

	<div id="write_div">
    <form id="form1" runat="server">
    	<div id="frm_wrap">
    	<div id="file_div">
        		<button id="file_btn">이미지 업로드</button><input type='file' id="imgInp"/></div>
        	<div id="img_div">
        		<img id="upload_img" src="#" alt="이미지" /></div>
    		<div id="title_div">
    			<input type="text" name="title" id="title" placeholder="제목을 입력하세요"/>
    			<select>
					  <option value="">카테고리선택</option>
					  <option value="">카테고리1</option>
					  <option value="">카테고리2</option>
					  <option value="">카테고리3</option>
					  <option value="">카테고리4</option>
				</select>
    			
    			</div>
    		
        		
        	<div id="textarea_div">
        		<textarea name="" id="" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea></div>
        	
        	
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


