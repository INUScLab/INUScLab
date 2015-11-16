<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String head = "";
	String body = "";

	if (!isset((String)session.getAttribute("member_id")) || !isset((String)session.getAttribute("member_password")))
	{
		head = "login_head.jsp";
		body = "login_body.jsp";
	}
	else
	{
		head = "logon_head.jsp";
		body = "logon_body.jsp";
	}

	pageContext.setAttribute("HEAD_PATH", head);
	pageContext.setAttribute("BODY_PATH", body);
%>
<%!
    boolean isset(String str)
    {
        if(str == null) return false;
        if(str.equals("")) return false;
        return true;
    }
%>