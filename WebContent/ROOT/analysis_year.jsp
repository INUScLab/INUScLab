<%@page import="sclab.db.AnalysisData"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="adctrl" class="sclab.db.AnalysisDataCtrl"/>

<%
String si = request.getParameter("si");
String guGun = request.getParameter("guGun");
String umDong = request.getParameter("umDong");
String consumerNum = request.getParameter("consumerNum");
String consumerName = request.getParameter("consumerName");
String telNumber = request.getParameter("telNumber");
String meterNum = request.getParameter("meterNum");
String sdate = request.getParameter("sdate");
String edate = request.getParameter("edate");

if (sdate == null || sdate.equals("")) sdate = "";
if (edate == null || edate.equals("")) edate = "";
if (si == null || si.equals("")) si = "인천광역시";
if (guGun == null || guGun.equals("")) guGun = "전체";
if (umDong == null || umDong.equals("")) umDong = "전체";	
if (consumerNum != null) if(consumerNum.equals("")) consumerNum = null;	
if (consumerName != null) if(consumerName.equals("")) consumerName = null;	
if (telNumber != null) if(telNumber.equals("")) telNumber = null;	
if (meterNum != null) if(meterNum.equals("")) meterNum = null;																																				
	
	
	
	ArrayList<AnalysisData> array_list = adctrl.returnDatas(si,guGun,umDong,consumerNum,consumerName,telNumber,meterNum,"2015",null,null,"2015",null,null);

%>


<div class="searchBy_searchbox">
		<form action="main.jsp?MENU_NUM=4" method="post">
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
		<table id="AnaTableYear" class="AnalysisTable" cellspacing="0" border="1">
		<thead>
			<tr height="50px">
				<th>수용가번호</th>
				<th>수용가명</th>
				<th>지시부번호</th>
				<th>미터번호</th>
				<th>미터타입</th>
				<th>검침기간</th>
				<th>총사용량</th>
				<th>년수</th>
				<th>년 평균 사용량</th>
			</tr>
			</thead>
			<%
				for(int i=0 ; i < array_list.size(); i++) {
			  %>
			  <tr>
				<td><%=array_list.get(i).getCode()%></td>
				<td><%=array_list.get(i).getDetail()%></td>
				<td><%=array_list.get(i).getNumber()%></td>
				<td><%=array_list.get(i).getMeter_num()%></td>
				<td><%=array_list.get(i).getMeter_type()%></td>
				<td><%=array_list.get(i).getTerm()%></td>
				<td><%=array_list.get(i).getTotal_consumed()%></td>
				<td><%=array_list.get(i).getCount()%></td>
				<td><%=array_list.get(i).getAvg_consumed()%></td>

			  </tr>
			  <%
			  }
			  %>
		</table>
	</div>