<!--본문 Right (map)-->
<div class="map_section_box">
	<div id="map_canvas" style="width: 100%; height: 100%;"> </div>
	<input id="pac-input" class="controls" type="text" placeholder="Search Box">
	<div id="color-interpolation" class="color-interpolation"></div>
</div>
<!--본문 Left (tree)-->
<div class="left_section_box">
	<div class="graph_section_box">
		<hr>
		<div id="info_graph" class="graph">
		</div>
		<button id="btn_detail">상세 보기</button>
	</div>
	<div class="tree_section_box">
		<div class="tree">
			<jsp:include page="treemenu.jsp" flush="false" />
		</div>
	</div>
</div>