<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="today_rank.css" />

<div id="today_container">
	<div class="slideshow-container">
		<div class="mySlides fade">
		  <div class="numbertext">1 / 3</div>
		 <div class="img_container">
			  <img src="../images/pika.jpg"  class="img" id="img1">
		  </div> 
		  <div class="text">Caption Text</div>
		</div>
	
		<div class="mySlides fade">
		  <div class="numbertext">2 / 3</div>
		  <div class="img_container">
			  <img src="../images/kimino.JPG"  class="img" id="img2">
		  </div>
		  <div class="text">Caption Two</div>
		</div>
	
		<div class="mySlides fade">
		  <div class="numbertext">3 / 3</div>
		  <div class="img_container">
			  <img src="../images/kobugi.jpg" class="img" id="img3"> 
		  </div>
		  <div class="text">Caption Three</div>
		</div>
	
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<a class="next" onclick="plusSlides(1)">&#10095;</a>
	
	</div>
    <!-- <br> -->	
	<div style="text-align:center">
	  <span class="dot" onclick="currentSlide(1)"></span> 
	  <span class="dot" onclick="currentSlide(2)"></span> 
	  <span class="dot" onclick="currentSlide(3)"></span> 
	</div>
</div>
 
<script>

  var slideIndex;

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

window.onload = function () {
  slideIndex = 1;
  showSlides(slideIndex);
  console.log("todaylanking 실행됩니꽈 - ");
}//onload end
function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  
    //이미지 크기조정자!!!! ㅠㅠ시뱅
  var divRate = 620/480;
    var image;
    if(slideIndex ==1){
    image= document.getElementById("img1");
    }else if(slideIndex==2){
      image= document.getElementById("img2");
    }else if(slideIndex==3){
      image= document.getElementById("img3");
    }

  var width=image.offsetWidth;
  var height=image.offsetHeight;  
  var imgRate = width / height;
  
  //가로가 더 길다면
  if(divRate < imgRate){
    image.style.width="100%";
    height=image.offsetHeight; 
	var marginsize = (480 - height)/2;
    image.style.marginTop=marginsize +"px";
    image.style.marginBottom=marginsize +"px";
  }else {
    image.style.height="100%";
    width=image.offsetWidth;
    image.style.marginLeft=(310-width/2)+"px";
    image.style.marginRight=(310-width/2)+"px";
  }
  dots[slideIndex-1].className += " active";
}
</script>

