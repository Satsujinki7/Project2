<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout.jsp</title>
 <link rel="stylesheet" href="layoutcss.css" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

 
 </head>
<body>
    <button onclick="topFunction()" id="myBtn">Top</button>
	
	<div id="container_nav">	
		<jsp:include page="nav.jsp"></jsp:include> 
	</div>
	<div id="bodyWrap">
		<div id="container_body">
	        <div id="right_rank" class="body_div"><jsp:include page="today_ranking.jsp"></jsp:include></div>
	        <div id="left_rank" class="body_div"><jsp:include page="cat_ranking.jsp"></jsp:include></div>
	        <div id="tag_rank" class="body_div"><jsp:include page="tag_ranking.jsp"></jsp:include></div>
	        <div id="new_rank" class="body_div"></div>
	        <div id="board_new" class="body_div"></div>
	        
	        <!-- 
	        <div id="right_rank" class="body_div"></div>
	        <div id="left_rank" class="body_div"></div>
	         -->
		</div>
		
		<!-- <div id="leftbar">
			<p id="close">X</p>
		</div> -->
  	</div>
	<div id="footer">
		<p>풋터 부분입니다아ㅏㅇ아아아아</p>
		<p>폼잡는거 거지같다 ^ㅗ^</p>
		<p>project date : 20180509~</p>
	</div>

</body>
<script type="text/javascript">
  $(function(){
      
    $("#downul").hide();
   // $('#close').hide();
    
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
    
    
  
     
    
  });
  
 
</script>
</html>
