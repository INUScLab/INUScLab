var globalGeocoder;
var globalMap;
var geocoder = new google.maps.Geocoder();
var searchMarker = new google.maps.Marker();
var searchMarkers = [];
var entireDongMarkers = [];
var overUsedDongMarkers = [];
var leakDongMarkers = [];
var freezedDongMarkers = [];
var absenceDongMarkers = [];
var detailMarkers = [];
var cons_sum = 0;
var cnt_leak = 0;
var cnt_absence = 0;
var entire_flag = false;
var leak_flag = false;
var freezed_flag = false;
var absence_flag = false;
var initial_flag = false;

// 맵 초기화
function initialize(x, y) {

	// Incheon
	if (x == 0)
		x = 37.4562557;
	if (y == 0)
		y = 126.70520620000002;

	globalGeocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(x, y);

	var myOptions = {
		zoom : 13,
		center : latlng,
		navigationControl: false,    // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택..
		navigationControlOptions: { 
			position: google.maps.ControlPosition.TOP_RIGHT,
			style: google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
		},
		streetViewControl : false,
		scaleControl : false, // 지도 축적 보여줄 것인지.
		mapTypeControl : false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};

	globalMap = new google.maps.Map(document.getElementById("map_canvas"),
			myOptions);

	// Search Box
	var input = document.getElementById('pac-input');

	// Color-interpolation Box
	var colorBox = document.getElementById('color-interpolation');

	// Appending boxes
	// globalMap.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	globalMap.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(colorBox);

	createEntireDongMarker();
	createLeakDongMarker();
	createFreezedDongMakrer();
	createAbsenceDongMarker();
	

	// Zoom Changed Event
	globalMap.addListener('zoom_changed', function() {
		console.log(globalMap.getZoom());
		if (globalMap.getZoom() < 16) {
			
			// 상세 주소 마커 지우기.
			hideDetailMarkers();
			
			// FLAG가 켜진 동을 출력.
			showIcon();
			
			//첫 로딩 
			if(absence_flag == false && leak_flag == false && freezed_flag == false && entire_flag == false ) {
				showEntireDongMarkers();
				console.log("?");
			}
			
		}
		// 줌을 확대했을때 map center와 일정한 거리 안에 들어오는 동은 전부 상세 주소 출력.
		else if (globalMap.getZoom() == 16) {

			// console.log('Zoom: ' + globalMap.getCenter());

		}
	});

	// autoComplete Event
	var autocomplete = new google.maps.places.Autocomplete(input);
	google.maps.event.addDomListener(window, 'load', initialize);

	/* jQuery for SELECT BOX */
	$('#umDong_select').change(
			function(e) {
				var optionSelected = $("option:selected", this);
				var textSelected = optionSelected.text();

				for (var i = 0; i < guDongLatLngList.length; i++) {
					if (guDongLatLngList[i].umDong == textSelected) {

						// 여기다가 요약 리포트 추가 코드 넣으셈 수창
						var addressArray = [];
						addressArray[0] = "인천광역시";
						addressArray[1] = guDongLatLngList[i].guGun;
						addressArray[2] = guDongLatLngList[i].umDong;
						dongSummary(addressArray);

						globalMap.setOptions({
							'zoom' : 16
						});
						globalMap.setCenter(new google.maps.LatLng(
								guDongLatLngList[i].lat,
								guDongLatLngList[i].lng));
					}
				}
			});

	$('#guGun_select').change(function(e) {
		$('#umDong_select').html('').append("<option value=''>읍/면/동</option>");
		var optionSelected = $("option:selected", this);
		var textSelected = optionSelected.text();

		var umDong_select = document.getElementById("umDong_select");
		for (var i = 0; i < DongSummaryReportList.length; i++) {
			if (DongSummaryReportList[i].guGun == textSelected) {
				var option = document.createElement("option");
				option.text = DongSummaryReportList[i].umDong;
				console.log(option.text);
				umDong_select.add(option);
			}
		}
	});
	
}

