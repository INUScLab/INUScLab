<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%!
    boolean isset(String str)
    {
        if(str == null) return false;
        if(str.equals("")) return false;
        return true;
    }
%>
<!DOCTYPE html>
<html>
<head>
		<title></title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
		<link href="default.css" rel="stylesheet" type="text/css" media="all" />
		<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
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
</head>

<body>
<div id="page" class="container">
	<div id="header">
		<jsp:include page="${HEAD_PATH}" />
	</div>
	<div id="main">
		<br><br><br>
		<div id="welcome">
			<div class="title">
				<h2>Welcome To Water Footprints Visualizing Web</h2>
				<span class="byline">Amazon Web Service EC2 + Spark + Zepllin</span>
			</div>
		</div>
		<div id="featured">
			<br>
			<div id="title">
				<jsp:include page="${BODY_PATH}" />
			</div>
		</div>
		<div id="copyright">
			<span><a href="https://sites.google.com/site/uisclab" target="_blank">&copy; ScLab. All rights reserved.</a></span>
		</div>
	</div>
</div>
</body>
</html>
