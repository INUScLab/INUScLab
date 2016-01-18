<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/headerCSS.css">
<link rel="stylesheet" type="text/css" href="css/dashboard_page.css">
<title>Big Data Analysis</title>
<script type="text/javascript">

function sendIt(){
	var f = document.search_form;
	
	f.action = "<%=cp%>/ROOT/dashboard_sub.jsp";
	f.submit();
}
</script>


</head>
<body>

	<div id="dashboard_page">
		<div id="dashboard_search">
			<!--form action="" name="search_form" method="post">
			<div id="juso_search"></div>
			<div id="date_search" class="search">기간 : 
				<div id="start_search" class="search">
					<input type="text" name="startDate" size="10"/><img alt="calendar" src="./img/calendar.png">
				</div>
				&nbsp;-&nbsp;
				<div id="end_search" class="search">
					<input type="text" name="endDate" size="10"/><img alt="calendar" src="./img/calendar.png">
				</div>
			</div>
			<input type="button" value="검색" onclick="sendIt();"/>
		</form-->

			<form action="" name="search_form" method="post">
				<table cellpadding="0" cellspacing="0" class="table_main">
					<tr>
						<td id="juso_search">&nbsp;</td>

						<td align="center" width="50px">기간:</td>
						<td id="date_search">
							<table cellpadding="0" cellspacing="0" class="table_date">
								<tr>
									<td>
										<div class="Date_wrap">
											<input type="text" class="startDate" name="startDate" size="10"/> 
											<img alt="calendar" src="./img/calendar.png" id="calendar" width="25px" height="25px">
										</div>
									</td>
									<td>&nbsp;-&nbsp;</td>
									<td>
										<div class="endDate Date_wrap">
											<input type="text" class="endDate" name="endDate" size="10" />
											<img alt="calendar" src="./img/calendar.png" width="25px" height="25px"> 
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td width="50">
							<input type="button" value="검색" onclick="sendIt();" />
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div id="dashboard_summary">
			<div class="summary_wrap summary_wrap_left">
				<div class="summary diff_summary"><!-- #1 -->
					사용량 예측량 차이
					<div>
						
					</div>				
				</div>
				<div class="summary leak_summary"><!-- #2 -->
					누수
					<div>
					
					</div>
				</div>
			</div>
			<div class="summary_wrap summary_wrap_right">
				<div class="summary overused_summary"><!-- #4 -->
					과용
					<div>
					
					</div>
				</div>
				<div class="summary freezed_summary"><!-- #5 -->
					동파
					<div>
					
					</div>
				</div>
			</div>
			<div class="summary absence_summary"><!-- #3 -->
				부재
				<div>
				
				</div>
			</div>
			
		</div>
		
		<div id="dashboard_info">
			<div class="diff"></div>
			<div class="leak"></div>
			<div class="absence"></div>
			<div class="overused"></div>
			<div class="freezed"></div>
		</div>
	</div>




</body>
</html>