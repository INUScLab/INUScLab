<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	String si = request.getParameter("si");
	String guGun = request.getParameter("guGun");
	String umDong = request.getParameter("umDong");
	String userId = request.getParameter("userId");
%>

<jsp:useBean id="detailData" class="sclab.db.DetailData" />
<jsp:useBean id="detailDataCtrl" class="sclab.db.DetailDataCtrl" />
<%
	if (startDate == null || endDate == null || startDate.length() == 0 || endDate.length() == 0) {
		detailData = detailDataCtrl.returnDatas("인천광역시", "전체", "", "", "20150622", "20150629");
	} else {
		detailData = detailDataCtrl.returnDatas(si, guGun, umDong, userId, startDate, endDate);
	}
%>

<script type="text/javascript">
window.onload = function () {	
	/* jQuery for SELECT BOX */
	$('#report_umDong_select').change(
			function(e) {
				var optionSelected = $("option:selected", this);
				var textSelected = optionSelected.text();

			});

	$('#report_guGun_select').change(function(e) {
		$('#report_umDong_select').html('').append("<option value=''>읍/면/동</option>");
		var optionSelected = $("option:selected", this);
		var textSelected = optionSelected.text();

		var umDong_select = document.getElementById("report_umDong_select");
		for (var i = 0; i < DongSummaryReportList.length; i++) {
			if (DongSummaryReportList[i].guGun == textSelected) {
				var option = document.createElement("option");
				option.text = DongSummaryReportList[i].umDong;
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

<script type="text/javascript" src="calendar.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">  
      google.load("visualization", "1", {packages:["corechart"]});  
     google.setOnLoadCallback(report_drawChart);  
      function report_drawChart() {  
    	  
    	  var cons = 300;
    	  var week = 300;
    	  var region = 200;
    	  var pred = 300;
    	  
    	  var Name =  <%=umDong %>;
  			var upperName = <%=guGun %>;
    	  
    	  var info_graph_data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
    			role : "style"
    		} ], [ '사용량', <%=detailData.getConsumed()%>, '#b87333' ], // RGB value
    		[ '지역 평균', <%=detailData.getAvg_consumed()%>, '#b87333' ] ]);
    	  
    	  var report_service_leak_data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
  			role : "style"
  		} ], [ Name, <%=detailData.getLeak()%>, '#b87333' ], // RGB value
  		[ upperName + '평균', <%=detailData.getAvg_leak()%>, 'silver' ] // English color name
  		]);
    	  
    	  var report_service_absence_data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
  			role : "style"
  		} ], [ Name, <%=detailData.getAbsence()%>, '#b87333' ], // RGB value
  		[ upperName + '평균', <%=detailData.getAvg_absence()%>, 'silver' ] // English color name
  		]);
    	  
    	  var report_service_freezed_data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
  			role : "style"
  		} ], [ Name, <%=detailData.getFreezed()%>, '#b87333' ], // RGB value
  		[ upperName + '평균', <%=detailData.getAvg_freezed()%>, 'silver' ] // English color name
  		]);
    	  
    	  var report_history_graph_data = new google.visualization.DataTable();
        	report_history_graph_data.addColumn('date', 'Time of Day');
        	report_history_graph_data.addColumn('number', 'Consumption');

        	report_history_graph_data.addRows([
        	                                   
				<%for (String ab : detailData.getConsumed_days()) {%>  
					[new Date(2015,1,22),'<%=ab%>'],  
				<%}%>	  
        	        ]);


    	  
    		var info_graph_view = new google.visualization.DataView(info_graph_data);
    		info_graph_view.setColumns([ 0, 1, {
    			calc : "stringify",
    			sourceColumn : 1,
    			type : "string",
    			role : "annotation"
    		}, 2 ]);
    		
    		var report_service_leak_view = new google.visualization.DataView(report_service_leak_data);
    		report_service_leak_view.setColumns([ 0, 1, {
    			calc : "stringify",
    			sourceColumn : 1,
    			type : "string",
    			role : "annotation"
    		}, 2 ]);
    		
    		var report_service_absence_view = new google.visualization.DataView(report_service_absence_data);
    		report_service_absence_view.setColumns([ 0, 1, {
    			calc : "stringify",
    			sourceColumn : 1,
    			type : "string",
    			role : "annotation"
    		}, 2 ]);
    		
    		var report_service_freezed_view = new google.visualization.DataView(report_service_freezed_data);
    		report_service_freezed_view.setColumns([ 0, 1, {
    			calc : "stringify",
    			sourceColumn : 1,
    			type : "string",
    			role : "annotation"
    		}, 2 ]);
    		
    		
    		
    		
    		

    		var info_graph_options = {
    			fontSize : 11,
    			bar : {
    				groupWidth : "80%"
    			},
    			legend : {
    				position : "none"
    			},
    			vAxis: {
    	            minValue:0,
    	            viewWindow: {
    	                min: 0
    	            }
    	        }
    		};
    		
    		var report_service_leak_options = {
        			title : "누수횟수",
        			titleTextStyle : {
        				color : "black",
        				fontSize : 11
        			},
        			fontSize : 11,
        			bar : {
        				groupWidth : "50%"
        			},
        			legend : {
        				position : "none"
        			},
        			vAxis: {
        	            minValue:0,
        	            viewWindow: {
        	                min: 0
        	            }
        	        }
        		};
    		
    		var report_service_absence_options = {
        			title : "부재중 알람 횟수",
        			titleTextStyle : {
        				color : "black",
        				fontSize : 11
        			},
        			fontSize : 11,
        			bar : {
        				groupWidth : "50%"
        			},
        			legend : {
        				position : "none"
        			},
        			vAxis: {
        	            minValue:0,
        	            viewWindow: {
        	                min: 0
        	            }
        	        }
        		};
    		
    		var report_service_freezed_options = {
        			title : "동파 횟수",
        			titleTextStyle : {
        				color : "black",
        				fontSize : 11
        			},
        			fontSize : 11,
        			bar : {
        				groupWidth : "50%"
        			},
        			legend : {
        				position : "none"
        			},
        			vAxis: {
        	            minValue:0,
        	            viewWindow: {
        	                min: 0
        	            }
        	        }
        		};
    		
    		var report_history_graph_options = {
    	      		title : "일주일 간 history",

    	      		titleTextStyle : {
    	      			color : "black",
    	      			fontSize : 15
    	      		},
    	      		hAxis : {
    	      			format : 'yy-MM-dd'
    	      		// gridlines: {count: 15}
    	      		},
    	      		vAxis : {
    	      			gridlines : {
    	      				color : 'none'
    	      			},
    	      		},
    	      		legend : {
    	      			position : "bottom"
    	      		},
    	      		series : {
    	      			1 : {
    	      				lineDashStyle : [ 5, 5 ]
    	      			}
    	      		}
    	      	};
    		
    		

    		var info_graph_chart = new google.visualization.ColumnChart(document
    				.getElementById('service_info_graph'));
    		
    		var report_service_leak_chart = new google.visualization.ColumnChart(document
    				.getElementById('report_service_leak'));
    		
    		var report_service_absence_chart = new google.visualization.ColumnChart(document
    				.getElementById('report_service_absence'));
    		
    		var report_service_freezed_chart = new google.visualization.ColumnChart(document
    				.getElementById('report_service_freezed'));
    		
    		var report_history_graph_chart = new google.visualization.LineChart(document
          			.getElementById('report_history_graph'));
    		

    		info_graph_chart.draw(info_graph_view, info_graph_options);
    		
    		report_service_leak_chart.draw(report_service_leak_view, report_service_leak_options);
    		
    		report_service_absence_chart.draw(report_service_absence_view, report_service_absence_options);
    		
    		report_service_freezed_chart.draw(report_service_freezed_view, report_service_freezed_options);
    		
    		report_history_graph_chart.draw(report_history_graph_data, report_history_graph_options);

    		
    		
	}
      
