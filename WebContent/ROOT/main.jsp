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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="dtree.js"></script>
<script type="text/javascript" src="googlemap.js"></script>
<jsp:useBean id="User" class="sclab.db.User" />
<jsp:useBean id="abnormalDongCtrl" class="sclab.db.AbnormalDongCtrl" />
<jsp:useBean id="UserConsumption" class="sclab.db.UserConsumption" />
<jsp:useBean id="UserConsumptionCtrl" class="sclab.db.UserConsumptionCtrl" />
<jsp:useBean id="GuDongLatLng" class="sclab.db.GuDongLatLng" />
<jsp:useBean id="GuDongLatLngCtrl" class="sclab.db.GuDongLatLngCtrl" />
<jsp:useBean id="DongSummuryReport" class="sclab.db.DongSummuryReport" />
<jsp:useBean id="UserSummuryReport" class="sclab.db.UserSummuryReport" />
<jsp:useBean id="DongSummuryReportCtrl" class="sclab.db.DongSummuryReportCtrl" />
<jsp:useBean id="UserSummuryReportCtrl" class="sclab.db.UserSummuryReportCtrl" />


<%
	ArrayList<String> overUsedDongList = abnormalDongCtrl.getOverUsedDongList();
	ArrayList<String> normalUsedDongList = abnormalDongCtrl.getNormalDongList();
	ArrayList<String> leakDongList = abnormalDongCtrl.getLeakDongList();
	ArrayList<String> absenceDongList = abnormalDongCtrl.getAbsenceDongList();
	ArrayList<String> freezedDongList = abnormalDongCtrl.getFreezeDongList();
	ArrayList<UserConsumption> userConsumptionList = UserConsumptionCtrl.getUSerConsumption();
	ArrayList<GuDongLatLng> guDongLatLngList = GuDongLatLngCtrl.getGuDongLatLngList();
	ArrayList<DongSummuryReport> dongSummuryReportList = DongSummuryReportCtrl.getDongSummuryReportList();
	ArrayList<UserSummuryReport> userSummuryReportList = UserSummuryReportCtrl.getUserSummuryReportList();
%>

<script type="text/javascript">	
	var overUsedDongList = new Array();
	var normalUsedDongList = new Array();
	var leakDongList = new Array();
	var absenceDongList = new Array();
	var freezedDongList = new Array();
	var userConsumptionList = new Array();
	var guDongLatLngList = new Array();
	var dongSummuryReportList = new Array();
	var userSummuryReportList = new Array();
	
	<% for (int i=0; i<overUsedDongList.size(); i++) { %>
	overUsedDongList[<%= i %>] = "<%= overUsedDongList.get(i) %>"; 
	<% } %>
	
	<% for (int i=0; i<normalUsedDongList.size(); i++) { %>
	normalUsedDongList[<%= i %>] = "<%= normalUsedDongList.get(i) %>"; 
	<% } %>
	
	<% for (int i=0; i<leakDongList.size(); i++) { %>
	leakDongList[<%= i %>] = "<%= leakDongList.get(i) %>"; 
	<% } %>
	
	<% for (int i=0; i<absenceDongList.size(); i++) { %>
	absenceDongList[<%= i %>] = "<%= absenceDongList.get(i) %>"; 
	<% } %>
	
	<% for (int i=0; i<freezedDongList.size(); i++) { %>
	freezedDongList[<%= i %>] = "<%= freezedDongList.get(i) %>"; 
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
	
	<% for (int i=0; i < dongSummuryReportList.size(); i++) { %>
	dongSummuryReportList.push( {
		guGun:"<%= dongSummuryReportList.get(i).getGuGun() %>",
		umDong:"<%= dongSummuryReportList.get(i).getUmDong() %>",
		monthAverage:"<%= dongSummuryReportList.get(i).getMonthAverage() %>",
		latelyLeak:"<%= dongSummuryReportList.get(i).getLatelyLeak() %>",
		day1:"<%= dongSummuryReportList.get(i).getDay1() %>",
		day2:"<%= dongSummuryReportList.get(i).getDay2() %>",
		day3:"<%= dongSummuryReportList.get(i).getDay3() %>",
		day4:"<%= dongSummuryReportList.get(i).getDay4() %>",
		day5:"<%= dongSummuryReportList.get(i).getDay5() %>",
		day6:"<%= dongSummuryReportList.get(i).getDay6() %>",
		day7:"<%= dongSummuryReportList.get(i).getDay7() %>",
	});
	<% } %>
	
	<% for (int i=0; i < userSummuryReportList.size(); i++) { %>
	userSummuryReportList.push( {
		guGun:"<%= userSummuryReportList.get(i).getGuGun() %>",
		umDong:"<%= userSummuryReportList.get(i).getUmDong() %>",
		monthAverage:"<%= userSummuryReportList.get(i).getMonthAverage() %>",
		latelyLeak:"<%= userSummuryReportList.get(i).getLatelyLeak() %>",
		day1:"<%= userSummuryReportList.get(i).getDay1() %>",
		day2:"<%= userSummuryReportList.get(i).getDay2() %>",
		day3:"<%= userSummuryReportList.get(i).getDay3() %>",
		day4:"<%= userSummuryReportList.get(i).getDay4() %>",
		day5:"<%= userSummuryReportList.get(i).getDay5() %>",
		day6:"<%= userSummuryReportList.get(i).getDay6() %>",
		day7:"<%= userSummuryReportList.get(i).getDay7() %>",
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
						<!--li role="presentation">
							<a href="main.jsp?MENU_NUM=2"><span>ALERT</span></a>
						</li>
						<li role="presentation">
							<a href="main.jsp?MENU_NUM=3"><span>SERVICE</span></a-->
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