// 전체 사용자들 가운데 누수/동파/부재중에 해당하는 사용자들을 포함하는 동을 빨간색, 나머지는 초록색으로 표시
function createEntireDongMarker() {
	
	//remove duplicate element
	Array.prototype.unique = function() {
	    var a = this.concat();
	    for(var i=0; i<a.length; ++i) {
	        for(var j=i+1; j<a.length; ++j) {
	            if(a[i] === a[j])
	                a.splice(j--, 1);
	        }
	    }

	    return a;
	};
	
	var abNormalDongList = leakDongList.concat(freezedDongList);
	abNormalDongList = abNormalDongList.concat( absenceDongList ).unique();
	
	var color="";
	var abNormalColor = "FF0000";
	var normalColor = "00FFBF";
	var incheon = "인천광역시"
	
	for( var i = 0 ; i < guDongLatLngList.length ; i ++ ) {
		if( abNormalDongList.indexOf(guDongLatLngList[i].umDong) == -1 ) {
			color = normalColor;
		}
		else{
			color = abNormalColor;
		}
		var pinImage = new google.maps.MarkerImage(
				"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
				+ color, new google.maps.Size(21, 34),
				new google.maps.Point(0, 0), new google.maps.Point(10,
						34));
		var pinShadow = new google.maps.MarkerImage(
				"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
				new google.maps.Size(40, 37), new google.maps.Point(0,
						0), new google.maps.Point(12, 35));
		
		// Craete marker
		var marker = new google.maps.Marker({
			title : incheon + " " + guDongLatLngList[i].guGun + " "
			+ guDongLatLngList[i].umDong,
			position : new google.maps.LatLng(guDongLatLngList[i].lat,
					guDongLatLngList[i].lng),
					draggable : false,
					icon : pinImage,
					shadow : pinShadow,
		});
		
		entireDongMarkers.push(marker);
		
	}
	showEntireDongMarkers();
	getEntireMksInfo();
	
}

// 과용한 사용자를 포함하는 동의 마커를 생성하는 함수
function createOverUsedDongMarker() {

	var redColor = "FF0000";
	var incheon = "인천광역시";

	for (var i = 0; i < overUsedDongList.length; i++) {

		for (var j = 0; j < guDongLatLngList.length; j++) {
			if (overUsedDongList[i] == guDongLatLngList[j].umDong) {

				var pinImage = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
								+ redColor, new google.maps.Size(21, 34),
						new google.maps.Point(0, 0), new google.maps.Point(10,
								34));
				var pinShadow = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
						new google.maps.Size(40, 37), new google.maps.Point(0,
								0), new google.maps.Point(12, 35));

				// Craete marker
				var marker = new google.maps.Marker({
					title : incheon + " " + guDongLatLngList[j].guGun + " "
							+ guDongLatLngList[j].umDong,
					position : new google.maps.LatLng(guDongLatLngList[j].lat,
							guDongLatLngList[j].lng),
					draggable : false,
					icon : pinImage,
					shadow : pinShadow,
				});

				overUsedDongMarkers.push(marker);
			}
		}

	}
}

// 누수인 사용자를 포함하는 동의 마커를 생성하는 함수
function createLeakDongMarker() {
	var redColor = "FF0000";
	var incheon = "인천광역시";

	for (var i = 0; i < leakDongList.length; i++) {

		for (var j = 0; j < guDongLatLngList.length; j++) {
			if ( guDongLatLngList[j].umDong == leakDongList[i] ) {
				var pinImage = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
								+ redColor, new google.maps.Size(21, 34),
						new google.maps.Point(0, 0), new google.maps.Point(10,
								34));
				var pinShadow = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
						new google.maps.Size(40, 37), new google.maps.Point(0,
								0), new google.maps.Point(12, 35));

				// Craete marker
				var marker = new google.maps.Marker({
					title : incheon + " " + guDongLatLngList[j].guGun + " "
							+ guDongLatLngList[j].umDong,
					position : new google.maps.LatLng(guDongLatLngList[j].lat,
							guDongLatLngList[j].lng),
					draggable : false,
					icon : pinImage,
					shadow : pinShadow,
				});

				leakDongMarkers.push(marker);
			}
		}
	}
	getLeakMksInfo();
}

