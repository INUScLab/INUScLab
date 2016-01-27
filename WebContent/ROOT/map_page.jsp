﻿<!--본문 Right (map)-->
<div class="map_section_box">
	<div id="map_controll_box" class="map_controll_box">
		<div class="wrapper_search_box">
			<input id="pac-input" class="controls" type="text"
				placeholder="Search Box"
				onkeypress="if(event.keyCode==13) {codeAddress();}">
			<button class="search_button" onclick="codeAddress();">검색</button>
		</div>

		<div id="address_label" class="address_label">
			<select name="si" id="si_select">
				<!--  <option value="">시</option> -->
				<option value="incheon">인천광역시</option>
			</select>
		</div>
		<div id="address_label" class="address_label">
			<select name="guGun" id="guGun_select" >
				<option value="">구/군</option>
				<option value="ganghwa">강화군</option>
				<option value="gyeyang">계양구</option>
				<option value="nam">남구</option>
				<option value="namdong">남동구</option>
				<option value="dong">동구</option>
				<option value="bupyeong">부평구</option>
				<option value="seo">서구</option>
				<option value="yeonsu">연수구</option>
				<option value="ungjin">웅진군</option>
				<option value="zung">중구</option>
			</select>
		</div>
		<div id="address_label" class="address_label">
			<select name="umDong" id="umDong_select" >
				<option value="">읍/면/동</option>
				
			</select>
		</div>
	</div>
	<div id="map_canvas" style="width: 100%; height: 100%;"></div>
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
		<div class="info_leak" id="info_leak">
			<div class="leak_text" id="leak_text"></div>
			<div class="leak_graph" id="leak_graph"></div>
		</div>
		<div class="info_absence" id="info_absence">
			<div class="absence_text" id="absence_text"></div>
			<div class="absence_graph" id="absence_graph"></div>
		</div>
	</div>
</div>