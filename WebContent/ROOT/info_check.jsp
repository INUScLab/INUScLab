<%!
	boolean isset(String stri)
	{
		if(str == null) return false;
		if(str.equals("")) return false;
		return true;
	}
%>

<%
	if(!isset(request.getParameter("member_id")))
	{    
		out.println("<script>alert('ID가 입력되지 않았습니다.');</script>");
	} 
	else if(!isset(request.getParameter("member_password")))
	{
		out.println("<script>alert('암호가 입력되지 않았습니다.');</script>");
	}
	else
	{
		// 미리 정의된 ID와 암호 //
		String member_id = "sclab";
		String member_password = "422";

		// ID 잘못 입력 시 //
		if (!request.getParameter("member_id").equals(member_id))
		{
			out.println("<script>alert('ID가 일치하지 않습니다.');</script>");
		}
		// 암호 잘못 입력 시 //
		else if (!request.getParameter("member_password").equals(member_password))
		{
			out.println("<script>alert('암호가 일치하지 않습니다.');</script>");
		}
		// 로그인 성공 //
		else
		{ 
			/* 세션에 로그인 ID와 암호를 기억시키고 세션 정보로서 사용 */
			session.setAttribute("member_id", request.getParameter("member_id"));
			session.setAttribute("member_password", request.getParameter("member_password"));
		}
	}
%>
<meta http-equiv="refresh" content="0; url=index.jsp" />
