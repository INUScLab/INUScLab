<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="sclab.db.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="User" class="sclab.db.User"/>

<div id="map_canvas" style="width: 100%; height: 100%;" >
	<script type="text/javascript"> /*initialize(0, 0); */ </script>
	<script type="text/javascript" src='https://www.google.com/jsapi?autoload={"modules":[{"name":"visualization","version":"1","packages":["corechart","controls","table"]}]}'></script>
</div>

