
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
	
	System.out.println(si);
	System.out.println(guGun);
	System.out.println(umDong);
%>

<jsp:useBean id="pd" class="sclab.db.ProcessedData" />
<jsp:useBean id="pdctrl" class="sclab.db.ProcessedDataCtrl" />
<%
	if (startDate == null || endDate == null || startDate.length() == 0 || endDate.length() == 0) {
		pd = pdctrl.returnRanks("인천광역시", "전체", "", "20150622", "20150629");
	} else {
		pd = pdctrl.returnRanks(si, guGun, umDong, startDate, endDate);
	}
%>

<script type="text/javascript">
window.onload = function dateInput() {
	var inputData = document.getElementById('startDate');
	inputData.style.backgroundcolor = '#005147';
	
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
			<%for (ArrayList<String> ab : pd.getRank_difference()) {%>  
         		['<%=ab.get(0)%>',<%=ab.get(1)%>],  
        	<%}%>	  
        ]);  
        
        var leak_data = google.visualization.arrayToDataTable([  
                                              			['동', '누수 횟수'],  
                                              			<%for (ArrayList<String> ab : pd.getRank_leak()) {%>  
                                                       		['<%=ab.get(0)%>',<%=ab.get(1)%>],  
                                                      	<%}%>	  
                                                      ]);
        var absence_data = google.visualization.arrayToDataTable([  
                                                     			['동', '부재중 횟수'],  
                                                     			<%for (ArrayList<String> ab : pd.getRank_absence()) {%>  
                                                              		['<%=ab.get(0)%>',<%=ab.get(1)%>],  
                                                             	<%}%>	  
                                                             ]); 
                                                           
        var freezed_data = google.visualization.arrayToDataTable([  
                                                     			['동', '동파 횟수'],  
                                                     			<%for (ArrayList<String> ab : pd.getRank_freezed()) {%>  
                                                              		['<%=ab.get(0)%>',<%=ab.get(1)%>],
																<%}%>
																	]);

		var diff_options = {
			title : 'Water Consumption',
			//width : '100%',
			//height : 143,

			bar : {
				groupWidth : "80%"
			},
			legend : {
				position : "none"
			},
			vAxis : {
				//ticks : [ 0, 5, 10, 15, 20 ],
				gridlines : {
					count : 4
				},
				//minValue : 0,
				viewWindow : {
					min : 0
				}
			}
		};
		var leak_options = {
			title : '누수 횟수',
			bar : {
				groupWidth : "80%"
			},
			legend : {
				position : "none"
			},
			vAxis : {
				//ticks : [ 0, 5, 10, 15, 20 ],
				gridlines : {
					count : 4
				},
				//minValue : 0,
				viewWindow : {
					min : 0
				}
			}
		};
		var absence_options = {
				title : '부재중 횟수',
				bar : {
					groupWidth : "80%"
				},
				legend : {
					position : "none"
				},
				vAxis : {
					//ticks : [ 0, 5, 10, 15, 20 ],
					gridlines : {
						count : 4
					},
					//minValue : 0,
					viewWindow : {
						min : 0
					}
				}
		};
		var freezed_options = {
				title : '동파 횟수',
				bar : {
					groupWidth : "80%"
				},
				legend : {
					position : "none"
				},
				vAxis : {
					//ticks : [ 0, 5, 10, 15, 20 ],
					gridlines : {
						count : 4
					},
					//minValue : 0,
					viewWindow : {
						min : 0
					}
				}
		};

		var diff_chart = new google.visualization.ColumnChart(document
				.getElementById('diff_info'));
		var leak_chart = new google.visualization.ColumnChart(document
				.getElementById('leak_info'));
		var absence_chart = new google.visualization.ColumnChart(document
				.getElementById('absence_info'));
		var freezed_chart = new google.visualization.ColumnChart(document
				.getElementById('freezed_info'));

		diff_chart.draw(diff_data, diff_options);
		leak_chart.draw(leak_data, leak_options);
		absence_chart.draw(absence_data, absence_options);
		freezed_chart.draw(freezed_data, freezed_options);
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

	<div id="dashboard_summary">
		<div class="dashboard_summary_wrap">
			<div class="summary_wrap summary_wrap_left">
				<div class="summary diff_summary">
					<!-- #1 -->
					사용량 예측량 차이
					<div class="summary_sub">
						<%=pd.getRank_difference().get(0).get(0)%>
					</div>
				</div>
				<div class="summary leak_summary">
					<!-- #2 -->
					누수
					<div class="summary_sub">
						<%=pd.getRank_leak().get(0).get(0)%>
					</div>
				</div>
			</div>
			<div class="summary_wrap summary_wrap_right">
				<div class="summary overused_summary">
					<!-- #4 -->
					과용
					<div class="summary_sub">
						<%=pd.getRank_overused().get(0).get(0)%>
					</div>
				</div>
				<div class="summary freezed_summary">
					<!-- #5 -->
					동파
					<div class="summary_sub">
						<%=pd.getRank_freezed().get(0).get(0)%>
					</div>
				</div>
			</div>
			<div class="summary absence_summary">
				<!-- #3 -->
				부재
				<div class="summary_sub">
					<%=pd.getRank_absence().get(0).get(0)%>
				</div>
			</div>
		</div>
	</div>

	<div id="dashboard_info">
		<div class="info_row">
			<div class="info info2 diff_info" id="diff_info"></div>
			<div class="info info2 leak_info" id="leak_info"></div>
			
		</div>
		<div class="info_row">
			<div class="info info2 absence_info" id="absence_info"></div>
			<div class="info info2 freezed_info" id="freezed_info"></div>
		</div>
	</div>
</div>
