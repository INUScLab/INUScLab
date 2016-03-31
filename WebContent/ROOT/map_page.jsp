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
		
		<div class="icon" onMouseOver="this.style.cursor='pointer'">
			<img class="img_icon img_reverse" id="img_reverse"
				onclick="reverse_clicked('img_reverse')">
		</div>
		<div class="icon" onMouseOver="this.style.cursor='pointer'">
			<img class="img_icon img_fat" id="img_fat"
				onclick="fat_clicked('img_fat')">
		</div>
		<div class="icon" onMouseOver="this.style.cursor='pointer'">
			<img class="img_icon img_breakage" id="img_breakage"
				onclick="breakage_clicked('img_breakage')">
		</div>
	</div>
	<div id="map_canvas" style="width: 100%; height: 95%;"></div>
	<div id="color-interpolation" class="color-interpolation"></div>
</div>
<!--본문 Left (tree)-->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>

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
	<div class="init_info init_reverse">
		<div class="init_info_sub">
			<img alt="전체 아이콘" src="./img/reverse.png"/>
			<h2>[역류]</h2>
		</div>
		<ul id="init_reverse_text">
			<li>역류 동 개수 : 221동 </li>
			<li>역류 사용자 수 : 1000명 </li>
		</ul>
	</div>
	<div class="init_info init_fat">
		<div class="init_info_sub">
			<img alt="전체 아이콘" src="./img/fat.png"/>
			<h2>[비만관]</h2>
		</div>
		<ul id="init_fat_text">
			<li>비만관 동 개수 : 221동 </li>
			<li>비만관 사용자 수 : 1000명 </li>
		</ul>
	</div>
	<div class="init_info init_breakage">
		<div class="init_info_sub">
			<img alt="전체 아이콘" src="./img/breakage.png"/>
			<h2>[파손]</h2>
		</div>
		<ul id="init_breakage_text">
			<li>파손 동 개수 : 221동 </li>
			<li>파손 사용자 수 : 1000명 </li>
		</ul>
	</div>
</div>




