<!--본문 Right (map)-->
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
			<select name="guGun" id="guGun_select">
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
			<select name="umDong" id="umDong_select">
				<option value="">읍/면/동</option>
			</select>
		</div>
		<div class="icon" onMouseOver="this.style.cursor='pointer'">
			<img class=" img_icon img_entire " id="img_entire"
				onclick="entire_clicked('img_entire')">
		</div>
		<div class="icon" onMouseOver="this.style.cursor='pointer'">
			<img class="img_icon img_leak" id="img_leak"
				onclick="leak_clicked('img_leak')">
		</div>
		<div class="icon" onMouseOver="this.style.cursor='pointer'">
			<img class="img_icon img_freezed " id="img_freezed"
				onclick="freezed_clicked('img_freezed')">
		</div>
		<div class="icon" onMouseOver="this.style.cursor='pointer'">
			<img class="img_icon img_absence" id="img_absence"
				onclick="absence_clicked('img_absence')">
		</div>
	</div>
	<div id="map_canvas" style="width: 100%; height: 95%;"></div>
	<div id="color-interpolation" class="color-interpolation"></div>
</div>
<!--본문 Left (tree)-->

<div class="left_section_box2">
	<div class="info_date" id="info_date"></div>
	<div class="info_icon"></div>
	
	<div class="info_graph" id="info_graph">
		<div class="leak_icon" id="leak_icon">
		</div>
		<div class="leak_info" id="leak_info"></div>
	</div>
	
	<div class="info_history" id="info_history">
		<div class="freeze_icon" id="freeze_icon">
		</div>
		<div class="freeze_info" id="freeze_info"></div>
	</div>
	
	<div class="info_service" id="info_service">
		<div class="info_leak" id="info_leak">
			<div class="leak_text" id="leak_text"></div>
			<div class="leak_graph" id="leak_graph">
			</div>
		</div>
		<div class="info_absence" id="info_absence">
			<div class="absence_text" id="absence_text"></div>
			<div class="absence_graph" id="absence_graph"></div>
		</div>
		<div class="info_freezed" id="info_freezed">
			<div class="freeze_text" id="freeze_text"></div>
			<div class="freeze_graph" id="freeze_graph"></div>
		</div>
	</div>
</div>