// 동파인 사용자를 포함하는 동의 마커를 생성하는 함수
function createFreezedDongMakrer() {
	var redColor = "FF0000";
	var incheon = "인천광역시";
	
	for (var i = 0; i < freezedDongList.length; i++) {
		
		for (var j = 0; j < guDongLatLngList.length; j++) {
			if (freezedDongList[i] == guDongLatLngList[j].umDong) {
				
				var pinImage = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
						+ redColor, new google.maps.Size(21, 34),
						new google.maps.Point(0, 0), new google.maps.Point(10,
								34));
				var pinShadow = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
						new google.maps.Size(40, 37), new google.maps.Point(0,
								0), new google.maps.Point(12, 35));
				
				// Craete marker
				var marker = new google.maps.Marker({
					title : incheon + " " + guDongLatLngList[j].guGun + " "
					+ guDongLatLngList[j].umDong,
					position : new google.maps.LatLng(guDongLatLngList[j].lat,
							guDongLatLngList[j].lng),
							draggable : false,
							icon : pinImage,
							shadow : pinShadow,
				});
				
				freezedDongMarkers.push(marker);
			}
		}
	}
	getFreezedMksInfo();
}

// 부재중인 사용자를 포함하는 동의 마커를 생성하는 함수
function createAbsenceDongMarker() {
	var redColor = "FF0000";
	var incheon = "인천광역시";
	
	for (var i = 0; i < absenceDongList.length; i++) {
		
		for (var j = 0; j < guDongLatLngList.length; j++) {
			if (absenceDongList[i] == guDongLatLngList[j].umDong) {
				
				var pinImage = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
						+ redColor, new google.maps.Size(21, 34),
						new google.maps.Point(0, 0), new google.maps.Point(10,
								34));
				var pinShadow = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
						new google.maps.Size(40, 37), new google.maps.Point(0,
								0), new google.maps.Point(12, 35));
				
				// Craete marker
				var marker = new google.maps.Marker({
					title : incheon + " " + guDongLatLngList[j].guGun + " "
					+ guDongLatLngList[j].umDong,
					position : new google.maps.LatLng(guDongLatLngList[j].lat,
							guDongLatLngList[j].lng),
							draggable : false,
							icon : pinImage,
							shadow : pinShadow,
				});
				
				absenceDongMarkers.push(marker);
			}
		}
	}
	getAbsenceMksInfo();
}

// 요약 report column 그래프(사용량, 예측량, 일주일 평균, 지역 평균
function drawColumn(cons, pred, week, region) {
	var data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
		role : "style"
	} ], [ '사용량', cons, '#b87333' ], // RGB value
	[ '예측량', pred, 'silver' ], // English color name
	[ '일주일 평균', week, '#b87333' ], [ '지역 평균', region, '#b87333' ] ]);

	var view = new google.visualization.DataView(data);
	view.setColumns([ 0, 1, {
		calc : "stringify",
		sourceColumn : 1,
		type : "string",
		role : "annotation"
	}, 2 ]);

	var options = {
		titleTextStyle : {
			color : "black",
			fontSize : 17
		},
		width : "100%",
		height : "100%",
		fontSize : 11,
		bar : {
			groupWidth : "80%"
		},
		legend : {
			position : "none"
		},
	};

	chart = new google.visualization.ColumnChart(document
			.getElementById("info_graph"));

	chart.draw(view, options);
}

// 부가서비스 누수 column 그래프
function drawLeak(cons, pred, upperName, Name) {
	var data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
		role : "style"
	} ], [ Name, cons, '#b87333' ], // RGB value
	[ upperName + '평균', pred, 'silver' ] // English color name
	]);

	var view = new google.visualization.DataView(data);
	view.setColumns([ 0, 1, {
		calc : "stringify",
		sourceColumn : 1,
		type : "string",
		role : "annotation"
	}, 2 ]);

	var options = {
		title : "누수횟수",
		titleTextStyle : {
			color : "black",
			fontSize : 12
		},
		// width : "50%",
		// height : "100%",
		fontSize : 11,
		bar : {
			groupWidth : "50%"
		},
		legend : {
			position : "none"
		},
	};

	chart = new google.visualization.ColumnChart(document
			.getElementById("leak_graph"));

	chart.draw(view, options);
}

