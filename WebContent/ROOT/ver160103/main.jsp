<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<script type="text/javascript" src="http://maps.google.com/maps/api/js?libraries=places&sensor=false"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&region=KR"></script>
<script type="text/javascript" src="googlemap.js"></script>
<script type="text/javascript" src="dtree.js"></script>
<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
}

.controls {
	margin-top: 10px;
	border: 1px solid transparent;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 32px;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 300px;
}

#pac-input:focus {
	border-color: #4d90fe;
}

.pac-container {
	font-family: Roboto;
}

#type-selector {
	color: #fff;
	background-color: #4d90fe;
	padding: 5px 11px 0px 11px;
}

#type-selector label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}
</style>
<title>Places Searchbox</title>
<style>
#target {
	width: 345px;
}
</style>
</head>
<body>
	<!--전체 태그-->
	<div id="main_page">
		<!--헤더 태그-->
		<div id="main_header">
			<div class="info_r">
				<div class="info_r_list">
					<a href="#" class="info_r_ADMIN">ADMIN</a> <a href="#"
						class="info_r_LOGOUT">LOGOUT</a> <a href="#"
						class="info_r_SETTING">SETTINGS</a> <a href="#"
						class="info_r_HELP">HELP</a>
				</div>
			</div>
			<div class="main_title">
				<!--title-->
				<h1>WATER FOOTPRINTS VISUALIZING WEB</h1>
				<!--메뉴 태그-->
				<nav class="main_menu">
					<ul class="nav main_menu_list">
						<li role="presentation" class="active"><a href="#"><span>MAP</span></a>
						</li>
						<li role="presentation"><a href="#"><span>ALERT</span></a></li>
						<li role="presentation"><a href="#"><span>REPORT</span></a></li>
						<li role="presentation"><a href="#"><span>SERVICE</span></a>
						</li>
					</ul>
					<ul class="main_logo_list">
						<img src="http://placehold.it/50x40" class="logo_istec">
						<img src="http://placehold.it/60x40" class="logo_sclab">
						<img src="http://placehold.it/40x40" class="logo_inu">
					</ul>
				</nav>
				<div>
					<div class="timetable">
						<!--조회기간-->
					</div>
				</div>
			</div>
		</div>
		<!--본문-->
		<div id="main_content">
			<!--본문 Left (tree)-->
			<div class="tree_section_box">
				<div class="tree">
					<jsp:include page="treemenu.jsp" flush="false" />
				</div>
			</div>
			<!--본문 Right bottom (map)-->
			<div class="map_section_box">
				<jsp:include page="googlemap.jsp" flush="false" />
				<!--<jsp:include page="control.jsp" flush="false">
						<jsp:param name="action" value="list" />
				</jsp:include>-->
			</div>
		</div>
		<!--footer-->
		<div id="footer">
			<a href="https://sites.google.com/site/uisclab" target="_blank">©ScLab. All rights reserved.</a>
		</div>

	</div>
</body>
</html>