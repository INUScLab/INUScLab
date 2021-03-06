﻿<%@ page language="java" import="sclab.db.*, java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/mainpage.css">
<link rel="stylesheet" type="text/css" href="css/reportpage.css">
<link rel="stylesheet" type="text/css" href="css/dashboard_page.css">
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>

<script type="text/javascript" src='https://www.google.com/jsapi?autoload={
	"modules":[{
		"name":"visualization",
		"version":"1",
		"packages":["corechart","controls","table"]
		}] 
	}'>
</script>


<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="googlemap.js"></script>

<jsp:useBean id="DongInfo" class="sclab.db.DongInfo" />
<jsp:useBean id="DongInfoCtrl" class="sclab.db.DongInfoCtrl" />
<jsp:useBean id="SummaryReport" class="sclab.db.SummaryReport" />
<jsp:useBean id="SummaryReportCtrl" class="sclab.db.SummaryReportCtrl" />

<%
	ArrayList<DongInfo> dongInfoList = DongInfoCtrl.getDongInfoList();
	ArrayList<SummaryReport> summaryReportList = SummaryReportCtrl.getSummaryReportList();
%>
<script type="text/javascript">	
	var dongInfoList = new Array();
	
	<% for (int i=0; i<dongInfoList.size(); i++) { %>
	dongInfoList.push( {
		gu:"<%= dongInfoList.get(i).getGu() %>",
		dong:"<%= dongInfoList.get(i).getDong() %>",
		detail:"<%= dongInfoList.get(i).getLat() %>",
		lat:"<%= dongInfoList.get(i).getLat() %>",
		lng:"<%= dongInfoList.get(i).getLng() %>",
		leak:"<%= dongInfoList.get(i).getCount_leak() %>",
		absence:"<%= dongInfoList.get(i).getCount_absence() %>",
		freezed:"<%= dongInfoList.get(i).getCount_freezed() %>",
		reverse:"<%= dongInfoList.get(i).getCount_reverse() %>",
		fat:"<%= dongInfoList.get(i).getCount_fat() %>",
		breakage:"<%= dongInfoList.get(i).getCount_breakage() %>",
	});
	<% } %>
	
	var summaryReportList = new Array();
	<% for (int i=0; i < summaryReportList.size(); i++) { %>
	summaryReportList.push( {
		gu:"<%= summaryReportList.get(i).getGuGun() %>",
		dong:"<%= summaryReportList.get(i).getUmDong() %>",
		detail:"<%= summaryReportList.get(i).getDetail() %>",
		lat:"<%= summaryReportList.get(i).getLat() %>",
		lng:"<%= summaryReportList.get(i).getLng() %>",
		consumed:"<%= summaryReportList.get(i).getConsumed() %>",
		predicted:"<%= summaryReportList.get(i).getPredicted() %>",
		
		leak:"<%= summaryReportList.get(i).getLeak() %>",
		absence:"<%= summaryReportList.get(i).getAbsence() %>",
		freezed:"<%= summaryReportList.get(i).getFreezed() %>",
		reverse:"<%= summaryReportList.get(i).getReverse() %>",
		fat:"<%= summaryReportList.get(i).getFat() %>",
		breakage:"<%= summaryReportList.get(i).getBreakage()%>",
		
		day1:"<%= summaryReportList.get(i).getDay1()%>",
		day2:"<%= summaryReportList.get(i).getDay2()%>",
		day3:"<%= summaryReportList.get(i).getDay3()%>",
		day4:"<%= summaryReportList.get(i).getDay4()%>",
		day5:"<%= summaryReportList.get(i).getDay5()%>",
		day6:"<%= summaryReportList.get(i).getDay6()%>",
		day7:"<%= summaryReportList.get(i).getDay7()%>",
		
		latelyLeak:"<%= summaryReportList.get(i).getLatelyLeak()%>",
		latelyAbsence:"<%= summaryReportList.get(i).getLatelyAbsence()%>",
		latelyFreezed:"<%= summaryReportList.get(i).getLatelyFreezed()%>",
		latelyReverse:"<%= summaryReportList.get(i).getLatelyReverse()%>",
		latelyFat:"<%= summaryReportList.get(i).getLatelyFat()%>",
		latelyBreakage:"<%= summaryReportList.get(i).getLatelyBreakage()%>",
		
		countLeak:"<%= summaryReportList.get(i).getCountLeak()%>",
		countAbsence:"<%= summaryReportList.get(i).getAbsence()%>",
		countFreezed:"<%= summaryReportList.get(i).getFreezed()%>",
		countReverse:"<%= summaryReportList.get(i).getCountReverse()%>",
		countFat:"<%= summaryReportList.get(i).getCountFat()%>",
		countBreakage:"<%= summaryReportList.get(i).getCountBreakage()%>",
		
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
							<a href="main.jsp?MENU_NUM=2"><span>ANALYSIS</span></a>
						</li>
						<li role="presentation">
							<a href="main.jsp?MENU_NUM=3"><span>RANKING</span></a>
						</li>
						<!-- <li role="presentation">
							<a href="main.jsp?MENU_NUM=4"><span>ANALYSIS</span></a>
						</li> -->
					</ul>
				</nav>
			</div>	
		</div>
		<!--본문-->
		<div id="main_content">
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
					case 2:
						pageContext.setAttribute("MAIN_CONTENTS_PATH", "analysis.jsp");
						break;
					case 3:
						pageContext.setAttribute("MAIN_CONTENTS_PATH", "dashboard.jsp");
						break;
					default:
						pageContext.setAttribute("MAIN_CONTENTS_PATH", "map_page.jsp");
						break;
				}
			%>
			
			<jsp:include page="${MAIN_CONTENTS_PATH}" />
		</div>
		
		
		
		<!--footer-->
		<div id="footer">
			<a href="https://sites.google.com/site/uisclab" target="_blank">©ScLab. All rights reserved.</a>
		</div>

	</div>
</body>
</html>