// 부가서비스 부재중 알람 column 그래프
function drawAbsence(cons, pred, upperName, Name) {
	var data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
		role : "style"
	} ], [ Name, cons, '#b87333' ], // RGB value
	[ upperName + '평균', pred, 'silver' ] // English color name
	]);

	var view = new google.visualization.DataView(data);
	view.setColumns([ 0, 1, {
		calc : "stringify",
		sourceColumn : 1,
		type : "string",
		role : "annotation"
	}, 2 ]);

	var options = {
		title : "부재중 알람 횟수",
		titleTextStyle : {
			color : "black",
			fontSize : 12
		},
		// width : "50%",
		// height : "100%",
		fontSize : 11,
		bar : {
			groupWidth : "50%"
		},
		legend : {
			position : "none"
		},
	};

	chart = new google.visualization.ColumnChart(document
			.getElementById("absence_graph"));

	chart.draw(view, options);
}

// 일주일간 히스토리 꺾은선 그래프 그리는 함수
function drawHistory(day1, day2, day3, day4, day5, day6, day7, avg) {

	var data = new google.visualization.DataTable();
	data.addColumn('date', 'Time of Day');
	data.addColumn('number', 'Consumption');
	data.addColumn('number', 'Average');

	/*
	 * data.addRows([ [new Date(2015, 1, 22), <%=days7Usage.get(6).get(0)%>],
	 * [new Date(2015, 1, 23), <%=days7Usage.get(5).get(0)%>], [new Date(2015,
	 * 1, 24), <%=days7Usage.get(4).get(0)%>], [new Date(2015, 1, 25),
	 * <%=days7Usage.get(3).get(0)%>], [new Date(2015, 1, 26),
	 * <%=days7Usage.get(2).get(0)%>], [new Date(2015, 1, 27),
	 * <%=days7Usage.get(1).get(0)%>], [new Date(2015, 1, 28),
	 * <%=days7Usage.get(0).get(0)%>], ]);
	 */

	data.addRows([ [ new Date(2015, 1, 22), day1, avg ],
			[ new Date(2015, 1, 23), day2, avg ],
			[ new Date(2015, 1, 24), day3, avg ],
			[ new Date(2015, 1, 25), day4, avg ],
			[ new Date(2015, 1, 26), day5, avg ],
			[ new Date(2015, 1, 27), day6, avg ],
			[ new Date(2015, 1, 28), day7, avg ], ]);

	var options = {
		// width: 900,
		// height: 500,
		title : "일주일 간 history",

		titleTextStyle : {
			color : "black",
			fontSize : 17
		},
		hAxis : {
			format : 'yy-MM-dd'
		// gridlines: {count: 15}
		},
		vAxis : {
			gridlines : {
				color : 'none'
			},
			minValue : 900,
			maxValue : 1100
		},
		legend : {
			position : "bottom"
		},
		series : {
			1 : {
				lineDashStyle : [ 5, 5 ]
			}
		}
	};

	var chart = new google.visualization.LineChart(document
			.getElementById('info_history'));

	chart.draw(data, options);
}

// 배열 내 중복된 값 제거하는 함수
function removeArrayDuplicate(array) {
	var a = {};

	for (var i = 0; i < array.length; i++) {
		if (typeof a[array[i]] == "undefined")
			a[array[i]] = 1;
	}
	array.length = 0;
	for ( var i in a)
		array[array.length] = i;
	return array;
}

