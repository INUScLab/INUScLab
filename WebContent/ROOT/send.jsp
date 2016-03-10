<%@page contentType= "text/html; charset=utf-8"  import="sclab.db.*, java.util.*"%>

<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <jsp:useBean id="lg" class="sclab.db.Login"/> <!-- Login lg = new Login(); 와 같은 의미     즉  sclab.db.login 의 객체 lg -->
  </head>
  <body>

   <%
     String id = request.getParameter("id");
     String password = request.getParameter("password");
     
     String result = lg.checkId(id,password);
     if(result != null && result.equals("0")){
        response.sendRedirect("main.jsp");
     }
     else{
		out.println("<script>alert('로그인에 실패했습니다.');</script>");
		out.println("<script>document.location.href='login.jsp';</script>");
     }
   %>

  </body>
</html>