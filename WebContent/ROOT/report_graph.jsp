<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="sclab.db.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="Consumption" class="sclab.db.Consumption"/>
<jsp:useBean id="ConsumptionCtrl" class="sclab.db.ConsumptionCtrl"/>

<% 
	ArrayList<ArrayList<String>> days7Usage = ConsumptionCtrl.get7dayUsage("부개1동");
  	String[] weekUsage = ConsumptionCtrl.getWeekUsage("부개1동");
  	String[] monthUsage = ConsumptionCtrl.getMonthUsage("부개1동");
  	
%>	
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var today_data = google.visualization.arrayToDataTable([
				[ "Data", "Water Data", {
					role : "style"
				} ], [ "Used", <%=days7Usage.get(0).get(0)%>, "blue" ], [ "Predicted", <%=days7Usage.get(0).get(1)%>, "red" ] ]);

		var weekly_data = google.visualization.arrayToDataTable([
				[ "Data", "Water Data", {
					role : "style"
				} ], [ "Used", <%=weekUsage[0]%>, "blue" ], [ "Predicted", <%=weekUsage[1]%>, "red" ] ]);

		var monthly_data = google.visualization.arrayToDataTable([
				[ "Data", "Water Data", {
					role : "style"
				} ], [ "Used", <%=monthUsage[0]%>, "blue" ], [ "Predicted", <%=monthUsage[1]%>, "red" ] ]);

		var today_view = new google.visualization.DataView(today_data);
		today_view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var weekly_view = new google.visualization.DataView(weekly_data);
		weekly_view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var monthly_view = new google.visualization.DataView(monthly_data);
		monthly_view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			width : 380,
			height : 143,
			
			bar : {
				groupWidth : "95%"
			},
			legend : {
				position : "none"
			},
			vAxis : {
				//ticks : [ 0, 5, 10, 15, 20 ],
			gridlines : {count : 4}}
		};

		var today_chart = new google.visualization.ColumnChart(document
				.getElementById("today_chart"));
		today_chart.draw(today_view, options);

		var weekly_chart = new google.visualization.ColumnChart(document
				.getElementById("weekly_chart"));
		weekly_chart.draw(weekly_view, options);

		var monthly_chart = new google.visualization.ColumnChart(document
				.getElementById("monthly_chart"));
		monthly_chart.draw(monthly_view, options);
	}
</script>
