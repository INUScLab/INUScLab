<%-- <%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	String si = request.getParameter("si");
	String guGun = request.getParameter("guGun");
	String umDong = request.getParameter("umDong");
%>

<script type="text/javascript">
window.onload = function () {	
	/* jQuery for SELECT BOX */
	$('#analysis_umDong_select').change(
			function(e) {
				var optionSelected = $("option:selected", this);
				var textSelected = optionSelected.text();

			});

	$('#analysis_guGun_select').change(function(e) {
		$('#analysis_umDong_select').html('').append("<option value=''>읍/면/동</option>");
		var optionSelected = $("option:selected", this);
		var textSelected = optionSelected.text();

		var umDong_select = document.getElementById("analysis_umDong_select");
		for (var i = 0; i < guDongWeeksList.length; i++) {
			if (guDongWeeksList[i].guGun == textSelected) {
				var option = document.createElement("option");
				option.text = guDongWeeksList[i].umDong;
				//console.log(option.text);
				umDong_select.add(option);
			}
		}
	});
}





function sendIt(){
	var f = document.search_form;
	
	f.action = "<%=cp%>/ROOT/main.jsp?MENU_NUM=1";
	f.submit();
}
</script>

<div id="report_content">
	<div class="report_search">
		<form action="" name="search_form" method="post">
			<table cellpadding="0" cellspacing="0" class="table_main">
				<tr>
					<td id="juso_search">
						<table>
							<tr>
								<td>
									<div id="analysis_address_label" class="address_label">
										<select name="si" id="si_select">
											<option value="전체">시</option>
											<option value="인천광역시">인천광역시</option>
										</select>
									</div>
								</td>
								<td>
									<div id="analysis_address_label" class="address_label">
										<select name="guGun" id="analysis_guGun_select">
											<option value="전체">구/군</option>
											<option value="강화군">강화군</option>
											<option value="계양구">계양구</option>
											<option value="남구">남구</option>
											<option value="남동구">남동구</option>
											<option value="동구">동구</option>
											<option value="부평구">부평구</option>
											<option value="서구">서구</option>
											<option value="연수구">연수구</option>
											<option value="웅진군">웅진군</option>
											<option value="중구">중구</option>
										</select>
									</div>
								</td>
								<td>
									<div id="analysis_address_label" class="address_label">
										<select name="umDong" id="analysis_umDong_select">
											<option value="전체">읍/면/동</option>
										</select>
									</div>
								</td>
							</tr>
						</table>
					</td>

					<td align="center" width="50px">기간:</td>
					<td id="date_search">
						<table cellpadding="0" cellspacing="0" class="table_date">
							<tr>
								<td>
									<div class="Date_wrap">
										<input type="text" class="startDate" id="startDate"
											name="startDate" size="10" /> <img alt="calendar"
											src="./img/calendar.png" id="calendar" width="25px"
											height="25px">
									</div>
								</td>
								<td>&nbsp;-&nbsp;</td>
								<td>
									<div class="endDate Date_wrap">
										<input type="text" class="endDate" name="endDate" size="10" />
										<img alt="calendar" src="./img/calendar.png" width="25px"
											height="25px">
									</div>
								</td>
							</tr>
						</table>
					</td>
					<td width="50"><input type="button" value="검색"
						onclick="sendIt();" /></td>
				</tr>
			</table>
		</form>



	</div>
	<div class="report_info">
		<jsp:include page="report_graph.jsp" flush="false" />
		<div class="info">
			<div id="today_chart"></div>
			<h1>today</h1>
		</div>
		<div class="info">
			<div id="weekly_chart"></div>
			<h1>weekly</h1>
		</div>
		<div class="info">
			<div id="monthly_chart"></div>
			<h1>monthly</h1>
		</div>

	</div>

	<div class="table">
		<jsp:include page="table.jsp" flush="false" />
	</div>

	<div id="history">
		<jsp:include page="report_graph_history.jsp" flush="false" />
	</div>
</div>
 --%>