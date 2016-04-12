<%@page import="java.util.*, sclab.db.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	
	String diff_summary = null;
	String leak_summary = null;
	String overused_summary = null;
	String freezed_summary = null;
	String absence_summary = null;
	
	//response.sendRedirect("dashboard.jsp");
%>

<jsp:useBean id="pd" class="sclab.db.ProcessedData"/>
<jsp:useBean id="pdctrl" class="sclab.db.ProcessedDataCtrl"/>
<% 
	pd = pdctrl.returnRanks("인천광역시","부평구","부개1동",startDate,endDate);
	
	diff_summary = pd.getRank_difference().get(0).get(0);
	leak_summary = pd.getRank_leak().get(0).get(0);
	overused_summary = pd.getRank_overused().get(0).get(0);
	freezed_summary = pd.getRank_freezed().get(0).get(0);
	absence_summary = pd.getRank_absence().get(0).get(0);

	request.setAttribute("DIFF_SUMMARY", diff_summary);
	request.setAttribute("LEAK_SUMMARY", leak_summary);
	request.setAttribute("OVERUSED_SUMMARY", overused_summary);
	request.setAttribute("FREEZED_SUMMARY", freezed_summary);
	request.setAttribute("ABSENCE_SUMMARY", absence_summary);


%>

<jsp:forward page="main.jsp?MENU_NUM=4"/>

