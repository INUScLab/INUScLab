<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="Consumption" class="sclab.db.Consumption"/>
<jsp:useBean id="ConsumptionCtrl" class="sclab.db.ConsumptionCtrl"/>

<%-- <% 
	ArrayList<ArrayList<String>> days7Usage = ConsumptionCtrl.get7dayUsage("부개1동");
  	String[] weekUsage = ConsumptionCtrl.getWeekUsage("부개1동");
  	String[] monthUsage = ConsumptionCtrl.getMonthUsage("부개1동");
  	
%> --%>	
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

google.charts.load("current", {
	packages : [ 'corechart' ]
});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {

	
	
	
	
	
}

</script>