<%@ page language="java" import="sclab.db.*, java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="sclab.db.SummaryReportCtrl"%>
<%@page import="sclab.db.SummaryReport"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="dongSummary()">
<jsp:useBean id="DongSummaryReport" class="sclab.db.SummaryReport" />
<jsp:useBean id="DongSummaryReportCtrl" class="sclab.db.SummaryReportCtrl" />

	<%
		// 클릭한 동 주소를 넘겨받아서 다시 DB에 요약리포트에 필요한 정보를 요청함.
		String address = (String) request.getParameter("address");
		SummaryReportCtrl summaryReportCtrl = new SummaryReportCtrl();
		ArrayList<SummaryReport> summaryReportList = summaryReportCtrl.getSummaryReportList();
		String gu = summaryReportList.get(0).getGuGun();
	%>


<<script type="text/javascript"> 
var summaryReportList = new Array();

<% for (int i=0; i < summaryReportList.size(); i++) { %>
summaryReportList.push( {
	gu:"<%= summaryReportList.get(i).getGuGun() %>",
	dong:"<%= summaryReportList.get(i).getUmDong() %>",
	detail:"<%= summaryReportList.get(i).getDetail() %>",
	lat:"<%= summaryReportList.get(i).getLat() %>",
	lng:"<%= summaryReportList.get(i).getLng() %>",
	
	leak:"<%= summaryReportList.get(i).getLeak() %>",
	absence:"<%= summaryReportList.get(i).getAbsence() %>",
	freezed:"<%= summaryReportList.get(i).getFreezed() %>",
	reverse:"<%= summaryReportList.get(i).getReverse() %>",
	fat:"<%= summaryReportList.get(i).getFat() %>",
	breakage:"<%= summaryReportList.get(i).getBreakage()%>",

	latelyLeak:"<%= summaryReportList.get(i).getLatelyLeak()%>",
	latelyAbsence:"<%= summaryReportList.get(i).getLatelyAbsence()%>",
	latelyFreezed:"<%= summaryReportList.get(i).getLatelyFreezed()%>",
	latelyReverse:"<%= summaryReportList.get(i).getLatelyReverse()%>",
	latelyFat:"<%= summaryReportList.get(i).getLatelyFat()%>",
	latelyBreakage:"<%= summaryReportList.get(i).getLatelyBreakage()%>",
	
	day1:"<%= summaryReportList.get(i).getDay1()%>",
	day2:"<%= summaryReportList.get(i).getDay2()%>",
	day3:"<%= summaryReportList.get(i).getDay3()%>",
	day4:"<%= summaryReportList.get(i).getDay4()%>",
	day5:"<%= summaryReportList.get(i).getDay5()%>",
	day6:"<%= summaryReportList.get(i).getDay6()%>",
	day7:"<%= summaryReportList.get(i).getDay7()%>",
});
<% } %>
</script>

<div class="left_section_box_report" id="left_section_box_report"> 
	<div class="info_date" id="info_date"><%= %></div>
	<div class="info_icon">
		<div class="info_wrapper">
			<input type="checkbox"  id="checkBox_leak" class="checkBox" >
			<div id ="check_leak" class="checkbox_text"></div>
		</div>
		<div class="info_wrapper">
			<input type="checkbox" id="checkBox_freezed" class="checkBox" >
			<div id="check_freezed" class="checkbox_text"></div>
		</div>
		<div class="info_wrapper">
			<input type="checkbox"  id="checkBox_absence" class="checkBox" > 
			<div id="check_absence" class="checkbox_text"></div>
		</div>
	</div>
	<div class="info_graph" id="info_graph">
		<div class="leak_icon" id="leak_icon">
		</div>
		<div class="leak_info" id="leak_info"></div>
	</div>

	<div class="info_history" id="info_history">
		<div class="freeze_icon" id="freeze_icon">
		</div>
		<div class="freeze_info" id="freeze_info"></div>
	</div>

	<div class="info_service" id="info_service">
		<div class="info_leak" id="info_leak">
			<div class="leak_text" id="leak_text"></div>
			<div class="leak_graph" id="leak_graph">
			</div>
		</div>
		<div class="info_absence" id="info_absence">
			<div class="absence_text" id="absence_text"></div>
			<div class="absence_graph" id="absence_graph"></div>
		</div>
		<div class="info_freezed" id="info_freezed">
			<div class="freeze_text" id="freeze_text"></div>
			<div class="freeze_graph" id="freeze_graph"></div>
		</div>
	</div>
</div>

</body>
</html>