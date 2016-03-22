<%@page import="sclab.db.DetailData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.Console"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dd" class="sclab.db.DetailData" />
<jsp:useBean id="ddctrl" class="sclab.db.DetailDataCtrl" />

<%
	String si = request.getParameter("si");
	String guGun = request.getParameter("guGun");
	String umDong = request.getParameter("umDong");
	String consumerNum = request.getParameter("consumerNum");
	String consumerName = request.getParameter("consumerName");
	String telNumber = request.getParameter("telNumber");
	String meterNum = request.getParameter("meterNum");
	String dateYear = request.getParameter("dateYear");
	String dateMonth = request.getParameter("dateMonth");

	

	if (dateYear == null || dateYear.equals("")) dateYear = "2015";
	if (dateMonth == null || dateMonth.equals("")) dateMonth = "02";
	if (si == null || si.equals("")) si = "인천광역시";
	if (guGun == null || guGun.equals("")) guGun = "부평구";
	if (umDong == null || umDong.equals("")) umDong = "전체";	
	if (consumerNum != null) if(consumerNum.equals("")) consumerNum = null;	
	if (consumerName != null) if(consumerName.equals("")) consumerName = null;	
	if (telNumber != null) if(telNumber.equals("")) telNumber = null;	
	if (meterNum != null) if(meterNum.equals("")) meterNum = null;
	
	ArrayList<DetailData> array_list = ddctrl.returnDatas(si, guGun, umDong, consumerNum, consumerName,
			telNumber, meterNum, dateYear, dateMonth);
	//ArrayList<DetailData> array_list = ddctrl.returnDatas("인천광역시","부평구","전체",consumerNum,consumerName,telNumber,meterNum,"2015","02");
