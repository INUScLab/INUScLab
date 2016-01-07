<%@ page language="java" import="sclab.db.*, java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/headerCSS.css">
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&region=KR"></script>
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
<%
	String test = "용현3동";
	ArrayList<String> overUsedDongList = MapCtrl.getOverUsedDongList();
	ArrayList<String> normalUsedDongList = MapCtrl.getNormalDongList();
	System.out.println(overUsedDongList.indexOf("용현3동"));
	//System.out.println(overUsedDongList);
	//System.out.println(normalUsedDongList.size());
%>

<script type="text/javascript">	
	var overUsedDongList = new Array();
	var normalUsedDongList = new Array();
	
	<% for (int i=0; i<overUsedDongList.size(); i++) { %>
	overUsedDongList[<%= i %>] = "<%= overUsedDongList.get(i) %>"; 
	<% } %>
	
	<% for (int i=0; i<normalUsedDongList.size(); i++) { %>
	normalUsedDongList[<%= i %>] = "<%= normalUsedDongList.get(i) %>"; 
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