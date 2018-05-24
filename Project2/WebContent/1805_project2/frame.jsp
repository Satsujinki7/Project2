<%@page import="vo.IllboardVo"%>
<%@page import="dao.IllBoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//--------w0524 일러스트 테이블 확인용

IllBoardDao ibd = new IllBoardDao();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>frame.jsp</title>
<link rel="stylesheet" href="layoutcss.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style type="text/css">


#post_wrap{
	width: 1100px;
	height: 1100px;
	margin: 0 auto;

}

.post{
	display: inline;
	width: 300px;
	height: auto;
	
	border: 1px solid #E1E1E1;
	float: left;
	
	margin: 20px 20px;
	

}

.img_area{

width: 300px;
height: 300px;
background-color: #E1E1E1;
}


.post_img {

}


.info_area{

width: 270px;
height: 70px;
padding: 15px;
background-color: white;
border-top: 1px solid #E1E1E1;
border-bottom: 1px solid #E1E1E1;
}


.info_box{

width: 100%;
height: 100%;

background-color: white;
}

.post_title{
	margin-top: 5px;
	font-size: 17px;
	font-weight: bold;
	text-decoration: none;
	color: black;
	display: block;
	
}


.post_writer{

	display: block;
	margin-top:10px;	
		
}



.post_writer img{
	margin-right: 10px;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	float: left;
}

.post_writer span{
	
	display: block;
	padding-top: 4px;
}

a {
	text-decoration: none;
	color: black;
}


.btn_area{
	margin:15px;

}

.post_like{

margin-right: 10px;
}
#writebtn{
	width:  100px;
	height: 60px;
	background-color: black;
	color: white;
	text-decoration: none;
}

</style>

</head>
<body>
	<!-- 네비 바 부부우우우운 -->
	<div id="container_nav">	
		<jsp:include page="nav.jsp"></jsp:include>
	</div>
	<a href="illwrite.jsp" id="writebtn">글쓰기</a>
<div id="post_wrap">

<%
	int i=1;
	ArrayList<IllboardVo> list = ibd.alldataIllBoard();
	for(IllboardVo ibv : list){

%>
	<div class="post">
		<div class="img_area">
			<img src="<%=ibv.getIboardimg() %>" alt="이미지" id="img<%=i++%>"/>
		</div>
		<div class="info_area">
			<div class="info_box">
				<a href="#" class="post_title"><%=ibv.getIboardtitle() %></a>
				<a href="#" class="post_writer">
					<img src="../images/deden.jpg" alt="프사" />
					<span><%=ibv.getIboardwriter() %></span>
				</a>
			</div>
		</div>
		<div class="btn_area">
		 <a href="#" class="post_like">
		 	<span>좋아요</span>
		 	<b><%=ibv.getIboardhits() %></b>
		 	
		 </a>
		 <a href="#" class="comment">
		 	<span>댓글</span>
		 	<b>25</b>
		 </a>
		
		</div>
	</div>
<%
	}// for end
%>
</div>

	<!-- footer 부부우우우우우우우우운 -->
	<div id="footer">
		<p>풋터 부분입니다아ㅏㅇ아아아아</p>
		<p>폼잡는거 거지같다 ^ㅗ^</p>
		<p>project date : 20180509~</p>
	</div>
</body>
</html>
<script type="text/javascript">

$(function(){
	
	  
    $("#downul").hide();
    
  	console.log("layout자바스크립트 실행단");
    
    var width = $(window).width();
    
      
    //창 사이즈가 변하면 변한 width값을 그때그때 저장 
    $(window).resize(function(){
  
    width = $(window).width();
    
    //console.log(width);
    });
    
    
    
    
      
      // ... 메뉴 클릭시 데스크탑 모드- 위아래로 효과 / 모바일 모드 - 양옆으로 효과
      $("#etc").click(function(){
        if(width > 958)
        $("#etc ul").stop().slideToggle(500); 
        else{
        $("#etc ul").hide();
        $("#leftbar").animate({"left":"0"},500);
        }
          
        
      }); 
      
      
      
      //메인 메뉴 마우스오버 할 때 css효과 주기 . 모바일 모드에선 사라짐 
      $(".maina").on('mouseover',function(){
        if(width > 958){
        $(this).css({
          "color":"#80b3ff",
           "border-bottom": "5px solid #80b3ff"
            
        });
        }
      });
      
      $(".maina").on('mouseout',function(){
        if(width > 958){
        $(this).css({
            "color" :"#004080",
            "border" : "none"
            
        });
        }
      });
      
      
      $("#leftbar p").click(function(){
        
        $("#leftbar").animate({"left":"-1500px"},500);
        
      });

	//-------------요기서부터------------------------------------------
	for(var i=1 ; i < 13 ; i++){
			
		var imgwidth = $("#img"+i).width();
		var imgheight = $("#img"+i).height();
		
		if(imgwidth > imgheight){
			$("#img"+i).css("width","300px");
			imgheight = $("#img"+i).height();
			var margin = (300-imgheight)/2;
			$("#img"+i).css({
					"margin-top": margin,
					"margin-bottom": margin
			});
		}//if end
		else{
			$("#img"+i).css("height","300px");
			imgwidth = $("#img"+i).width();
			var margin = (300-imgwidth)/2;
			$("#img"+i).css({
				"margin-left": margin,
				"margin-right": margin	
			});
		}//else end
	}//for end
	
});





</script>

