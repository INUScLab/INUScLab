<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, temp.db.*"%>
<!DOCTYPE HTML>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:목록화면</title>

</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<body>
<div align="center">
<HR>
<form>
		<table border="1">
			<%
				for(Consumption  ab : (ArrayList<Consumption>)datas) {
			%>
			  <tr>
			   <td><%=ab.getCode() %></td>
				<td><%=ab.getDate() %></td>
				<td><%=ab.getPredict_value() %></td>
				<td><%=ab.getRaw_value() %></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</form>

</div>
</body>
</html>