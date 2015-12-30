<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="temp.db.*, java.util.*"%>
<!DOCTYPE HTML>
<html>
  <head>
    <jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {

    	 
        var data = google.visualization.arrayToDataTable([
			['Task', 'Hours per Day'],
		<%
		for(Consumption  ab : (ArrayList<Consumption>)datas) {
		%>
          
          ['Work',     <%=ab.getPredict_value()%>],
          ['Eat',     <%=ab.getRaw_value() %>],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
          <%
		}
		 %>
        ]);
	 
        var options = {
          title: 'Water Consumption'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 300px; height: 150px;"></div>
  </body>
</html>