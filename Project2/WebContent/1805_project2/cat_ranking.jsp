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
  
  
  <div id="illust" class="tabcontent">
  <%
  IllBoardDao ibd = new IllBoardDao();
  ArrayList<IllboardVo> ilist = ibd.likeIllBoard();
  
  for(int j = 0 ; j < 3 ; j++){
  %>
   	<div class="rank_ill"  onclick="location.href='hitsUpOk.jsp?boardnum=<%=ilist.get(j).getIboardnum() %>&category=ill';">
   		<div id="ill1"><img src="<%=ilist.get(j).getIboardimg() %>" alt="일러1위" width="100%"/></div>
   		<p id="rank_title"><%=ilist.get(j).getIboardtitle() %></p>
   		<p id="rank_user"><%=ilist.get(j).getIboardwriter() %></p>
   	</div>
<%} //for end %>
  </div>
  
  
  <div id="cartoon" class="tabcontent">
  <%
  ToonBoardDao tbd = new ToonBoardDao();
  ArrayList<ToonboardVo> tlist = tbd.likeToonBoard();
  for(int j = 0 ; j< 3; j++){
   %>
    <div class="rank_toon" onclick="location.href='hitsUpOk.jsp?boardnum=<%=tlist.get(j).getTboardnum()%>&category=toon';">
    	<div id="toon1"><img src="<%=tlist.get(j).getTboardimg() %>" alt="카툰1위" width="100%"/></div>
   		<p id="rank_title"><%=tlist.get(j).getTboardtitle() %></p>
   		<p id="rank_user"><%=tlist.get(j).getTboardwriter() %></p>
    </div>
   <%}//for end %>
  </div>
  
  <div id="parady" class="tabcontent">
  <%
  	PrdBoardDao pbd = new PrdBoardDao();
  	ArrayList<PrdboardVo> plist = pbd.likePrdBoard(); 	
  	
  	for(int j = 0; j < 3 ; j++){
  %>
    <div class="rank_prdy"  onclick="location.href='hitsUpOk.jsp?boardnum=<%=plist.get(j).getPboardnum()%>&category=prd';">
    	<div id="par1"><img src="<%=plist.get(j).getPboardimg() %>" alt="패ㅓ디1위" width="100%"/></div>
   		<p id="rank_title"><%=plist.get(j).getPboardtitle() %></p>
   		<p id="rank_user"><%=plist.get(j).getPboardwriter()%></p>
    </div>
    <%}//for end %>
  </div>
  
  
  <div id="tab_etc" class="tabcontent">
  <%
  	EtcBoardDao ebd = new EtcBoardDao();
  	ArrayList<EtcboardVo> elist = new ArrayList<>();
  	elist = ebd.likeEtcBoard();
  	//out.print(elist.get(0));
  	for(int j =0 ; j<3 ; j++){
  	%>
  	<div class="rank_etc" onclick="location.href='hitsUpOk.jsp?boardnum=<%=elist.get(j).getEboardnum()%>&category=etc';" >
  		<div id="etc1"><img src="<%=elist.get(j).getEboardimg() %>" alt="기타1위" width="100%" /></div>
   		<p id="rank_title"><%=elist.get(j).getEboardtitle() %></p>
   		<p id="rank_user"><%=elist.get(j).getEboardwriter() %></p>
  	</div>
  	<%}//for end 
  	%>
  	
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
 