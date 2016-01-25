<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
%>

<jsp:useBean id="pd" class="sclab.db.ProcessedData" />
<jsp:useBean id="pdctrl" class="sclab.db.ProcessedDataCtrl" />
<%
	if (startDate == null || endDate == null || startDate.length() == 0 || endDate.length() == 0) {
		pd = pdctrl.returnRanks("인천광역시", "전체", "", "20150622", "20150629");
	} else {
		pd = pdctrl.returnRanks("인천광역시", "부평구", "부개1동", startDate, endDate);
	}
%>

<script type="text/javascript">





function sendIt(){
	var f = document.search_form;
	
	f.action = "<%=cp%>/ROOT/main.jsp?MENU_NUM=4";
	f.submit();
}
</script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">  
      google.load("visualization", "1", {packages:["corechart"]});  
     google.setOnLoadCallback(drawChart);  
      function drawChart() {  
  
    	  
        var diff_data = google.visualization.arrayToDataTable([  
			['동', '차이량'],  
			<%for (ArrayList<String> ab : pd.getrank_difference()) {%>  
         		['<%=ab.get(0) %>',<%=ab.get(1)%>],  
        	<%}%>	  
        ]);  
        
        var leak_data = google.visualization.arrayToDataTable([  
                                              			['동', '누수 횟수'],  
                                              			<%for (ArrayList<String> ab : pd.getrank_leak()) {%>  
                                                       		['<%=ab.get(0) %>',<%=ab.get(1)%>],  
                                                      	<%}%>	  
                                                      ]);
        var absence_data = google.visualization.arrayToDataTable([  
                                                     			['동', '부재중 횟수'],  
                                                     			<%for (ArrayList<String> ab : pd.getrank_absence()) {%>  
                                                              		['<%=ab.get(0) %>',<%=ab.get(1)%>],  
                                                             	<%}%>	  
                                                             ]);
        var overused_data = google.visualization.arrayToDataTable([  
                                                     			['동', '과용 횟수'],  
                                                     			<%for (ArrayList<String> ab : pd.getrank_overused()) {%>  
                                                              		['<%=ab.get(0) %>',<%=ab.get(1)%>],  
                                                             	<%}%>	  
                                                             ]);
        var freezed_data = google.visualization.arrayToDataTable([  
                                                     			['동', '동파 횟수'],  
                                                     			<%for (ArrayList<String> ab : pd.getrank_freezed()) {%>  
                                                              		['<%=ab.get(0) %>',<%=ab.get(1)%>],  
                                                             	<%}%>	  
                                                             ]);
	   
       var options = {  
         title: 'Water Consumption'  
        };  
 
       var diff_chart = new google.visualization.ColumnChart(document.getElementById('diff_info'));
       var leak_chart = new google.visualization.ColumnChart(document.getElementById('leak_info'));
       var absence_chart = new google.visualization.ColumnChart(document.getElementById('absence_info'));
       var overused_chart = new google.visualization.ColumnChart(document.getElementById('overused_info'));
       var freezed_chart = new google.visualization.ColumnChart(document.getElementById('freezed_info'));

      diff_chart.draw(diff_data, options);
      leak_chart.draw(leak_data, options);
      absence_chart.draw(absence_data, options);
      overused_chart.draw(overused_data, options);
      freezed_chart.draw(freezed_data, options);
 }  
</script>




<!-- 수정 -->
<div id="dashboard_page">
	<div id="dashboard_search">
		<!--form action="" name="search_form" method="post">
			<div id="juso_search"></div>
			<div id="date_search" class="search">기간 : 
				<div id="start_search" class="search">
					<input type="text" name="startDate" size="10"/><img alt="calendar" src="./img/calendar.png">
				</div>
				&nbsp;-&nbsp;
				<div id="end_search" class="search">
					<input type="text" name="endDate" size="10"/><img alt="calendar" src="./img/calendar.png">
				</div>
			</div>
			<input type="button" value="검색" onclick="sendIt();"/>
		</form-->

		<form action="" name="search_form" method="post">
			<table cellpadding="0" cellspacing="0" class="table_main">
				<tr>
					<td id="juso_search">&nbsp;</td>

					<td align="center" width="50px">기간:</td>
					<td id="date_search">
						<table cellpadding="0" cellspacing="0" class="table_date">
							<tr>
								<td>
									<div class="Date_wrap">
										<input type="text" class="startDate" name="startDate"
											size="10" /> <img alt="calendar" src="./img/calendar.png"
											id="calendar" width="25px" height="25px">
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

	<div id="dashboard_summary">
		<div class="dashboard_summary_wrap">
			<div class="summary_wrap summary_wrap_left">
				<div class="summary diff_summary">
					<!-- #1 -->
					사용량 예측량 차이
					<div class="summary_sub">
						<%=pd.getrank_difference().get(0).get(0)%>
					</div>
				</div>
				<div class="summary leak_summary">
					<!-- #2 -->
					누수
					<div class="summary_sub">
						<%=pd.getrank_leak().get(0).get(0)%>
					</div>
				</div>
			</div>
			<div class="summary_wrap summary_wrap_right">
				<div class="summary overused_summary">
					<!-- #4 -->
					과용
					<div class="summary_sub">
						<%=pd.getrank_overused().get(0).get(0)%>
					</div>
				</div>
				<div class="summary freezed_summary">
					<!-- #5 -->
					동파
					<div class="summary_sub">
						<%=pd.getrank_freezed().get(0).get(0)%>
					</div>
				</div>
			</div>
			<div class="summary absence_summary">
				<!-- #3 -->
				부재
				<div class="summary_sub">
					<%=pd.getrank_absence().get(0).get(0)%>
				</div>
			</div>
		</div>
	</div>

	<div id="dashboard_info">
		<div class="info_row">
			<div class="info info1 diff_info" id="diff_info"></div>
		</div>
		<div class="info_row">
			<div class="info info2 leak_info" id="leak_info"></div>
			<div class="info info2 absence_info" id="absence_info"></div>
		</div>
		<div class="info_row">
			<div class="info info2 overused_info" id="overused_info"></div>
			<div class="info info2 freezed_info" id="freezed_info"></div>
		</div>
	</div>
</div>
