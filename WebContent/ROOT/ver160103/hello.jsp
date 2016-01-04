<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, sclab.db.*"%>
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
안녕
<form>
		<table border="1">
			<%
				for(User  ab : (ArrayList<User>)datas) {
			%>
			  <tr>
				<td><%=ab.getSigoon() %></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</form>
</div>
</body>
</html>