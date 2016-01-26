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
			<ul>
				<li><a href="#" onclick="swap('si_label');return false;">시</a>
					<ul id="si_label" style="display: none;">
				
					</ul>
				</li>
			</ul>
		</div>
		<div id="address_label" class="address_label">
			<ul>
				<li><a href="#" onclick="swap('gu_label');return false;">구/군</a>
					<ul id="gu_label" style="display: none;">
		
					</ul>
				</li>
			</ul>
		</div>
		<div id="address_label" class="address_label">
			<ul>
				<li><a href="#" onclick="swap('dong_label');return false;">읍/면/동</a>
					<ul id="dong_label" style="display: none;">
		
					</ul>
				</li>
			</ul>
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