%>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/* tab 기능 */
						$("#searchByTime").addClass("tab_nonvisible");
						$("#searchByMonth").addClass("tab_nonvisible");

						$("#tab_searchByTime").click(function() {
							$("#searchByTime").removeClass("tab_nonvisible")
							$("#searchByMonth").removeClass("tab_visible");
							$("#searchByDay").removeClass("tab_visible");

							$("#searchByTime").addClass("tab_visible");

							$("#searchByDay").addClass("tab_nonvisible");
							$("#searchByMonth").addClass("tab_nonvisible");
						});

						$("#tab_searchByDay").click(function() {
							$("#searchByDay").removeClass("tab_nonvisible");
							$("#searchByTime").removeClass("tab_visible")
							$("#searchByMonth").removeClass("tab_visible")

							$("#searchByDay").addClass("tab_visible");

							$("#searchByTime").addClass("tab_nonvisible");
							$("#searchByMonth").addClass("tab_nonvisible");
						});

						$("#tab_searchByMonth").click(function() {
							$("#searchByMonth").removeClass("tab_nonvisible");
							$("#searchByTime").removeClass("tab_visible");
							$("#searchByDay").removeClass("tab_visible");

							$("#searchByMonth").addClass("tab_visible");
							$("#searchByTime").addClass("tab_nonvisible");
							$("#searchByDay").addClass("tab_nonvisible");
						});
						/* tab 기능 */

						/* 주소 검색 기능 */
						$('#report_guGun_select')
								.change(
										function(e) {
											$('#report_umDong_select')
													.html('')
													.append(
															"<option value=''>읍/면/동</option>");
											var optionSelected = $(
													"option:selected", this);
											var textSelected = optionSelected
													.text();

											var umDong_select = document
													.getElementById("report_umDong_select");
											for (var i = 0; i < DongSummaryReportList.length; i++) {
												if (DongSummaryReportList[i].guGun == textSelected) {
													var option = document
															.createElement("option");
													option.text = DongSummaryReportList[i].umDong;
													umDong_select.add(option);
												}
											}
										});

						$('#report_umDong_select')
								.change(
										function(e) {
											var optionSelected = $(
													"option:selected", this);
											var textSelected = optionSelected
													.text();

											var umDong_select = document
													.getElementById("umDong_select");
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
	<div id="tab_searchByTime" class="tab_searchBy">
		<a href="#">시간대별 검색</a>
	</div>
	<div id="tab_searchByDay" class="tab_searchBy">
		<a href="#">일별 검색</a>
	</div>
	<div id="tab_searchByMonth" class="tab_searchBy">
		<a href="#">월별 검색</a>
	</div>
</div>
<!-- 시간대별  -->
<div id="searchByTime">
	<div class="searchBy_searchbox">
		<form action="main.jsp?MENU_NUM=1" method="post">
			<table border="1" cellspacing="0" width="100%">
				<tr>
					<td colspan="7"><select name="si" id="si_select">
							<option value="전체">시</option>
							<option value="인천광역시">인천광역시</option>
					</select> <select name="guGun" id="report_guGun_select2">
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
					</select> <select name="umDong" id="report_umDong_select2">
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
					<td rowspan="2"><input type="submit" value="검색" /></td>
				</tr>
				<tr>
					<td>미터 번호</td>
					<td align="left"><input type="text" name="meterNum" /></td>
					<td>검 색 일</td>
					<td align="left" colspan="3"><input type="text" name="date" /></td>
				</tr>

			</table>
		</form>
	</div>


	<div class="data_view">
		<table cellspacing="0" border="1">
			<tr border="1">
				<td width="100px">수용가번호</td>
				<td width="200px">수용가명</td>
				<td width="200px">지시부번호</td>
				<td width="200px">미터번호</td>
				<td width="200px">미터타입</td>
				<td width="200px">검침일</td>
				<td width="200px">사용량</td>
				<%
					for (int time = 1; time <= 24; time++) {
				%>
				<td width="100px"><%=time%>시</td>
				<%
					}
				%>
			</tr>
			<%
				for (int row = 1; row <= 24; row++) {
			%>
			<tr>
				<%
					for (int col = 0; col < 31; col++) {
				%>
				<td></td>
				<%
					}
				%>
				<%
					}
				%>
			</tr>

		</table>
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
					</select> <select name="guGun" id="report_guGun_select">
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
					</select> <select name="umDong" id="report_umDong_select">
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
					<td rowspan="2"><input type="submit" value="검색" /></td>
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
				<td width="200px">검침월</td>
				<td width="200px">사용량</td>
				<%
					for (int time = 1; time <= 30; time++) {
				%>
				<td width="100px"><%=time%>일</td>
				<%
					}
				%>
			</tr>
			<%
			/* out.print("<script>console.log("+ array_list.size() + ");</script>"); */
				for (int i = 0; i < array_list.size(); i++) {
			%>
			<tr>
				<td><%=array_list.get(i).getCode()%></td>
				<td><%=array_list.get(i).getDetail()%></td>
				<td><%=array_list.get(i).getNumber()%></td>
				<td><%=array_list.get(i).getMeter_num()%></td>
				<td><%=array_list.get(i).getMeter_type()%></td>
				<td><%=array_list.get(i).getTotal_consumed()%></td>
				<%
					for (String a : array_list.get(i).getConsumed_days()) {
				%>
				<td><%=a%></td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
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
					</select> <select name="guGun" id="report_guGun_select">
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
					</select> <select name="umDong" id="report_umDong_select">
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
					<td rowspan="2"><input type="submit" value="검색" /></td>
				</tr>
				<tr>
					<td>미터 번호</td>
					<td align="left"><input type="text" name="meterNum" /></td>
					<td>검 색 년 도</td>
					<td align="left" colspan="3"><select id="optYear">
							<option value="2008">2008</option>
							<option value="2009">2009</option>
							<option value="2010">2010</option>
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016" selected="selected">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>

					</select> &nbsp;년</td>
				</tr>

			</table>
		</form>
	</div>
	<div class="data_view">
		<table cellspacing="0" border="1">
			<tr>
				<td width="100">수용가번호</td>
				<td width="200">수용가명</td>
				<td width="200">지시부번호</td>
				<td width="200">미터번호</td>
				<td width="200">미터타입</td>
				<td width="200">검침일</td>
				<td width="200">사용량</td>
				<%
					for (int time = 1; time <= 24; time++) {
				%>
				<td width="100px"><%=time%>시</td>
				<%
					}
				%>
			</tr>
			<%
				for (int row = 1; row <= 24; row++) {
			%>
			<tr>
				<%
					for (int col = 0; col < 31; col++) {
				%>
				<td></td>
				<%
					}
				%>
				<%
					}
				%>
			</tr>
		</table>
	</div>
</div>