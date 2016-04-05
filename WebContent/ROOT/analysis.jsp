<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#searchByMonth").addClass("tab_nonvisible");
		$("#searchByYear").addClass("tab_nonvisible");
		
		/* tab 기능 */
		$("#tab_searchByDay").click(function() {
			$("#searchByDay").removeClass("tab_nonvisible");
			$("#searchByMonth").removeClass("tab_visible");
			$("#searchByYear").removeClass("tab_visible");

			$("#searchByDay").addClass("tab_visible");
			$("#searchByMonth").addClass("tab_nonvisible");
			$("#searchByYear").addClass("tab_nonvisible");
		});

		$("#tab_searchByMonth").click(function() {
			$("#searchByMonth").removeClass("tab_nonvisible");
			$("#searchByDay").removeClass("tab_visible");
			$("#searchByYear").removeClass("tab_visible");

			$("#searchByMonth").addClass("tab_visible");
			$("#searchByDay").addClass("tab_nonvisible");
			$("#searchByYear").addClass("tab_nonvisible");
		});
		
		$("#tab_searchByYear").click(function() {
			$("#searchByYear").removeClass("tab_nonvisible");
			$("#searchByDay").removeClass("tab_visible");
			$("#searchByMonth").removeClass("tab_visible");

			$("#searchByYear").addClass("tab_visible");
			$("#searchByDay").addClass("tab_nonvisible");
			$("#searchByMonth").addClass("tab_nonvisible");
		});
		/* tab 기능 */
		
						/* 주소 검색 기능 */
						$('#analysis_guGun_select').change(
						function(e) {
							$('#analysis_umDong_select').html('').append(
									"<option value=''>읍/면/동</option>");
							var optionSelected = $("option:selected", this);
							var textSelected = optionSelected.text();

							var umDong_select = document
									.getElementById("analysis_umDong_select");
							for (var i = 0; i < dongInfoList.length; i++) {
								if (dongInfoList[i].gu == textSelected) {
									var option = document
											.createElement("option");
									option.text = dongInfoList[i].dong;
									umDong_select.add(option);
								}
							}
						});
						/* 주소 검색 기능 */

					});
</script>

<div class="searchBy">
	<div id="tab_searchByDay" class="tab_searchBy">
		<a href="#">일별 사용량 분석</a>
	</div>
	<div id="tab_searchByMonth" class="tab_searchBy">
		<a href="#">월별 사용량 분석</a>
	</div>
	<div id="tab_searchByYear" class="tab_searchBy">
		<a href="#">년별 사용량 분석</a>
	</div>
</div>

<!-- 일별 -->
<div id="searchByDay">
	<jsp:include page="analysis_day.jsp"/>
</div>

<!-- 월별 -->
<div id="searchByMonth">
	<jsp:include page="analysis_month.jsp"/>
</div>

<!-- 년별 -->
<div id="searchByYear">
	<jsp:include page="analysis_year.jsp"/>
</div>
