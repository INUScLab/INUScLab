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
		String result = (String) request.getParameter("dong");
		out.write(result);
	%>


	<div class="left_section_box_init" id="left_section_box_init">

		<div class="init_info init_all_info">
			<div class="init_info_sub">
				<img alt="전체 아이콘" src="./img/combine.png" />
				<h2>[전체]</h2>
			</div>
			<ul id="init_entire_text">
				<li>전체 동 개수 : 221동</li>
				<li>전체 사용자 수 : 1000명</li>
			</ul>
		</div>
		<div class="init_info init_leak_info">
			<div class="init_info_sub">
				<img alt="누수 아이콘" src="./img/leak.png" />
				<h2>[누수 경보]</h2>
			</div>
			<ul id="init_leak_text">
				<li>누수 동 개수 : 5동</li>
				<li>누수 사용자 수 : 5개</li>
			</ul>
		</div>
		<div class="init_info init_freezed_info">
			<div class="init_info_sub">
				<img alt="동파 아이콘" src="./img/freezed.png" />
				<h2>[동파 경보]</h2>
			</div>
			<ul id="init_freezed_text">
				<li>동파 동 개수 : 6동</li>
				<li>동파 사용자 수 : 6명</li>
			</ul>
		</div>
		<div class="init_info init_absence">
			<div class="init_info_sub">
				<img alt="부재중 알람 아이콘" src="./img/absence.png" />
				<h2>[부재중 알람]</h2>
			</div>
			<ul id="init_absence_text">
				<li>부재중 알람 동 개수 : 4동</li>
				<li>부재중 알람 사용자 수 : 4명</li>
			</ul>
		</div>
	</div>


</body>
</html>