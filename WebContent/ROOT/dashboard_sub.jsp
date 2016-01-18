<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	
	
	//response.sendRedirect("dashboard.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=startDate %><br/>
<%=endDate %>




</body>
</html>