// 동 요약 리포트
function dongSummary(addressArray) {

	var len = addressArray.length;
	var siGoonSum = 0;
	var siGoonLen = [];
	var pred_sum = 0;
	var weeks_sum = 0;
	var day1 = 0;
	var day2 = 0;
	var day3 = 0;
	var day4 = 0;
	var day5 = 0;
	var day6 = 0;
	var day7 = 0;
	var leak_date = "";
	var monthAvg = 0;
	var absence_date = "null";
	var address = "";
	var siGoonLeak = 0;
	var siGoonAbsence = 0;
	cons_sum = 0;
	cnt_leak = 0;
	cnt_absence = 0;

	for (var i = 0; i < len; i++) {
		address += addressArray[i] + ' ';
	}

	for (var j = 0; DongSummaryReportList[j]; j++) {
		// 히스토리
		if (addressArray[len - 1] == DongSummaryReportList[j].umDong) {
			day1 = Number(DongSummaryReportList[j].day1);
			day2 = Number(DongSummaryReportList[j].day2);
			day3 = Number(DongSummaryReportList[j].day3);
			day4 = Number(DongSummaryReportList[j].day4);
			day5 = Number(DongSummaryReportList[j].day5);
			day6 = Number(DongSummaryReportList[j].day6);
			day7 = Number(DongSummaryReportList[j].day7);
			leak_date = DongSummaryReportList[j].latelyLeak;
			monthAvg = Number(DongSummaryReportList[j].monthAverage);
			;
		}
	}

	// 동 사용량 예측량
	for (var j = 0; userConsumptionList[j] != null; j++) {
		if (addressArray[len - 2] == userConsumptionList[j].siGoon) {
			siGoonSum += Number(userConsumptionList[j].consumed);
			siGoonLen.push(userConsumptionList[j].umDong);
			if (userConsumptionList[j].leak == '1') {
				siGoonLeak++;
			} else if (userConsumptionList[j].absence == '1') {
				siGoonAbsence++;
				console.log(userConsumptionList[j].umDong);
			}
		}
		if (addressArray[len - 1] == userConsumptionList[j].umDong) {
			cons_sum += Number(userConsumptionList[j].consumed);
			pred_sum += Number(userConsumptionList[j].predicted);

			// 누수인 사람
			if (userConsumptionList[j].leak == '1') {
				cnt_leak++;
			}

			// 부재중 알람
			if (userConsumptionList[j].absence == '1') {
				cnt_absence++;
			}
		}
	}
	siGoonLen = removeArrayDuplicate(siGoonLen);// 중복제거
	weeks_sum = day1 + day2 + day3 + day4 + day5 + day6 + day7;

	// 요약 report 주소칸
	document.getElementById('info_date').innerHTML = address; // 주소 출력
	info_date.style.fontSize = "100%"; // 주소 출력 폰트 사이즈

	if (leak_date != "null")
		document.getElementById('leak_text').innerHTML = '최근 누수 날짜 :' + ' '
				+ leak_date;
	else
		document.getElementById('leak_text').innerHTML = '최근 누수 날짜 :';

	if (absence_date != "null")
		document.getElementById('absence_text').innerHTML = '최근 부재중 날짜 :' + ' '
				+ absence_date;
	else
		document.getElementById('absence_text').innerHTML = '최근 부재중 날짜 :';

	// 요약 report 사용량,예측량,평균
	drawColumn(Math.round(cons_sum), Math.round(pred_sum), Math
			.round(weeks_sum / 7), Math.round(siGoonSum / siGoonLen.length)); // column
	// 그래프
	// 그리기
	// (사용량,
	// 예측량
	// ,
	// 일주일
	// 평균,
	// 지역평균)
	// 요약 report history 그래프 그리기
	drawHistory(day7, day6, day5, day4, day3, day2, day1, monthAvg);

	// 요약 report 부가서비스 누수, 부재
	drawLeak(cnt_leak, (siGoonLeak / siGoonLen.length).toFixed(2),
			addressArray[len - 2], addressArray[len - 1]); // 동 누수 발생 횟수, 지역 평균
	// 발생 횟수
	drawAbsence(cnt_absence, (siGoonAbsence / siGoonLen.length).toFixed(2),
			addressArray[len - 2], addressArray[len - 1]); // 동 부재중 발생 횟수, 지역
	// 평균 발생 횟수

	// 지도에 동에 해당하는 상세 주소 마커 띄우기 
	getDetailAreaInformation(addressArray);
}

