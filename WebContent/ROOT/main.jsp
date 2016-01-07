<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/headerCSS.css">
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&region=KR"></script>
<script type="text/javascript" src="googlemap.js"></script>
<script type="text/javascript" src="dtree.js"></script>
</head>
<body onload="initialize(0, 0)">
	<!--전체 태그-->
	<div id="main_page">
		<!--헤더 태그-->
		<div id="main_header">
			<nav class="info_r">
				<!--title-->
				<h1>WATER FOOTPRINTS VISUALIZING WEB</h1>
				<!--메뉴 태그-->
				<div class="info_r_list">
					<a href="#" class="info_r_ADMIN">ADMIN</a>
					<a href="#"	class="info_r_LOGOUT">LOGOUT</a>
					<a href="#"	class="info_r_SETTING">SETTINGS</a>
					<a href="#"	class="info_r_HELP">HELP</a>
				</div>
			</nav>
			<div class="main_title">
				<nav class="main_menu">
					<ul class="nav main_menu_list">
						<li role="presentation" class="active"><a href="#"><span>MAP</span></a> </li>
						<li role="presentation"><a href="#"><span>ALERT</span></a> </li>
						<li role="presentation"><a href="#"><span>REPORT</span></a> </li>
						<li role="presentation"><a href="#"><span>SERVICE</span></a> </li>
					</ul>
					<ul class="main_logo_list">
						<img src="http://placehold.it/50x40" class="logo_istec">
						<img src="http://placehold.it/60x40" class="logo_sclab">
						<img src="img/inu.jpg" class="logo_inu">
					</ul>
				</nav>
			</div>
		</div>
		<!--본문-->
		<div id="main_content">
			<!--본문 Right bottom (map)-->
			<div class="map_section_box">
				<jsp:include page="googlemap.jsp" flush="false" />
				<!--
				<jsp:include page="control.jsp" flush="false">
					<jsp:param name="action" value="list" />
				</jsp:include>
				-->
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
		</div>
		<!--footer-->
		<div id="footer">
			<a href="https://sites.google.com/site/uisclab" target="_blank">©ScLab. All rights reserved.</a>
		</div>

	</div>
</body>
</html>