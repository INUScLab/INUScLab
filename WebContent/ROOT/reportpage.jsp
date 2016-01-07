<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Report</title>
<link rel="stylesheet" type="text/css" href="css/headerCSS.css">
<link rel="stylesheet" type="text/css" href="css/reportpage.css">


</head>
<body>
	<!--전체 태그-->
	<div class="wrapper">
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
					<li role="presentation"><a href="#"><span>SERVICE</span></a></li>
				</ul>
				<ul class="main_logo_list">
					<img src="http://placehold.it/50x40" class="logo_istec">
					<img src="http://placehold.it/60x40" class="logo_sclab">
					<img src="http://placehold.it/40x40" class="logo_inu">
				</ul>
				</nav>
			</div>
		</div>

		<!--본문태그-->
		<div id="report_content">
			<div class="report_info">
				<jsp:include page="report_graph.jsp" flush="false" />
				<ul>
					<li class="info">
						<div id="today_chart"></div>
						<h1>today</h1>
					</li>
					<li class="info">
						<div id="weekly_chart"></div>
						<h1>weekly</h1>
					</li>
					<li class="info">
						<div id="monthly_chart"></div>
						<h1>monthly</h1>
					</li>
				</ul>
			</div>

			<div class="table">
				<jsp:include page="table.jsp" flush="false" />
			</div>

			<div id="history">
				<jsp:include page="report_graph_history.jsp" flush="false" />
			</div>


		</div>

		<!--footer-->
		<div id="footer">
			<a href="https://sites.google.com/site/uisclab" target="_blank">©
				ScLab. All rights reserved.</a>
		</div>

	</div>

</body>
</html>