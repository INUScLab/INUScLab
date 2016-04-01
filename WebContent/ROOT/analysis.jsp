<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#searchByMonth").addClass("tab_nonvisible");
		$("#searchByYear").addClass("tab_nonvisible");
		
		/* tab 기능 */
		$("#tab_searchByDay").click(function() {
			$("#searchByDay").removeClass("tab_nonvisible");
			$("#searchByMonth").removeClass("tab_visible");
			$("#searchByYear").removeClass("tab_visible");

			$("#searchByDay").addClass("tab_visible");
			$("#searchByMonth").addClass("tab_nonvisible");
			$("#searchByYear").addClass("tab_nonvisible");
		});

		$("#tab_searchByMonth").click(function() {
			$("#searchByMonth").removeClass("tab_nonvisible");
			$("#searchByDay").removeClass("tab_visible");
			$("#searchByYear").removeClass("tab_visible");

			$("#searchByMonth").addClass("tab_visible");
			$("#searchByDay").addClass("tab_nonvisible");
			$("#searchByYear").addClass("tab_nonvisible");
		});
		
		$("#tab_searchByYear").click(function() {
			$("#searchByYear").removeClass("tab_nonvisible");
			$("#searchByDay").removeClass("tab_visible");
			$("#searchByMonth").removeClass("tab_visible");

			$("#searchByYear").addClass("tab_visible");
			$("#searchByDay").addClass("tab_nonvisible");
			$("#searchByMonth").addClass("tab_nonvisible");
		});
		/* tab 기능 */
		
						/* 주소 검색 기능 */
						$('#report_guGun_select')
								.change(
										function(e) {
											$('#analysis_umDong_select')
													.html('')
													.append(
															"<option value=''>읍/면/동</option>");
											var optionSelected = $(
													"option:selected", this);
											var textSelected = optionSelected
													.text();

											var umDong_select = document
													.getElementById("analysis_umDong_select");
											for (var i = 0; i < DongSummaryReportList.length; i++) {
												if (DongSummaryReportList[i].guGun == textSelected) {
													var option = document
															.createElement("option");
													option.text = DongSummaryReportList[i].umDong;
													umDong_select.add(option);
												}
											}
										});

						$('#analysis_umDong_select')
								.change(
										function(e) {
											var optionSelected = $(
													"option:selected", this);
											var textSelected = optionSelected
													.text();

											var umDong_select = document
													.getElementById("analysis_umDong_select");
											for (var i = 0; i < DongSummaryReportList.length; i++) {
												if (DongSummaryReportList[i].guGun == textSelected) {
													var option = document
															.createElement("option");
													option.text = DongSummaryReportList[i].umDong;
													console.log(option.text);
													umDong_select.add(option);
												}
											}
										});
						/* 주소 검색 기능 */

					});
</script>

<div class="searchBy">
	<div id="tab_searchByDay" class="tab_searchBy">
		<a href="#">일별 사용량 분석</a>
	</div>
	<div id="tab_searchByMonth" class="tab_searchBy">
		<a href="#">월별 사용량 분석</a>
	</div>
	<div id="tab_searchByYear" class="tab_searchBy">
		<a href="#">년별 사용량 분석</a>
	</div>
</div>

<!-- 일별 -->
<div id="searchByDay">
	<div class="searchBy_searchbox">
		<form action="main.jsp?MENU_NUM=1" method="post">
			<table border="1" cellspacing="0" width="100%">
				<tr>
					<td colspan="7"><select name="si" id="si_select">
							<option value="전체">시</option>
							<option value="인천광역시">인천광역시</option>
					</select> <select name="guGun" id="analysis_guGun_select">
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
					</select> <select name="umDong" id="analysis_umDong_select">
							<option value="전체">읍/면/동</option>
					</select></td>
				</tr>
				<tr>
					<td>수용가 번호</td>
					<td align="left"><input type="text" name="consumerNum" /></td>
					<td>수용가 명</td>
					<td align="left"><input type="text" name="consumerName" /></td>
					<td>지시부 번호</td>
					<td align="left"><input type="text" name="telNumber" /></td>
					<td rowspan="2"><input type="submit" value="검색" id="form_daily_search"/></td>
				</tr>
				<tr>
					<td>미터 번호</td>
					<td align="left"><input type="text" name="meterNum" /></td>
					<td>검 색 월</td>
					<td align="left" colspan="3">
						<input type="text" name=""/>~<input type="text" name=""/>
					</td>
				</tr>

			</table>
		</form>
	</div>
	<div class="data_view">
		<table cellspacing="0" border="1">
			<tr height="50px">
				<td width="100px">수용가번호</td>
				<td width="200px">수용가명</td>
				<td width="200px">지시부번호</td>
				<td width="200px">미터번호</td>
				<td width="200px">미터타입</td>
				<td width="200px">검침기간</td>
				<td width="200px">총사용량</td>
				<td width="200px">일수</td>
				<td width="200px">일 평균 사용량</td>
			</tr>
			
		</table>
	</div>
