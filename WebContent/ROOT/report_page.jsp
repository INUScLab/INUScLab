<!--본문태그-->
<div id="report_content">
	<div class="report_info">
		<jsp:include page="report_graph.jsp" flush="false" />
		<ul>
			<li class="info">
				<div id="today_chart"></div>
				<h1>today</h1>
			</li>
			<li class="info">
				<div id="weekly_chart"></div>
				<h1>weekly</h1>
			</li>
			<li class="info">
				<div id="monthly_chart"></div>
				<h1>monthly</h1>
			</li>
		</ul>
	</div>

	<div class="table">
		<jsp:include page="table.jsp" flush="false" />
	</div>

	<div id="history">
		<jsp:include page="report_graph_history.jsp" flush="false" />
	</div>
</div>