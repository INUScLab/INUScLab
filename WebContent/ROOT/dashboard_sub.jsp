<%@page import="java.util.*, sclab.db.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	
	
	//response.sendRedirect("dashboard.jsp");
%>

<jsp:useBean id="pd" class="sclab.db.ProcessedData"/>
<jsp:useBean id="pdctrl" class="sclab.db.ProcessedDataCtrl"/>
<% pd = pdctrl.returnRanks("인천광역시","부평구","부개1동",startDate,endDate);%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {

    	
        var data = google.visualization.arrayToDataTable([
			['동', '차이량'],
			<%
				for(ArrayList<String>  ab : pd.getrank_difference() ) {
			%>
         		['work',<%=ab.get(1)%>],
         	<%
				}
		 	%>	
        ]);
	 
        var options = {
          title: 'Water Consumption'
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
</script>
</head>
<body>

<%=startDate %><br/>
<%=endDate %>

<div align="left">
		<table border="1">
			<%
				for(ArrayList<String>  ab : pd.getrank_difference() ) {
			%>
			  <tr>
				<td><%=ab.get(0)%></td><td><%=ab.get(1)%></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</div>

<div id="piechart" style="width: 1000px; height: 500px;"></div>

</body>
</html>