</div>

<!-- 월별 -->
<div id="searchByMonth">
	<div class="searchBy_searchbox">
		<form action="main.jsp?MENU_NUM=1" method="post">
			<table border="1" cellspacing="0" width="100%">
				<tr>
					<td colspan="7"><select name="si" id="si_select">
							<option value="전체">시</option>
							<option value="인천광역시">인천광역시</option>
					</select> <select name="guGun" id="analysis_guGun_select">
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
					</select> <select name="umDong" id="analysis_umDong_select">
							<option value="전체">읍/면/동</option>
					</select></td>
				</tr>
				<tr>
					<td>수용가 번호</td>
					<td align="left"><input type="text" name="consumerNum" /></td>
					<td>수용가 명</td>
					<td align="left"><input type="text" name="consumerName" /></td>
					<td>지시부 번호</td>
					<td align="left"><input type="text" name="telNumber" /></td>
					<td rowspan="2"><input type="submit" value="검색" id="form_daily_search"/></td>
				</tr>
				<tr>
					<td>미터 번호</td>
					<td align="left"><input type="text" name="meterNum" /></td>
					<td>검 색 월</td>
					<td align="left" colspan="3"><select id="optYear"
						name="dateYear">
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015" selected="selected">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>

					</select>&nbsp;년&nbsp;&nbsp; <select id="optMonth" name="dateMonth">
							<option value="01">01</option>
							<option value="02" selected="selected">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>

					</select>&nbsp;월&nbsp;~&nbsp;<select id="optYear"
						name="dateYear">
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015" selected="selected">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>

					</select>&nbsp;년&nbsp;&nbsp; <select id="optMonth" name="dateMonth">
							<option value="01">01</option>
							<option value="02" selected="selected">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>

					</select>&nbsp;월</td>
				</tr>

			</table>
		</form>
	</div>
	<div class="data_view">
		<table cellspacing="0" border="1">
			<tr height="50px">
				<td width="100px">수용가번호</td>
				<td width="200px">수용가명</td>
				<td width="200px">지시부번호</td>
				<td width="200px">미터번호</td>
				<td width="200px">미터타입</td>
				<td width="200px">검침기간</td>
				<td width="200px">총사용량</td>
				<td width="200px">월수</td>
				<td width="200px">월 평균 사용량</td>
			</tr>
			
		</table>
	</div>
</div>

<!-- 년별 -->
<div id="searchByYear">
	<div class="searchBy_searchbox">
		<form action="main.jsp?MENU_NUM=1" method="post">
			<table border="1" cellspacing="0" width="100%">
				<tr>
					<td colspan="7"><select name="si" id="si_select">
							<option value="전체">시</option>
							<option value="인천광역시">인천광역시</option>
					</select> <select name="guGun" id="analysis_guGun_select">
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
					</select> <select name="umDong" id="analysis_umDong_select">
							<option value="전체">읍/면/동</option>
					</select></td>
				</tr>
				<tr>
					<td>수용가 번호</td>
					<td align="left"><input type="text" name="consumerNum" /></td>
					<td>수용가 명</td>
					<td align="left"><input type="text" name="consumerName" /></td>
					<td>지시부 번호</td>
					<td align="left"><input type="text" name="telNumber" /></td>
					<td rowspan="2"><input type="submit" value="검색" id="form_daily_search"/></td>
				</tr>
				<tr>
					<td>미터 번호</td>
					<td align="left"><input type="text" name="meterNum" /></td>
					<td>검 색 월</td>
					<td align="left" colspan="3"><select id="optYear"
						name="startDateYear">
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015" selected="selected">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>

					</select>&nbsp;년&nbsp;~&nbsp;
					<select id="optYear" name="endDateYear">
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015" selected="selected">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>

					</select>&nbsp;년</td>
				</tr>

			</table>
		</form>
	</div>
	<div class="data_view">
		<table cellspacing="0" border="1">
			<tr height="50px">
				<td width="100px">수용가번호</td>
				<td width="200px">수용가명</td>
				<td width="200px">지시부번호</td>
				<td width="200px">미터번호</td>
				<td width="200px">미터타입</td>
				<td width="200px">검침기간</td>
				<td width="200px">총사용량</td>
				<td width="200px">년수</td>
				<td width="200px">년 평균 사용량</td>
			</tr>
			
		</table>
	</div>
</div>
