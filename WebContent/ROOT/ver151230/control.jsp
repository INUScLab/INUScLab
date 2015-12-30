<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="temp.db.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="tb" class="temp.db.TempBean"/> 
<jsp:useBean id="consumption" class="temp.db.Consumption"/>

<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	if(action.equals("list")) {
		ArrayList<Consumption> datas = tb.getDBList();
		request.setAttribute("datas", datas);
		//pageContext.include("hello.jsp");
		pageContext.include("graph.jsp");
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {		

	}
	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {

	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {

	}
%>