// 사용자 요약 리포트
function userSummary(addressArray) {

	var len = addressArray.length;
	var cons = 0;
	var len_detail = detailMarkers.length;
	var pred = 0;
	var leak = 0;
	var absence = 0;
	var leak_date = "";
	var address = ""

	for (var i = 0; i < len; i++) {
		address += addressArray[i] + ' ';
	}

	// 사용자 사용량 예측량
	for (var j = 0; userConsumptionList[j] != null; j++) {

		if (addressArray[len - 1] == userConsumptionList[j].detail) {
			cons = Number(userConsumptionList[j].consumed);
			pred = Number(userConsumptionList[j].predicted);

			// 누수인 사람
			if (userConsumptionList[j].leak == '1') {
				leak++;
			}

			// 부재중 알람
			if (userConsumptionList[j].absence == '1') {
				absence++;
			}
		}
	}
	document.getElementById('info_date').innerHTML = address;
	info_date.style.fontSize = "100%";
	document.getElementById('leak_text').innerHTML = '누수 날짜 :' + leak_date;
	document.getElementById('absence_text').innerHTML = '부재중 날짜 :'

	drawColumn(Math.round(cons), Math.round(pred), 0, Math.round(cons_sum
			/ len_detail)); // column 그래프 (사용량, 예측량, 일주일 평균, 지역평균)
	drawHistory(); // history 그래프 그리기
	drawLeak(leak, (cnt_leak / len_detail).toFixed(2), addressArray[len - 2],
			addressArray[len - 1]); // 누수횟수, 지역평균 누수횟수,
	drawAbsence(absence, (cnt_absence / len_detail).toFixed(2),
			addressArray[len - 2], addressArray[len - 1]); // 부재중 횟수,
	// 지역평균 횟수
}

//전체 동을 클릭했을때 
function getEntireMksInfo() {
	for (var i = 0; i <entireDongMarkers.length; i++) {
		entireDongMarkers[i].addListener('click', function() {

			globalMap.setCenter(this.position);
			var address = this.title;
			var addressArray = address.split(' ');
			dongSummary(addressArray) // 요약 리포트
		});
	}
}

//누수인 동을 클릭했을때 
function getLeakMksInfo() {
	for (var i = 0; i < leakDongMarkers.length; i++) {
		leakDongMarkers[i].addListener('click', function() {
			
			globalMap.setCenter(this.position);
			var address = this.title;
			var addressArray = address.split(' ');
			dongSummary(addressArray) // 요약 리포트
		});
	}
}

//동파인 동을 클릭했을때 
function getFreezedMksInfo() {
	for (var i = 0; i < freezedDongMarkers.length; i++) {
		freezedDongMarkers[i].addListener('click', function() {
			
			globalMap.setCenter(this.position);
			var address = this.title;
			var addressArray = address.split(' ');
			dongSummary(addressArray) // 요약 리포트
		});
	}
}

//부재중인 동을 클릭했을때 
function getAbsenceMksInfo() {
	for (var i = 0; i < absenceDongMarkers.length; i++) {
		absenceDongMarkers[i].addListener('click', function() {
			
			globalMap.setCenter(this.position);
			var address = this.title;
			var addressArray = address.split(' ');
			dongSummary(addressArray) // 요약 리포트
		});
	}
}

//전체 동들의 마커를 지도에 출력 
function showEntireDongMarkers () {
	for (var i = 0 ; i < entireDongMarkers.length ; i ++ ) {
		entireDongMarkers[i].setMap(globalMap);
	}
}

// 누수된 동들의 마커를 지도에 출력
function showLeakDongMarkers() {
	for (var i = 0; i < leakDongMarkers.length; i++) {
		leakDongMarkers[i].setMap(globalMap);
	}
}

// 동파된 동들의 마커를 지도에 출력
function showFreezedDongMarkers() {
	for (var i = 0; i < freezedDongMarkers.length; i++) {
		freezedDongMarkers[i].setMap(globalMap);
	}
}

// 부재중인 동들의 마커를 지도에 출력
function showAbsenceDongMarkers() {
	for (var i = 0; i < absenceDongMarkers.length; i++) {
		absenceDongMarkers[i].setMap(globalMap);
	}
}

// 과용된 동들의 마커를 지도에 출력
function showoverUsedDongMarkers() {
	for (var i = 0; i < overUsedDongMarkers.length; i++) {
		overUsedDongMarkers[i].setMap(globalMap);
	}
}

//전체 동들의 마커를 지도에서 숨김
function hideEntireDongMarkers(){
	
	for (var i = 0; i < entireDongMarkers.length; i++) {
		entireDongMarkers[i].setMap(null);
	}
}

// 과용된 동들의 마커를 지도에서 숨김
function hideoverUsedDongMarkers() {
	for (var i = 0; i < overUsedDongMarkers.length; i++) {
		overUsedDongMarkers[i].setMap(null);
	}
}

// 누수된 동들의 마커를 지도에서 숨김
function hideLeakDongMarkers() {
	for (var i = 0; i < leakDongMarkers.length; i++) {
		leakDongMarkers[i].setMap(null);
	}
}

