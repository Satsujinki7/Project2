<%@page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<link rel="stylesheet" href="cat_rank.css" />
<div id="right_wrap">
  <div class="tab">
    <button class="tablinks" onclick="openTab(event, 'illust')">일러스트</button>
    <button class="tablinks" onclick="openTab(event, 'cartoon')">만화</button>
    <button class="tablinks" onclick="openTab(event, 'parady')">2차창작</button>
    <button class="tablinks" onclick="openTab(event, 'tab_etc')">기타</button>
  </div>
  
  <div id="illust" class="tabcontent">
    <h3>일러스트</h3>
    <p>일러스트 게시판 인기글이 나옵니다아아....</p>
  </div>
  
  <div id="cartoon" class="tabcontent">
    <h3>만화</h3>
    <p>만화 게시판 인기글이 나옵니다앙</p> 
  </div>
  
  <div id="parady" class="tabcontent">
    <h3>2차창작</h3>
    <p>2차 창작게시물 순위!!!</p>
  </div>
  
  <div id="tab_etc" class="tabcontent">
  <h3>기타등등</h3>
  <p>기타등등 게시판 랭킹 </p>
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
 