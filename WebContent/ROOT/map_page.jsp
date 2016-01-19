<!--본문 Right (map)-->
<div class="map_section_box">
	<div id="map_controll_box" class="map_controll_box">
		<a href="#"  class="current_address" style>
			<h1>인천광역시 연수구 송도동 </h1>
			<span class="spm spm_smore">현재주소 변경 레이어 열기</span>
		</a>
		<input id="pac-input" class="controls" type="text" placeholder="Search Box" onkeypress="if(event.keyCode==13) {codeAddress();}">
	</div>
	<div id="map_canvas" style="width: 100%; height: 94%;"></div>
	<div id="color-interpolation" class="color-interpolation"></div>
</div>
<!--본문 Left (tree)-->
<div class="left_section_box">
	<div class="tree_section_box">
		<div class="tree">
			<jsp:include page="treemenu.jsp" flush="false" />
		</div>
	</div>

</div>

<div class="left_section_box2">
	<div class="info_date" id="info_date"></div>
	<div class="info_graph" id="info_graph"></div>
	<div class="info_history" id="info_history"></div>
	<div class="info_service" id="info_service">
	<div>
		<div id="info_leak"> </div>
		<div id="info_absence" ></div>
	</div>
	</div>
</div>