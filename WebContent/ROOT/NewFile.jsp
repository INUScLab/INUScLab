<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("utf-8"); %>

<%
	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// 데이터베이스 연결관련 정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://sclab-database.ccf2v8m44pmt.ap-northeast-1.rds.amazonaws.com:3306/sclab";
	//String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb";
	try{
		//JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		
		//데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url,"sclab","sclab422");
		
	}
	catch(Exception e){
		System.out.println(e);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		//select 문장을 문자열 형태로 구성
		String sql = "SELECT * FROM CONSUMPTION";
		
		pstmt = conn.prepareStatement(sql);
		
		ResultSet rs =pstmt.executeQuery();
		int i =1;
		
		while(rs.next()){
			out.println(i+" : "+rs.getString(1)+" ,"+rs.getString(2)+" ,"+rs.getString(3)+" ,"+rs.getString(4)+" ,"+"<BR>");
			i++;
		}
		
		rs.close();
		pstmt.close();
		conn.close();
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
</body>
</html>