</script>

<!-- 새롭게 바뀐 페이지 -->
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
										<select name="guGun" id="report_guGun_select">
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
										<select name="umDong" id="report_umDong_select">
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
										<input type="text" class="startDate" id="startDate" name="startDate" size="10" onclick="fnPopUpCalendar(startDate,startDate,'yyyy-mm-dd')"/> 
										<!-- <img alt="calendar" src="./img/calendar.png" id="calendar" width="25px"	height="25px"> -->
									</div>
								</td>
								<td>&nbsp;-&nbsp;</td>
								<td>
									<div class="endDate Date_wrap">
										<input type="text" class="endDate" name="endDate" size="10" onclick="fnPopUpCalendar(endDate,endDate,'yyyy-mm-dd')"/>
										<!-- <img alt="calendar" src="./img/calendar.png" width="25px" height="25px"> -->
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
	
	
	<div class="report_info report_info_data">
		<div class="report_info_list">
			<ul>
				<li>총 사용향</li>
				<li>요금</li>
			</ul>
		</div>
		<div class="report_history_graph" id="report_history_graph"></div>
	</div>

	<div class="report_info report_info_row2">
		<div class="report_info_row2_wrap report_info_row2_wrap_left">
			<div class="report_info_ele report_info_graph" id="report_info_graph"></div><!-- 1 -->
			<div class="report_info_ele report_service_leak" id="report_service_leak"></div><!-- 2 -->
		</div>
		
		<div class="report_info_row2_wrap report_info_row2_wrap_right">
			<div class="report_info_ele report_service_absence" id="report_service_absence"></div><!-- 3 -->
			<div class="report_info_ele report_service_freezed" id="report_service_freezed"></div><!-- 4 -->
		</div>
	</div>
</div>
