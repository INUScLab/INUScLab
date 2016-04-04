<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, sclab.db.*"%>
<!DOCTYPE HTML>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>연습용</title>

<jsp:useBean id="adctrl" class="sclab.db.AnalysisDataCtrl"/>

<%
   ArrayList<AnalysisData> array_list = adctrl.returnDatas("인천광역시",null,null,null,null,null,null,"2015",null,null,"2015",null,null);
   //ArrayList<AnalysisData> array_list = adctrl.returnDatas("인천광역시",null,null,null,null,null,null,"2015","01",null,"2015","02",null);
   //ArrayList<AnalysisData> array_list = adctrl.returnDatas("인천광역시",null,null,null,null,null,null,"2015","01","31","2015","02","28");
%>

</head>
<body>

<div align="left">
		<table border="1">
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
</body>
</html>