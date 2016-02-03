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
				<option value="ungjin">옹진군</option>
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

<div class="left_section_box_init" id="left_section_box_init" >

	<div class="init_info init_all_info">
		<div class="init_info_sub">
			<img alt="전체 아이콘" src="./img/combine.png"/>
			<h2>[전체]</h2>
		</div>
		<ul id="init_entire_text">
			<li>전체 동 개수 : 221동 </li>
			<li>전체 사용자 수 : 1000명 </li>
		</ul>
	</div>
	<div class="init_info init_leak_info">
		<div class="init_info_sub">
			<img alt="누수 아이콘" src="./img/leak.png"/>
			<h2>[누수 경보]</h2>
		</div>
		<ul id="init_leak_text">
			<li>누수 동 개수 : 4동 </li>
			<li>누수 사용자 수 : 4개 </li>
		</ul>
	</div>
	<div class="init_info init_freezed_info">
		<div class="init_info_sub">
			<img alt="동파 아이콘" src="./img/freezed.png"/>
			<h2>[동파 경보]</h2>
		</div>
		<ul id="init_freezed_text">
			<li>동파 동 개수 : 5동</li>
			<li>동파 사용자 수 : 5명</li>
		</ul>
	</div>
	<div class="init_info init_absence">
		<div class="init_info_sub">
			<img alt="부재중 알람 아이콘" src="./img/absence.png"/>
			<h2>[부재중 알람]</h2>
		</div>
		<ul id="init_absence_text">
			<li>부재중 알람 동 개수 : 4동</li>
			<li>부재중 알람 사용자 수 : 4명</li>
		</ul>
	</div>
</div>




<div class="left_section_box2" id="left_section_box2">
	<div class="info_date" id="info_date"></div>
	<div class="info_icon">
		<div class="info_wrapper">
			<input type="checkbox"  id="checkBox_leak" class="checkBox" >
			<div id ="check_leak" class="checkbox_text"></div>
		</div>
		<div class="info_wrapper">
			<input type="checkbox" id="checkBox_freezed" class="checkBox" >
			<div id="check_freezed" class="checkbox_text"></div>
		</div>
		<div class="info_wrapper">
			<input type="checkbox"  id="checkBox_absence" class="checkBox" > 
			<div id="check_absence" class="checkbox_text"></div>
		</div>
	</div>
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

