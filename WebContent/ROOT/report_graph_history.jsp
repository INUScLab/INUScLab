<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="sclab.db.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="Consumption" class="sclab.db.Consumption"/>
<jsp:useBean id="ConsumptionCtrl" class="sclab.db.ConsumptionCtrl"/>

<% 
	ArrayList<ArrayList<String>> days7Usage = ConsumptionCtrl.get7dayUsage("ºÎ°³1µ¿");
  	
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

</script><%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':['corechart', 'timeline']}]}"></script>
  
<script type="text/javascript">
//google.charts.load('current', {packages: ['corechart', 'line']});
google.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Time of Day');
        data.addColumn('number', 'Rating');

        data.addRows([
          [new Date(2015, 0, 1), 5],  [new Date(2015, 0, 2), 7],  [new Date(2015, 0, 3), 3],
          [new Date(2015, 0, 4), 1],  [new Date(2015, 0, 5), 3],  [new Date(2015, 0, 6), 4],
          [new Date(2015, 0, 7), 3],  [new Date(2015, 0, 8), 4],  [new Date(2015, 0, 9), 2],
          [new Date(2015, 0, 10), 5], [new Date(2015, 0, 11), 8], [new Date(2015, 0, 12), 6],
          [new Date(2015, 0, 13), 3], [new Date(2015, 0, 14), 3], [new Date(2015, 0, 15), 5],
          [new Date(2015, 0, 16), 7], [new Date(2015, 0, 17), 6], [new Date(2015, 0, 18), 6],
          [new Date(2015, 0, 19), 3], [new Date(2015, 0, 20), 1], [new Date(2015, 0, 21), 2],
          [new Date(2015, 0, 22), 4], [new Date(2015, 0, 23), 6], [new Date(2015, 0, 24), 5],
          [new Date(2015, 0, 25), 9], [new Date(2015, 0, 26), 4], [new Date(2015, 0, 27), 9],
          [new Date(2015, 0, 28), 8], [new Date(2015, 0, 29), 6], [new Date(2015, 0, 30), 4],
          [new Date(2015, 0, 31), 6], [new Date(2015, 1, 1), 7],  [new Date(2015, 1, 2), 9]
        ]);


        var options = {
          title: 'Rate the Day on a Scale of 1 to 10',
          //width: 900,
          //height: 500,
          hAxis: {
            format: 'M/d/yy',
            gridlines: {count: 15}
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