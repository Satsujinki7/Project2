<%@page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!-- project 폴더의 cat_ranking -->
<link rel="stylesheet" href="cat_rank.css" />
<div id="right_wrap">
  <div class="tab">
    <button class="tablinks" onclick="openTab(event, 'illust')">일러스트</button>
    <button class="tablinks" onclick="openTab(event, 'cartoon')">만화</button>
    <button class="tablinks" onclick="openTab(event, 'parady')">2차창작</button>
    <button class="tablinks" onclick="openTab(event, 'tab_etc')">기타</button>
  </div>
  
  <div id="illust" class="tabcontent">
   	<div class="rank_ill">
   		<div id="ill1"><img src="../images/widepika.JPG" alt="일러1위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
   	</div>
   	<div id="ill2" class="rank_ill">
   		<div id="ill1"><img src="../images/widepika.JPG" alt="일러2위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
   	</div>
   	<div id="ill3" class="rank_ill">
   		<div id="ill1"><img src="../images/widepika.JPG" alt="일러3위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
   	</div>
  </div>
  
  <div id="cartoon" class="tabcontent">
    <div class="rank_toon">
    	<div id="toon1"><img src="../images/heightpika.JPG" alt="카툰1위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
    </div>
    <div id="toon2" class="rank_toon">
    	<div id="toon1"><img src="../images/heightpika.JPG" alt="카툰2위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
    </div>
    <div id="toon3" class="rank_toon">
    	<div id="toon1"><img src="../images/heightpika.JPG" alt="카툰3위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
    </div>
  </div>
  
  <div id="parady" class="tabcontent">
    <div class="rank_prdy">
    	<div id="par1"><img src="../images/kimino.JPG" alt="패ㅓ디1위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
    </div>
    <div id="par2" class="rank_prdy">
    	<div id="par1"><img src="../images/kimino.JPG" alt="패러디2위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
    </div>
    <div id="par3" class="rank_prdy">
    	<div id="par1"><img src="../images/kimino.JPG" alt="패러디3위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
    </div>
  </div>
  
  <div id="tab_etc" class="tabcontent">
  	<div class="rank_etc">
  		<div id="etc1"><img src="../images/kobugi.jpg" alt="기타1위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
  	</div>
  	<div id="etc2" class="rank_etc">
  		<div id="etc1"><img src="../images/kobugi.jpg" alt="기타2위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
  	</div>
  	<div id="etc3" class="rank_etc">
  		<div id="etc1"><img src="../images/kobugi.jpg" alt="기타3위" width="100%"/></div>
   		<p id="rank_title">게시글제목</p>
   		<p id="rank_user">작성자</p>
  	</div>
  </div>
</div>
<script>
window.onload = function () {
  openTab(event, 'illust');
  console.log("카테고리별 랭킹도 잘 나오남...?");
}//onload end

function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
 