// 동파된 동들의 마커를 지도에서 숨김
function hideFreezedDongMarkers() {
	for (var i = 0; i < freezedDongMarkers.length; i++) {
		freezedDongMarkers[i].setMap(null);
	}
}

// 부재중인 동들의 마커를 지도에서 숨김
function hideAbsenceDongMarkers() {
	for (var i = 0; i < absenceDongMarkers.length; i++) {
		absenceDongMarkers[i].setMap(null);
	}
}

// 세부 사용자들의 마커를 지도에 출력
function showDetailMarkers() {
	for (var i = 0; i < detailMarkers.length; i++) {
		detailMarkers[i].setMap(globalMap);
	}
}

// 세부 사용자들의 마커를 지도에서 숨김.
function hideDetailMarkers() {
	var i = 0;
	while (i < detailMarkers.length) {
		detailMarkers[i].setMap(null);
		i++;
	}
	detailMarkers = [];
}

// 동에 해당하는 사용자들의 마커를 생성하고 요약 리포트를 띄움 - 현재는 과용으로만 되어있음.
function getDetailAreaInformation(addressArray) {

	var redColor = "FF0000";
	var greenColor = "00FFBC";
	var color = "";

	// 모든 마커를 지움.
	hideEntireDongMarkers();
	hideDetailMarkers();

	// 이벤트 등록.

	// 구글맵에서 동을 검색했을때 확대되는 줌 값.
	if (globalMap.getZoom() < 16) {
		globalMap.setOptions({
			'zoom' : 16
		});
	}

	// 동에 해당하는 상세 주소 리스트를 받아오고 마커를 생성하고 띄움.
	for (var i = 0; i < userConsumptionList.length; i++) {
		if (userConsumptionList[i].umDong == addressArray[2]) {

			// Create Marker
			if (userConsumptionList[i].overused == 0)
				color = greenColor;
			else
				color = redColor;

			var pinImage = new google.maps.MarkerImage(
					"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
							+ color, new google.maps.Size(21, 34),
					new google.maps.Point(0, 0), new google.maps.Point(10, 34));
			var pinShadow = new google.maps.MarkerImage(
					"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
					new google.maps.Size(40, 37), new google.maps.Point(0, 0),
					new google.maps.Point(12, 35));

			var marker = new google.maps.Marker(
					{
						title : addressArray[0] + " " + addressArray[1] + " "
								+ addressArray[2] + " "
								+ userConsumptionList[i].detail,
						position : new google.maps.LatLng(
								userConsumptionList[i].lat,
								userConsumptionList[i].lng),
						draggable : false,
						icon : pinImage,
						shadow : pinShadow,
					});
			detailMarkers.push(marker);
		}
	}
	showDetailMarkers();

	// 사용자를 클릭했을때 이벤트
	for (var i = 0; i < detailMarkers.length; i++) {
		detailMarkers[i].addListener('click', function() {

			// globalMap.setCenter(this.position);
			var address = this.title;
			var addressArray = address.split(' ');

			userSummary(addressArray); // 요약리포트
		});
	}

}

// 지도 검색 - 자동완성 기능을 사용했을때와 그냥 동 이름을 검색했을때를 다시 생각할것.
function codeAddress() {


	// Get Address from HTML
	var address = document.getElementById("pac-input").value;
	var color = "0000FF";

	var pinImage = new google.maps.MarkerImage(
			"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
					+ color, new google.maps.Size(21, 34),
			new google.maps.Point(0, 0), new google.maps.Point(10, 34));
	var pinShadow = new google.maps.MarkerImage(
			"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
			new google.maps.Size(40, 37), new google.maps.Point(0, 0),
			new google.maps.Point(12, 35));

	console.log("codeAddress");
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status === google.maps.GeocoderStatus.OK) {

			searchMarker.setMap(null);

			// Locate to map
			globalMap.setCenter(results[0].geometry.location);

			var dongList = normalUsedDongList.concat(overUsedDongList);
			var addressArray = address.split(' ');
			addressArray = addressArray[1] + " " + addressArray[2] + " "
					+ addressArray[3];
			addressArray = addressArray.split(" ");

			var i = 0;
			while (i < guDongLatLngList.length) {
				if (guDongLatLngList[i].umDong == address) {
					addressArray[0] = "인천광역시";
					addressArray[1] = guDongLatLngList[i].guGun;
					addressArray[2] = guDongLatLngList[i].umDong;
				}
				i++;
			}

			dongSummary(addressArray);

			// if address is dong or block or specific area , zoom level + 3
			if (dongList.indexOf(addressArray[2]) != -1
					|| dongList.indexOf(address) != -1) {

				getDetailAreaInformation(addressArray);
				// if address is not a dong or specific area , restore zoom
				// level to 13
			}

			else {

				globalMap.setOptions({
					'zoom' : 13
				});

				// Create Marker
				searchMarker = new google.maps.Marker({
					map : globalMap,
					position : results[0].geometry.location,
					icon : pinImage,
					shadow : pinShadow
				});
			}

		} else {
			alert('Geocode was not successful for the following reason: '
					+ status);
		}
	});

}

