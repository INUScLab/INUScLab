<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%!
    boolean isset(String str)
    {
        if(str == null) return false;
        if(str.equals("")) return false;
        return true;
    }
%>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <%
		session.invalidate(); 
		out.println("<script>alert('정상적으로 로그아웃 되었습니다.');</script>");
	%>
	<meta http-equiv="refresh" content="0; url=index.jsp" />
    </body>
</html>
