<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="DongSummaryReport" class="sclab.db.DongSummaryReport" />
<jsp:useBean id="DongSummaryReportCtrl" class="sclab.db.DongSummaryReportCtrl" />

	<%
		String address = (String) request.getParameter("address");
		
		
	%>


<<script type="text/javascript"> 


</script>
<div class="left_section_box2" id="left_section_box2">
	<div class="info_date" id="info_date"></div>
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