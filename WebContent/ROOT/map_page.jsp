<!--본문 Right (map)-->
<div class="map_section_box">
	<div id="map_canvas" style="width: 100%; height: 100%;"></div>
	<input id="pac-input" class="controls" type="text"
		placeholder="Search Box" onkeypress="if(event.keyCode==13) {codeAddress();}">
	<div id="color-interpolation" class="color-interpolation"></div>
</div>
<!--본문 Left (tree)-->
<div class="left_section_box">
	<div class="tree_section_box">
		<div class="tree">
			<jsp:include page="treemenu.jsp" flush="false" />
		</div>
	</div>
	<div class="graph_section_box">
		<hr>
		<div id="info_graph" class="graph"></div>
		<button id="btn_detail">상세 보기</button>
	</div>

</div>

<div class="left_section_box2">
	<div class="info_date">날짜</div>
	<div class="info_graph">그래프</div>
	<div class="info_history">1주일 history</div>
	<div class="info_service">부가서비스</div>
</div>