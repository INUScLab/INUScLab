<%@ page language="java" import="sclab.db.*, java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/headerCSS.css">
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<link rel="stylesheet" type="text/css" href="css/reportpage.css">
<link rel="stylesheet" type="text/css" href="css/dashboard_page.css">
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
<script type="text/javascript" src='https://www.google.com/jsapi?autoload={
	"modules":[{
		"name":"visualization",
		"version":"1",
		"packages":["corechart","controls","table"]
		}]
	}'>
</script>
<script type="text/javascript" src="dtree.js"></script>
<script type="text/javascript" src="googlemap.js"></script>
<jsp:useBean id="User" class="sclab.db.User" />
<jsp:useBean id="MapCtrl" class="sclab.db.MapCtrl" />
<jsp:useBean id="UserConsumption" class="sclab.db.UserConsumption" />
<jsp:useBean id="UserConsumptionCtrl" class="sclab.db.UserConsumptionCtrl" />
<jsp:useBean id="GuDongLatLng" class="sclab.db.GuDongLatLng" />
<jsp:useBean id="GuDongLatLngCtrl" class="sclab.db.GuDongLatLngCtrl" />
<jsp:useBean id="GuDongWeeks" class="sclab.db.GuDongWeeks" />
<jsp:useBean id="GuDongWeeksCtrl" class="sclab.db.GuDongWeeksCtrl" />


<%
	ArrayList<String> overUsedDongList = MapCtrl.getOverUsedDongList();
	ArrayList<String> normalUsedDongList = MapCtrl.getNormalDongList();
	ArrayList<UserConsumption> userConsumptionList = UserConsumptionCtrl.getUSerConsumption();
	ArrayList<GuDongLatLng> guDongLatLngList = GuDongLatLngCtrl.getGuDongLatLngList();
	ArrayList<GuDongWeeks> guDongWeeksList = GuDongWeeksCtrl.getGuDongWeeksList();
%>

<script type="text/javascript">	
	var overUsedDongList = new Array();
	var normalUsedDongList = new Array();
	var userConsumptionList = new Array();
	var guDongLatLngList = new Array();
	var guDongWeeksList = new Array();
	
	<% for (int i=0; i<overUsedDongList.size(); i++) { %>
	overUsedDongList[<%= i %>] = "<%= overUsedDongList.get(i) %>"; 
	<% } %>
	
	<% for (int i=0; i<normalUsedDongList.size(); i++) { %>
	normalUsedDongList[<%= i %>] = "<%= normalUsedDongList.get(i) %>"; 
	<% } %>
	
	<% for (int i=0; i<userConsumptionList.size(); i++) { %>
	userConsumptionList.push( {
		siGoon:"<%= userConsumptionList.get(i).getSiGoon() %>",
		umDong:"<%= userConsumptionList.get(i).getUmDong() %>",
		detail:"<%= userConsumptionList.get(i).getDetail() %>",
		lat:"<%= userConsumptionList.get(i).getLat() %>",
		lng:"<%= userConsumptionList.get(i).getLng() %>",
		consumed:"<%= userConsumptionList.get(i).getConsumed() %>",
		predicted:"<%= userConsumptionList.get(i).getPredicted() %>",
		leak:"<%= userConsumptionList.get(i).getLeak() %>",
		absence:"<%= userConsumptionList.get(i).getAbsence() %>",
		overused:"<%= userConsumptionList.get(i).getOverused() %>",
	});
	<% } %>
	
	<% for (int i=0; i<guDongLatLngList.size(); i++) { %>
	guDongLatLngList.push( {
		guGun:"<%= guDongLatLngList.get(i).getGuGun() %>",
		umDong:"<%= guDongLatLngList.get(i).getUmDong() %>",
		lat:"<%= guDongLatLngList.get(i).getLat() %>",
		lng:"<%= guDongLatLngList.get(i).getLng() %>",
	});
	<% } %>
	
	<% for (int i=0; i < guDongWeeksList.size(); i++) { %>
	guDongWeeksList.push( {
		guGun:"<%= guDongWeeksList.get(i).getGuGun() %>",
		umDong:"<%= guDongWeeksList.get(i).getUmDong() %>",
		day1:"<%= guDongWeeksList.get(i).getDay1() %>",
		day2:"<%= guDongWeeksList.get(i).getDay2() %>",
		day3:"<%= guDongWeeksList.get(i).getDay3() %>",
		day4:"<%= guDongWeeksList.get(i).getDay4() %>",
		day5:"<%= guDongWeeksList.get(i).getDay5() %>",
		day6:"<%= guDongWeeksList.get(i).getDay6() %>",
		day7:"<%= guDongWeeksList.get(i).getDay7() %>",
	});
	<% } %>
</script>
</head>
<!--body-->
<body onload="initialize(0, 0)">
	<!--전체 태그-->
	<div class="wrapper">
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
						<li role="presentation">
							<a href="main.jsp?MENU_NUM=0"><span>MAP</span></a>
						</li>
						<li role="presentation">
							<a href="main.jsp?MENU_NUM=1"><span>REPORT</span></a>
						</li>
						<li role="presentation">
							<a href="main.jsp?MENU_NUM=2"><span>ALERT</span></a>
						</li>
						<li role="presentation">
							<a href="main.jsp?MENU_NUM=3"><span>SERVICE</span></a>
						</li>
						<li role="presentation">
							<a href="main.jsp?MENU_NUM=4"><span>ANALYSIS</span></a>
						</li>
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
			<div id="included_contents"> 
				<%
					int num = 0;
					
					try {
						num = Integer.parseInt( request.getParameter("MENU_NUM") );
					}
					catch(Exception e) {}
					
					switch(num)
					{
						case 1:
							pageContext.setAttribute("MAIN_CONTENTS_PATH", "report_page.jsp");
							break;
						case 4:
							pageContext.setAttribute("MAIN_CONTENTS_PATH", "dashboard.jsp");
							break;
						default:
							pageContext.setAttribute("MAIN_CONTENTS_PATH", "map_page.jsp");
							break;
					}
				%>
				
				<jsp:include page="${MAIN_CONTENTS_PATH}" />
			</div>
		</div>
		<!--footer-->
		<div id="footer">
			<a href="https://sites.google.com/site/uisclab" target="_blank">©ScLab. All rights reserved.</a>
		</div>

	</div>
</body>
</html>