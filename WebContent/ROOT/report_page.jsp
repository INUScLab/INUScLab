<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<script type="text/javascript">
	$(document).ready(function() {
		$("#searchByDay").addClass("tab_nonvisible");
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
		<form action="new_report_page.jsp">
			<table border="1" cellspacing="0" width="100%">
				<tr>
					<td>수용가 번호</td>
					<td align="left"><input type="text" /></td>
					<td>수용가 명</td>
					<td  align="left"><input type="text" /></td>
					<td rowspan="2"><input type="submit" /></td>
				</tr>
				<tr>
					<td>미터 번호</td>
					<td  align="left"><input type="text" /></td>
					<td>검 색 일</td>
					<td  align="left"><input type="text" /></td>
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
		<form action="new_report_page.jsp">
			<table border="1" cellspacing="0"  width="100%">
				<tr>
					<td>수용가 번호</td>
					<td align="left"><input type="text" /></td>
					<td>수용가 명</td>
					<td align="left"><input type="text" /></td>
					<td rowspan="2"><input type="submit" /></td>
				</tr>
				<tr>
					<td>미터 번호</td>
					<td align="left"><input type="text" /></td>
					<td>검 색 월</td>
					<td align="left"><select id="optYear">
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

					</select>&nbsp;년&nbsp;&nbsp; <select id="optMonth">
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03" selected="selected">03</option>
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
			<tr>
				<td width="100">수용가번호</td>
				<td width="200">수용가명</td>
				<td width="200">지시부번호</td>
				<td width="200">미터번호</td>
				<td width="200">미터타입</td>
				<td width="200">검침일</td>
				<td width="200">사용량</td>
				<%
					for (int time = 1; time <= 30; time++) {
				%>
				<td width="100"><%=time%>일</td>
				<%
					}
				%>
			</tr>
			<%
				for (int row = 1; row <= 24; row++) {
			%>
			<tr>
				<%
					for (int col = 0; col < 37; col++) {
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





<!-- 월별 -->
<div id="searchByMonth">
	<div class="searchBy_searchbox">
		<form action="new_report_page.jsp">
			<table border="1" cellspacing="0"  width="100%">
				<tr>
					<td>수용가 번호</td>
					<td align="left"><input type="text" /></td>
					<td>수용가 명</td>
					<td align="left"><input type="text" /></td>
					<td rowspan="2"><input type="submit" /></td>
				</tr>
				<tr>
					<td>미터 번호</td>
					<td align="left"><input type="text" /></td>
					<td>검 색 년 도</td>
					<td align="left"><select id="optYear">
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
					for (int time = 1; time <= 12; time++) {
				%>
				<td width="100"><%=time%>월</td>
				<%
					}
				%>
			</tr>
			<%
				for (int row = 1; row <= 24; row++) {
			%>
			<tr>
				<%
					for (int col = 0; col < 19; col++) {
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