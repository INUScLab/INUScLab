<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="sclab.db.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="Consumption" class="sclab.db.Consumption"/>
<jsp:useBean id="ConsumptionCtrl" class="sclab.db.ConsumptionCtrl"/>

<% 
	ArrayList<ArrayList<String>> days7Usage = ConsumptionCtrl.get7dayUsage("부개1동");
  	
%>

<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':['corechart', 'timeline']}]}"></script>
  
<script type="text/javascript">
//google.charts.load('current', {packages: ['corechart', 'line']});
google.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Time of Day');
        data.addColumn('number', 'Rating');

        data.addRows([
          [new Date(2015, 1, 22), <%=days7Usage.get(6).get(0)%>],  [new Date(2015, 1, 23), <%=days7Usage.get(5).get(0)%>],  [new Date(2015, 1, 24), <%=days7Usage.get(4).get(0)%>],  [new Date(2015, 1, 25), <%=days7Usage.get(3).get(0)%>],
          [new Date(2015, 1, 26), <%=days7Usage.get(2).get(0)%>],  [new Date(2015, 1, 27), <%=days7Usage.get(1).get(0)%>],  [new Date(2015, 1, 28), <%=days7Usage.get(0).get(0)%>],
        ]);


        var options = {
          title: 'Rate the Day on a Scale of 1 to 10',
          //width: 900,
          //height: 500,
          hAxis: {
            format: 'M/d/yy'
            //gridlines: {count: 15}
          },
          vAxis: {
            gridlines: {color: 'none'},
            minValue: 0
          }
        };

        var chart = new google.visualization.LineChart(document.getElementById('history'));

        chart.draw(data, options);
      }

</script>