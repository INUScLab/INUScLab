<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="sclab.db.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="Consumption" class="sclab.db.Consumption"/>
<jsp:useBean id="ConsumptionCtrl" class="sclab.db.ConsumptionCtrl"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>table</title>
</head>

<body>
<div align="center">
<form>
	<table class="table_info">
		<tr>
		<td>구역</td><td>월 사용량</td><td>주 사용량</td>
		<td>오늘</td><td>1일 전</td><td>2일 전</td><td>3일 전</td><td>4일 전</td><td>5일 전</td><td>6일 전</td>
		</tr>
		<%
		   // 여기 동 집어 넣는 부분은 임시부분입니다.
			ArrayList<String> umdongs = new ArrayList<String>();
			umdongs.add("부개1동");
			umdongs.add("부개2동");
			umdongs.add("부평1동");
			umdongs.add("부평2동");
			for(String umdong : umdongs){
				ArrayList<ArrayList<String>> days7Usage = ConsumptionCtrl.get7dayUsage(umdong);
			  	String[] weekUsage = ConsumptionCtrl.getWeekUsage(umdong);
			  	String[] monthUsage = ConsumptionCtrl.getMonthUsage(umdong);
		%>
		<tr>
		<td><%=umdong%></td><td><%=monthUsage[0]%></td><td><%=weekUsage[0]%></td>
		<td><%=days7Usage.get(0).get(0)%></td><td><%=days7Usage.get(1).get(0)%></td><td><%=days7Usage.get(2).get(0)%></td>
		<td><%=days7Usage.get(3).get(0)%></td><td><%=days7Usage.get(4).get(0)%></td><td><%=days7Usage.get(5).get(0)%></td>
		<td><%=days7Usage.get(6).get(0)%></td>
		</tr>
		<tr>
		<td><%=umdong%></td><td><%=monthUsage[1]%></td><td><%=weekUsage[1]%></td>
		<td><%=days7Usage.get(0).get(1)%></td><td><%=days7Usage.get(1).get(1)%></td><td><%=days7Usage.get(2).get(1)%></td>
		<td><%=days7Usage.get(3).get(1)%></td><td><%=days7Usage.get(4).get(1)%></td><td><%=days7Usage.get(5).get(1)%></td>
		<td><%=days7Usage.get(6).get(1)%></td>
		</tr>
		<%
			}
		%>
	</table>
</form>
</div>
</body>
</html>