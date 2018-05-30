<%@page import="vo.EtcboardVo"%>
<%@page import="dao.EtcBoardDao"%>
<%@page import="vo.PrdboardVo"%>
<%@page import="dao.PrdBoardDao"%>
<%@page import="vo.IllboardVo"%>
<%@page import="dao.IllBoardDao"%>
<%@page import="vo.ToonboardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ToonBoardDao"%>
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
  <%
  IllBoardDao ibd = new IllBoardDao();
  ArrayList<IllboardVo> ilist = ibd.likeIllBoard();
  %>
  <div id="illust" class="tabcontent">
   	<div class="rank_ill" >
   		<div id="ill1">
   		<img src="" alt="일러1위" width="100%"/>
   		</div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
   	</div>
   	<div id="ill2" class="rank_ill" >
   		<div id="ill1"><img src="" alt="일러2위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
   	</div>
   	<div id="ill3" class="rank_ill">
   		<div id="ill1"><img src="" alt="일러3위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
   	</div>
  </div>
  <%
  //toonboard 인기순정렬 불러오기
  ToonBoardDao tbd = new ToonBoardDao();
  ArrayList<ToonboardVo> tlist = tbd.likeToonBoard();
   %>
  <div id="cartoon" class="tabcontent">
    <div class="rank_toon" >
    	<div id="toon1"><img src="" alt="카툰1위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
    </div>
    <div id="toon2" class="rank_toon"  >
    	<div id="toon1"><img src="" alt="카툰2위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
    </div>
    <div id="toon3" class="rank_toon"  >
    	<div id="toon1"><img src="" alt="카툰3위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
    </div>
  </div>
  
  <%
  	PrdBoardDao pbd = new PrdBoardDao();
  	ArrayList<PrdboardVo> plist = pbd.likePrdBoard(); 	
  	
  %>
  <div id="parady" class="tabcontent">
    <div class="rank_prdy"  >
    	<div id="par1"><img src="" alt="패ㅓ디1위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
    </div>
    <div id="par2" class="rank_prdy" >
    	<div id="par1"><img src="" alt="패러디2위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
    </div>
    <div id="par3" class="rank_prdy" >
    	<div id="par1"><img src="" alt="패러디3위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
    </div>
  </div>
  
  
  <%
  	EtcBoardDao ebd = new EtcBoardDao();
  	ArrayList<EtcboardVo> elist = new ArrayList<>();
  	elist = ebd.likeEtcBoard();
  %>
  <div id="tab_etc" class="tabcontent">
  	<div class="rank_etc" >
  		<div id="etc1"><img src="" alt="기타1위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
  	</div>
  	<div id="etc2" class="rank_etc" >
  		<div id="etc1"><img src="" alt="기타2위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
  	</div>
  	<div id="etc3" class="rank_etc">
  		<div id="etc1"><img src="" alt="기타3위" width="100%"/></div>
   		<p id="rank_title"></p>
   		<p id="rank_user"></p>
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
 