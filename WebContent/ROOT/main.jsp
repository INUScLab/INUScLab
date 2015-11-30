<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="StyleSheet.css">
	<script type="text/javascript" src="dtree.js"></script>
</head>
<body>
	<!--전체 태그-->
	<div id="main_page">
		<!--헤더 태그-->
		<div id="main_header">
			<div class="info_r">
				<div class="info_r_list">
					<a href="#" class="info_r_ADMIN">ADMIN</a>
					<a href="#" class="info_r_LOGOUT">LOGOUT</a>
					<a href="#" class="info_r_SETTING">SETTINGS</a>
					<a href="#" class="info_r_HELP">HELP</a>
				</div>
			</div>
			<div class="main_title">
				<!--title-->
				<h1>WATER FOOTPRINTS VISUALIZING WEB</h1>
				<!--메뉴 태그-->
				<div class="main_menu">
					<div class="main_menu_list">
						<a href="#" class="main_menu_HOME"><span>HOME</span></a>
						<a href="#" class="main_menu_MENU1"><span>MENU1</span></a>
						<a href="#" class="main_menu_MENU2"><span>MENU2</span></a>
					</div>
					<div class="main_logo_list">
						<img src="http://placehold.it/50x40" class="logo_istec">
						<img src="http://placehold.it/60x40" class="logo_sclab">
						<img src="http://placehold.it/40x40" class="logo_inu">
					</div>
					<div>
						<div class="timetable"><!--조회기간-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--본문-->
		<div id="main_content">
			<!--본문 Left (tree)-->
			<div class="tree_section_box">
			<!--Tree-->
				<jsp:include page="treemenu.jsp" flush="false"/>
			</div>
			<!--본문 Right top (graph)-->
			<div class="graph_section_box">
				<jsp:include page="control.jsp" flush="false">
					<jsp:param name="action" value="list" />
				</jsp:include>
			</div>
			<!--본문 Right top (service)-->
			<div class="service_section_box">
				<div class="leak">누수경보</div>
				<div class="freeze">동파예보</div>
				<div class="absence">부재중 알림</div>
				<div class="service">부가서비스</div>
			</div>
			<!--본문 Right bottom (map)-->
			<div class="map_section_box">
				<!--Map Section-->
				<jsp:include page="googlemap.jsp" flush="false"/>
			</div>
		</div> 
		<!--footer-->
		<div id="footer"><a href="https://sites.google.com/site/uisclab" target="_blank">© SCLAB. ALL RIGHTS RESERVED.</a></div>

	</div>
</body>
</html>