//Flag가 True인 아이콘을 출력.
function showIcon ( ) {
	
	if( entire_flag ) {
		showEntireDongMarkers();
	}
	else{
		hideEntireDongMarkers();
		hideAbsenceDongMarkers();
		hideFreezedDongMarkers();
		hideLeakDongMarkers();
		hideoverUsedDongMarkers();
	}
	
	if ( leak_flag ) {
		showLeakDongMarkers();
	}
	else{
		hideLeakDongMarkers();
	}
	
	if( absence_flag ) {
		showAbsenceDongMarkers();
	}
	else{
		hideAbsenceDongMarkers();
	}
	
	if( freezed_flag ) {
		showFreezedDongMarkers();
	}
	else{
		hideFreezedDongMarkers();
	}
	
}

// 전체 보기 아이콘을 클릭했을때
function entire_clicked(id) {

	if (entire_flag == false) {
		entire_flag = true;
		leak_flag = true;
		freezed_flag = true;
		absence_flag = true;
		
		$('#img_entire').css("background-color", "yellow");
		$('#img_leak').css("background-color", "yellow");
		$('#img_freezed').css("background-color", "yellow");
		$('#img_absence').css("background-color", "yellow");

	} else {
		entire_flag = false;
		leak_flag = false;
		freezed_flag = false;
		absence_flag = false;
		
		$('#img_entire').css("background-color", "#FFFFFF");
		$('#img_leak').css("background-color", "#FFFFFF");
		$('#img_freezed').css("background-color", "#FFFFFF");
		$('#img_absence').css("background-color", "#FFFFFF");
	}
	
	showIcon();
}

//누수 아이콘을 클릭했을때 
function leak_clicked(id) {

	if (leak_flag == false) {
		leak_flag = true;
		
		$('#img_leak').css("background-color", "yellow");

		if (freezed_flag == true && absence_flag == true) {
			entire_flag = true;
			
			$('#img_entire').css("background-color", "yellow");
		}

	} else {
		leak_flag = false;
		entire_flag = false;
		
		$('#img_leak').css("background-color", "#FFFFFF");
		$('#img_entire').css("background-color", "#FFFFFF");
	}
	
	showIcon();
}

// 동파 아이콘을 클릭했을때
function freezed_clicked(id) {

	if (freezed_flag == false) {
		freezed_flag = true;
		
		
		$('#img_freezed').css("background-color", "yellow");

		if (leak_flag == true && absence_flag == true) {
			entire_flag = true;
			
			$('#img_entire').css("background-color", "yellow");
		}
	} else {
		freezed_flag = false;
		entire_flag = false;
		
		$('#img_freezed').css("background-color", "#FFFFFF");
		$('#img_entire').css("background-color", "#FFFFFF");
		
	}
	
	showIcon();
}

// 부재중 알림 아이콘을 클릭했을때
function absence_clicked(id) {
	if (absence_flag == false  ) {
		absence_flag = true;
		
		$('#img_absence').css("background-color", "yellow");
		
		if( leak_flag == true && freezed_flag == true ) {
			entire_flag = true;
			$('#img_entire').css("background-color", "yellow");
		}
	} else {
		absence_flag = false;
		entire_flag = false;
		
		$('#img_absence').css("background-color", "#FFFFFF");
		$('#img_entire').css("background-color", "#FFFFFF");
	}
	
	showIcon();
}
