var globalGeocoder;
var globalMap;
var searchMarker = new google.maps.Marker();
var searchMarkers = [ ];
var abnormalDongmarkers = [ ];
var consumerMarkers = [ ] ;
var abnormalDongList = [ ];
var cons_sum = 0;
var cnt_leak = 0;
var cnt_absence = 0;
var cnt_freeze = 0;
var entire_flag = true;
var leak_flag = false;
var freezed_flag = false;
var absence_flag = false;
var abnormalColor = "FF0000";
var normalColor = "2ECCFA";
var incheon = "인천광역시";
var infoWindow  = new google.maps.InfoWindow({ content: 'InfoWindow' });
var centerPosition;

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
		navigationControl : false, // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택..
		navigationControlOptions : {
			position : google.maps.ControlPosition.TOP_RIGHT,
			style : google.maps.NavigationControlStyle.DEFAULT
		// ANDROID, DEFAULT, SMALL, ZOOM_PAN
		},
		streetViewControl : false,
		scaleControl : false, // 지도 축적 보여줄 것인지.
		mapTypeControl : false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};

	globalMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
//    var map = new google.maps.Map(document.getElementById('map_canvas'), {
//        center: {lat: -34.397, lng: 150.644},
//        scrollwheel: false,
//        zoom: 8
//      });
	
	//Create Entire Markers And Show all sign of abnormal dongs.
	createAbnormalDongmarkers();

	// Search Box
	var input = document.getElementById('pac-input');

	// Color-interpolation Box
	var colorBox = document.getElementById('color-interpolation');

	// Appending boxes
//	globalMap.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	globalMap.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(colorBox);


	// Zoom Changed Event
	globalMap.addListener('zoom_changed', function() {
//		console.log(globalMap.getZoom());
		//초기 상태로 되돌아옴.
		if (globalMap.getZoom() <= 13) {
			
			//동 마커 출력하고 , 수용가 마커 감추기.
			showAbnormalDongmarkers();
			hideConsumerMarkersMarkers();
			searchMarker.setMap(null);
			
			//infoWindow 닫기
			infoWindow.close();
			
			// 초기 리포트 페이지를 띄움.
			$("#left_section_box_init").show();
			$("#left_section_box_report").hide();

			//현재 켜진 아이콘의 동 마커들을 출력.
//			showIcon();
			
			// 첫 로딩 & 모든 아이콘이 꺼졌을때
			// if(absence_flag == false && leak_flag == false && freezed_flag ==
			// false && entire_flag == false ) {
			// showEntireabnormalDongmarkers();
			// for (var i = 0; i <entireabnormalDongmarkers.length; i++) {
			// entireabnormalDongmarkers[i].addListener('click', function() {
			//
			// //상세 주소만 띄우고 동 마커들은 숨김.
			// globalMap.setCenter(this.position);
			// var address = this.title;
			// var addressArray = address.split(' ');
			// dongSummary(addressArray) // 요약 리포트
			// });
			// }
			// }

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

				//초기화(다른 동 마커와 수용가 마커들을 모두 지워서 지도를 초기화 함.)
//				infoWindow.close();
				hideAbnormalDongmarkers();
				hideConsumerMarkersMarkers();
				searchMarker.setMap(null);
				
				for (var i = 0; i < dongInfoList.length; i++) {
					if (dongInfoList[i].dong == textSelected) {

						var addressArray = [ ];
						addressArray[0] = incheon;
						addressArray[1] = dongInfoList[i].gu;
						addressArray[2] = dongInfoList[i].dong;

						//동 마커를 지움.
						if( abnormalDongList.indexOf(dongInfoList[i].dong) != -1 ) {
							abnormalDongmarkers[abnormalDongList.indexOf(dongInfoList[i].dong) ].setMap(null);
						}
						
						//요약리포트 & 수용가 마커 생성.
						drawDongSummaryReport(addressArray) 
						createConsumerMarkers(addressArray);  
						
						//infoWindow 생성 & 지도를 마커들의 중점으로 이동. 
//						infoWindow.setContent( incheon + ' ' + dongInfoList[i].gu + ' ' + dongInfoList[i].dong );
//						infoWindow.setPosition( new google.maps.LatLng( dongInfoList[i].lat, dongInfoList[i].lng) ) ;
//						infoWindow.setPosition( centerPosition ) ;
//						infoWindow.open( globalMap );
						
						globalMap.setCenter( centerPosition );
//						globalMap.setCenter( new google.maps.LatLng( dongInfoList[i].lat, dongInfoList[i].lng ) );
						globalMap.setOptions({ 'zoom' : 15 });
						
					}
				}
			});

	$('#guGun_select').change(function(e) {
		$('#umDong_select').html('').append("<option value=''>읍/면/동</option>");
		var optionSelected = $("option:selected", this);
		var textSelected = optionSelected.text();

		var umDong_select = document.getElementById("umDong_select");
		for (var i = 0; i < dongInfoList.length; i++) {
			if (dongInfoList [i].gu == textSelected) {
				var option = document.createElement("option");
				option.text = dongInfoList[i].dong;
				umDong_select.add(option);
			}
		}
	});
}

// 전체 사용자들 가운데 누수/동파/부재중/역류/비만관/파손 에 해당하는 사용자들을 포함하는 동을 빨간색, 나머지는 초록색으로 표시
function createAbnormalDongmarkers( ) {

	for (var i = 0; i < dongInfoList.length; i++) {

		if ( dongInfoList[i].leak != 0 || dongInfoList[i].absence != 0 || dongInfoList[i].freezed != 0 ||
				dongInfoList[i].reverse != 0 || dongInfoList[i].fat != 0 || dongInfoList[i].breakage != 0 ) {

			var pinImage = new google.maps.MarkerImage(
					"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
							+ abnormalColor, new google.maps.Size(21, 34),
					new google.maps.Point(0, 0), new google.maps.Point(10,
							34));
			var pinShadow = new google.maps.MarkerImage(
					"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
					new google.maps.Size(40, 37), new google.maps.Point(0,
							0), new google.maps.Point(12, 35));

			// Craete marker
			var marker = new google.maps.Marker({
				title : incheon + " " + dongInfoList[i].gu + " "
						+ dongInfoList[i].dong,
				position : new google.maps.LatLng(dongInfoList[i].lat , dongInfoList[i].lng),
				draggable : false,
				icon : pinImage,
				shadow : pinShadow,
				map:globalMap
			});
			
			abnormalDongmarkers.push(marker);
			abnormalDongList.push(dongInfoList[i].dong);
			marker.set(globalMap);
			
			// 생성한 동들의 마커에 대한 클 이벤트 생성.
			marker.addListener('click', function() {
				
				var address = this.title;
				var addressArray = address.split(' ');
				
				//지도 초기화.
				this.setMap(null);
				searchMarker.setMap(null);
				hideAbnormalDongmarkers();
				hideConsumerMarkersMarkers();
				
				//요약리포트 & 수용가 마커 생성.
				drawDongSummaryReport(addressArray); 
				createConsumerMarkers(addressArray);
				console.log(consumerMarkers);
				
//				infoWindow.setContent( this.title );
//				infoWindow.setPosition( centerPosition );
//				infoWindow.open( globalMap );
				
				globalMap.setCenter ( centerPosition );
				globalMap.setOptions({ 'zoom' : 15 });
				
			});
		}
	}
//	showAbnormalDongmarkers();
	
}

//수용가 마커를 생성하고 클릭 이벤트를 등록.
function createConsumerMarkers ( addressArray ) {
	/*
	 * 1.클릭한 동의 구와 동을 입력받는다.
	 * 2.수용가의 수 만큼 반복한다.
	 * 	2.1 구와 동이 일치하는 수용가를 찾는다.
	 * 	2.1.1 마커를 생성한다.
	 * 	2.1.2 배열에 넣는다. 
	 * 	2.1.2 클릭 이벤트를 등록한다.
	 * 3.종료한다.
	 */
	
	var gu = addressArray[1];
	var dong = addressArray[2];
	var color = "";
	
	var count = 0;
	var sum_lat = 0;
	var sum_lng = 0;
	
	var polygonCoords = [ ];
	var bounds = new google.maps.LatLngBounds();
	
	for ( var i = 0 ; i < summaryReportList.length ; i ++ ) {
		if( summaryReportList[i].gu == gu && summaryReportList[i].dong == dong ) {
			
			// The Bermuda Triangle
			polygonCoords.push(  new google.maps.LatLng( summaryReportList[i].lat , summaryReportList[i].lng ) );
			
			count++;
			sum_lat += summaryReportList[i].lat;
			sum_lng += summaryReportList[i].lng;
			
			if ( summaryReportList[i].leak != 0 || summaryReportList[i].absence != 0 || summaryReportList[i].freezed != 0 ||
					summaryReportList[i].reverse != 0 || summaryReportList[i].fat != 0 || summaryReportList[i].breakage != 0 ) {
				color = abnormalColor;
			}
			else {
				color = normalColor;
			}
			
			//수용가 마커 생성.
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
				title : incheon + " " + summaryReportList[i].gu + " "
						+ summaryReportList[i].dong + " " + summaryReportList[i].detail,
				position : new google.maps.LatLng(summaryReportList[i].lat , summaryReportList[i].lng),
				draggable : false,
				icon : pinImage,
				shadow : pinShadow,
				map:globalMap
			});
			consumerMarkers.push(marker);
			
			marker.set(globalMap);
			
			// 생성한 동들의 마커에 대한 클 이벤트 생성.
			marker.addListener('click', function() {
				
//				globalMap.setCenter(this.position);
				
				var address = this.title;
				var addressArray = address.split(' ');
				drawConsumerReport(addressArray);
				
			});
		}
	}
	//생성된 수용가 마커들의 중심 좌표 구하기.
	for ( var i = 0; i < polygonCoords.length; i++) {
		  bounds.extend(polygonCoords[i]);
	}
	
	centerPosition = bounds.getCenter();
}

function drawConsumerReport( addressArray ){

	var gu = addressArray[1];
	var dong = addressArray[2];
	var detail = addressArray[3];
	var sum_weeklyConsumption = 0;
	var dongCount = 0;
	var dongConsumption = 0;
	
	//동의 개수를 세고 동의 총 사용량을 구함.
	for ( var i = 0 ; i < summaryReportList.length ; i ++ ) {
		if(summaryReportList[i].gu == gu && summaryReportList[i].dong == dong ) {
			dongCount ++;
			dongConsumption += Number(summaryReportList[i].consumed);
		}
	}
	
	for ( var i = 0 ; i < summaryReportList.length ; i ++ ) { 
			
		if(summaryReportList[i].gu == gu && summaryReportList[i].dong == dong && summaryReportList[i].detail == detail ) {
			
			//1.주소칸
			document.getElementById('info_date').innerHTML = incheon+ ' ' + gu + ' ' + dong + ' ' + detail; 
			info_date.style.fontSize = "90%"; // 주소 출력 폰트 사이즈
				
			$(".checkBox").prop('checked', false) ;
			
			//2.부가서비스별 발생 횟수.
			document.getElementById('check_leak').innerHTML = "누수" ;
			check_leak.style.fontSize = "80%";
			if (summaryReportList[i].leak != 0 ) {
				document.getElementById("checkBox_leak").checked = true;
			}
				
			document.getElementById('check_absence').innerHTML = "부재중";
			check_absence.style.fontSize = "80%";
			if (summaryReportList[i].absence != 0 ) {
				document.getElementById("checkBox_absence").checked = true;
			}
				
			document.getElementById('check_freezed').innerHTML = "동파";
			check_freezed.style.fontSize = "80%";
			if (summaryReportList[i].freezed != 0 ) {
				document.getElementById("checkBox_freezed").checked = true;
			}
			
			document.getElementById('check_reverse').innerHTML = "역류";
			check_reverse.style.fontSize = "80%";
			if (summaryReportList[i].reverse != 0 ) {
				document.getElementById("checkBox_reverse").checked = true;
			}
			
			document.getElementById('check_fat').innerHTML = "비만";
			check_fat.style.fontSize = "80%";
			if (summaryReportList[i].fat != 0 ) {
				document.getElementById("checkBox_fat").checked = true;
			}
			
			document.getElementById('check_breakage').innerHTML = "파손";
			check_breakage.style.fontSize = "80%";
			if (summaryReportList[i].breakage != 0 ) {
				document.getElementById("checkBox_breakage").checked = true;
			}
			
			//일주일치 사용량 합 구하기.
			sum_weeklyConsumption = Number(summaryReportList[i].day1) + Number ( summaryReportList[i].day2 ) + Number ( summaryReportList[i].day3 ) +
			Number ( summaryReportList[i].day4) + Number ( summaryReportList[i].day5 ) + Number ( summaryReportList[i].day6 ) + Number (summaryReportList[i].day7);

			
			//3.요약 report 사용량,예측량, 일주일 평균 , 지역 평균 그래프 그리기.
			drawColumn(Math.round(summaryReportList[i].consumed), 
					Math.round(summaryReportList[i].predicted), 
					Math.round(sum_weeklyConsumption/7) ,
					Math.round(dongConsumption / dongCount) ); 
	
			//4.요약 report history 그래프 그리기.
			drawHistory ( Number(summaryReportList[i].day7) , Number ( summaryReportList[i].day6 ) , Number ( summaryReportList[i].day5 ) ,
			Number ( summaryReportList[i].day4), Number ( summaryReportList[i].day3 ) , Number ( summaryReportList[i].day2 ) ,
			Number (summaryReportList[i].day1) , sum_weeklyConsumption / 7);
			console.log(summaryReportList[i].day1 , summaryReportList[i].day2 , summaryReportList[i].day3 , summaryReportList[i].day4 , summaryReportList[i].day5
					, summaryReportList[i].day6 , summaryReportList[i].day7 , sum_weeklyConsumption/7)
		}
	}
}
	
//요약 report column 그래프(사용량, 예측량, 일주일 평균, 지역 평균)
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
		fontSize : 11,
		bar : {
			groupWidth : "80%"
		},
		legend : {
			position : "none"
		},
		vAxis : {
			minValue : 0,
			viewWindow : {
				min : 0
			}
		}
	};

	chart = new google.visualization.ColumnChart(document
			.getElementById("info_graph"));

	chart.draw(view, options);
}


// 부가서비스 누수 column 그 래프
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
			fontSize : 11
		},
		fontSize : 11,
		bar : {
			groupWidth : "50%"
		},
		legend : {
			position : "none"
		},
		vAxis : {
			minValue : 0,
			viewWindow : {
				min : 0
			}
		}
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
			fontSize : 11
		},
		fontSize : 11,
		bar : {
			groupWidth : "50%"
		},
		legend : {
			position : "none"
		},
		vAxis : {
			minValue : 0,
			viewWindow : {
				min : 0
			}
		}
	};
	chart = new google.visualization.ColumnChart(document
			.getElementById("absence_graph"));
	chart.draw(view, options);
}

// 부가서비스 동파 column 그래프
function drawFreeze(cons, pred, upperName, Name) {
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
		title : "동파 횟수",
		titleTextStyle : {
			color : "black",
			fontSize : 11
		},
		fontSize : 11,
		bar : {
			groupWidth : "50%"
		},
		legend : {
			position : "none"
		},
		vAxis : {
			minValue : 0,
			viewWindow : {
				min : 0
			}
		}
	};
	chart = new google.visualization.ColumnChart(document
			.getElementById("freeze_graph"));
	chart.draw(view, options);
}

// 일주일간 히스토리 꺾은선 그래프 그리는 함수
function drawHistory(day1, day2, day3, day4, day5, day6, day7, avg) {

	var data = new google.visualization.DataTable();
	data.addColumn('date', 'Time of Day');
	data.addColumn('number', 'Consumption');
	data.addColumn('number', 'Average');

	data.addRows([ [ new Date(2015, 1, 22), day1, avg ],
			[ new Date(2015, 1, 23), day2, avg ],
			[ new Date(2015, 1, 24), day3, avg ],
			[ new Date(2015, 1, 25), day4, avg ],
			[ new Date(2015, 1, 26), day5, avg ],
			[ new Date(2015, 1, 27), day6, avg ],
			[ new Date(2015, 1, 28), day7, avg ], ]);

	var options = {
		title : "일주일 간 history",

		titleTextStyle : {
			color : "black",
			fontSize : 15
		},
		hAxis : {
			format : 'yy-MM-dd'
		// gridlines: {count: 15}
		},
		vAxis : {
			gridlines : {
				color : 'none'
			},
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

//요약 리포트 부가 서비스별 최근 발생 횟수 및 한달간 발생 빈도 그래프
function drawServiceFrequency( countLeak , countAbsence , countFreezed , countReverse , countFat , countBreakage ) {
	var data = google.visualization.arrayToDataTable([
	                                                  ["Element", "Density", { role: "style" } ],
	                                                  ["누수", countLeak, "color: blue"],
	                                                  ["부재중", countAbsence, "color: blue"],
	                                                  ["동파", countFreezed, "color: blue"],
	                                                  ["역류", countReverse, "color: blue"],
	                                                  ["비만", countFat, "color: blue"],
	                                                  ["파손", countBreakage, "color: blue"]
	                                                  ]);
	
	var view = new google.visualization.DataView(data);
	view.setColumns([0, 1,
	                 { calc: "stringify",
		sourceColumn: 1,
		type: "string",
		role: "annotation" },
		2]);
	
	var options = {
			title: "지번 달 부가서비스 발생 횟수",
			width: 300,
			height: 230,
			chartArea: {'width': '80%', 'height': '80%'},
			bar: {groupWidth: "40%"},
			legend: { position: "none" },
	};
	var chart = new google.visualization.ColumnChart(document.getElementById("info_service"));
	chart.draw(view, options);
	
}


// 동 요약 리포트
/*
 * 2016.4.3 수정 : summaryReport데이터에서 요약리포트 만드는것으로 바꿈.(욱현)
 */
function drawDongSummaryReport(addressArray) {

	var len = addressArray.length;
	var leak_date = "";
	var absence_date = "null";
	var freeze_date = "null";
	var address = "";
	
	var gu = addressArray[1];
	var dong = addressArray[2];
	
	var sum_day1 = 0;
	var sum_day2 = 0;
	var sum_day3 = 0;
	var sum_day4 = 0;
	var sum_day5 = 0;
	var sum_day6 = 0;
	var sum_day7 = 0;
	var sum_weeklyConsumption = 0;
	
	var userCount = 0;
	var dongCount = 0;

	var sum_consumed = 0;
	var sum_predicted = 0;
	var sum_consumed_gu = 0;
	
	var countLeak = 0;
	var countAbsence = 0;
	var countFreezed = 0;
	var countReverse = 0;
	var countFat = 0;
	var countBreakage = 0;
	
	var leakFrequency = 0;
	var absenceFrequency = 0;
	var freezedFrequency = 0;
	var reverseFrequency = 0;
	var fatFrequency = 0;
	var breakageFrequency = 0;

	var dongList = [ ];

	// 초기 리포트 페이지를 숨기고 요약 리포트 페이지 보이기.
	$("#left_section_box_init").hide();
	$("#left_section_box_report").show();
	
	for (var i = 0; i < len; i++) {
		address += addressArray[i] + ' ';
	}

	//구에 해당하는 동의 수 count , 구의 총 사용량 구하기.
	for (var j = 0; summaryReportList[j]; j++) {
		
		if (gu == summaryReportList[j].gu ) {
			
			sum_consumed_gu += Number(summaryReportList[j].consumed);
			
			if( dongList.indexOf(summaryReportList[j].dong) == -1) {
				dongList.push(summaryReportList[j].dong)
				dongCount += 1;
			}
		}
	}
	
	//클릭한 동에 해당하는 수용가의 수만큼 반복한다.
	for (var j = 0; summaryReportList[j]; j++) {

		if (gu == summaryReportList[j].gu && dong == summaryReportList[j].dong ) {
			
			//동에 해당하는 수용가의 수 count.
			userCount += 1;
			
			//사용량,예측량
			sum_consumed += Number(summaryReportList[j].consumed);
			sum_predicted += Number(summaryReportList[j].predicted);
			
			//동의 일주일치 history
			sum_day1 += Number(summaryReportList[j].day1);
			sum_day2 += Number(summaryReportList[j].day2);
			sum_day3 += Number(summaryReportList[j].day3);
			sum_day4 += Number(summaryReportList[j].day4);
			sum_day5 += Number(summaryReportList[j].day5);
			sum_day6 += Number(summaryReportList[j].day6);
			sum_day7 += Number(summaryReportList[j].day7);
			
			//동에 해당하는 수용가들의 부가서비스 count.
			if ( summaryReportList[j].leak == 1 ) {
				countLeak ++;
			}
			if ( summaryReportList[j].absence == 1 ) {
				countAbsence ++;
			}
			if ( summaryReportList[j].freezed == 1 ) {
				countFreezed ++;
			}
			if ( summaryReportList[j].reverse == 1 ) {
				countReverse ++;
			}
			if ( summaryReportList[j].fat == 1 ) {
				countFat ++;
			}
			if ( summaryReportList[j].breakage == 1 ) {
				countBreakage ++;
			}
			
			//모든 수용가들의 부가서비스 빈도 더하기.
			leakFrequency += Number (summaryReportList[j].countLeak);
			absenceFrequency += Number (summaryReportList[j].countAbsence);
			freezedFrequency += Number(summaryReportList[j].countFreezed);
			reverseFrequency += Number(summaryReportList[j].countReverse);
			fatFrequency += Number(summaryReportList[j].countFat);
			breakageFrequency += Number(summaryReportList[j].countBreakage);
		}
	}
	//1.주소칸
	document.getElementById('info_date').innerHTML = address + "(" + userCount + ")"; // 주소 출력
	info_date.style.fontSize = "90%"; // 주소 출력 폰트 사이즈
	
	$(".checkBox").prop('checked', false) ;
	
	//2.부가서비스별 발생 횟수.
	document.getElementById('check_leak').innerHTML = "누수 : " + countLeak + "명";
	check_leak.style.fontSize = "80%";
	if (countLeak != 0 ) {
		document.getElementById("checkBox_leak").checked = true;
	}
	
	document.getElementById('check_absence').innerHTML = "부재중 : " + countAbsence + "명";
	check_absence.style.fontSize = "80%";
	if (countAbsence != 0 ) {
		document.getElementById("checkBox_absence").checked = true;
	}
	
	document.getElementById('check_freezed').innerHTML = "동파 : " + countFreezed + "명";
	check_freezed.style.fontSize = "80%";
	if (countFreezed != 0 ) {
		document.getElementById("checkBox_freezed").checked = true;
	}
	
	document.getElementById('check_reverse').innerHTML = "역류 : " + countReverse + "명";
	check_reverse.style.fontSize = "80%";
	if (countReverse != 0 ) {
		document.getElementById("checkBox_reverse").checked = true;
	}
	
	document.getElementById('check_fat').innerHTML = "비만 : " + countFat + "명";
	check_fat.style.fontSize = "80%";
	if (countFat != 0 ) {
		document.getElementById("checkBox_fat").checked = true;
	}
	
	document.getElementById('check_breakage').innerHTML = "파손 : " + countBreakage + "명";
	check_breakage.style.fontSize = "80%";
	if (countBreakage != 0 ) {
		document.getElementById("checkBox_breakage").checked = true;
	}
	
	//일주일치 사용량 합 구하기.
	sum_weeklyConsumption += sum_day1 + sum_day2 + sum_day3 + sum_day4 + sum_day5 + sum_day6 + sum_day7;
	console.log(sum_consumed_gu , dongCount );
	//3.요약 report 사용량,예측량, 일주일 평균 , 지역 평균 그래프 그리기.
	drawColumn(Math.round(sum_consumed), Math.round(sum_predicted), Math.round(sum_weeklyConsumption/7) , Math.round(sum_consumed_gu / dongCount) ); 

	//4.요약 report history 그래프 그리기.
	drawHistory(sum_day7 , sum_day6 , sum_day5 , sum_day4 , sum_day3 , sum_day2 , sum_day1 , sum_weeklyConsumption/7 );
	
	//5.요약 report 부가서비스 빈도 그래프 그리기.
	drawServiceFrequency(leakFrequency, absenceFrequency, freezedFrequency, reverseFrequency, fatFrequency, breakageFrequency);

//	leak_text.style.fontSize = "80%";
//	absence_text.style.fontSize = "80%";
//	freeze_text.style.fontSize = "80%";

//	if (leak_date != "null")
//		document.getElementById('leak_text').innerHTML = '최근 누수 날짜 :' + ' '
//				+ leak_date;
//	else
//		document.getElementById('leak_text').innerHTML = '최근 누수 날짜 : 없음';
//
//	if (absence_date != "null")
//		document.getElementById('absence_text').innerHTML = '최근 부재중 날짜 :' + ' '
//				+ absence_date;
//	else
//		document.getElementById('absence_text').innerHTML = '최근 부재중 날짜 : 없음';
//
//	if (freeze_date != "null")
//		document.getElementById('freeze_text').innerHTML = '최근 동파 날짜 :' + ' '
//				+ freeze_date;
//	else
//		document.getElementById('freeze_text').innerHTML = '최근 동파 날짜 : 없음';


	

	// 요약 report 부가서비스
//	drawLeak(cnt_leak, (siGoonLeak / siGoonLen.length).toFixed(2),
//			addressArray[len - 2], addressArray[len - 1]);
//	drawAbsence(cnt_absence, (siGoonAbsence / siGoonLen.length).toFixed(2),
//			addressArray[len - 2], addressArray[len - 1]); // 동 부재중 발생 횟수, 지역
//															// 평균 발생 횟수
//	drawFreeze(cnt_freeze, (siGoonFreeze / siGoonLen.length).toFixed(2),
//			addressArray[len - 2], addressArray[len - 1]);
//
//	if (cnt_leak != 0) {
//		var text_leak = "누수 : " + cnt_leak + "명";
//		$("#check_leak").text(text_leak);
//		$('#checkBox_leak').prop('checked', true);
//	} else {
//		$("#check_leak").text("누수 : 0명");
//		$('#checkBox_leak').prop('checked', false);
//	}
//
//	if (cnt_freeze != 0) {
//		var text_freezed = "동파 : " + cnt_freeze + "명";
//		$("#check_freezed").text(text_freezed);
//		$('#checkBox_freezed').prop('checked', true);
//	} else {
//		$("#check_freezed").text("동파 : 0명");
//		$('#checkBox_freezed').prop('checked', false);
//	}
//
//	if (cnt_absence != 0) {
//		var text_absence = "부재중 : " + cnt_absence + "명";
//		$("#check_absence").text(text_absence);
//		$('#checkBox_absence').prop('checked', true);
//	} else {
//		$("#check_absence").text("부재중 : 0명");
//		$('#checkBox_absence').prop('checked', false);
//	}
//	// 지도에 동에 해당하는 상세 주소 마커 띄우기
//	getDetailAreaInformation(addressArray);

}

// 전체 동들의 마커를 지도에 출력
function showAbnormalDongmarkers() {
	for (var i = 0; i < abnormalDongmarkers.length; i++) {
		abnormalDongmarkers[i].setMap(globalMap);
	}
}

// 전체 동들의 마커를 지도에서 숨김
function hideAbnormalDongmarkers() {

	for (var i = 0; i < abnormalDongmarkers.length; i++) {
		abnormalDongmarkers[i].setMap(null);
	}
}

// 세부 사용자들의 마커를 지도에 출력
function showConsumerMarkers() {
	for (var i = 0; i < consumerMarkers.length; i++) {
		consumerMarkers[i].setMap(globalMap);
	}
}

// 세부 사용자들의 마커를 지도에서 숨김.
function hideConsumerMarkersMarkers() {
	var i = 0;
	while (i < consumerMarkers.length) {
		consumerMarkers[i].setMap(null);
		i++;
	}
	consumerMarkers = [ ];
}

// 지도 검색 - 자동완성 기능을 사용했을때와 그냥 동 이름을 검색했을때를 다시 생각할것.
function codeAddress() {

	// Get Address from HTML
	var address = document.getElementById("pac-input").value;

	globalGeocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status === google.maps.GeocoderStatus.OK) {

			//검색 마커 초기화.
			searchMarker.setMap(null);
			
			var inputDong = address;
			var addressArray = address.split(' ');
			var isDong = false;
			var index ;
			
			//검색어가 자동완성 기능을 사용한 경우 
			if( addressArray.length > 1) {
				inputDong = addressArray[3];
			}
			
			// 주소 배열을 만든다.
			for ( var i = 0; i < dongInfoList.length ; i ++ ){
				if ( inputDong == dongInfoList[i].dong ) {
					isDong = true;
					addressArray = [ ];
					addressArray.push ( incheon , dongInfoList[i].gu , dongInfoList[i].dong );
					index = i;
				}
			}
			
			//인천광역시 내의 동일 경우
			if ( isDong ) {
				
				//입력 동이 비정상 일때 생성되어진 마커를 지움.
				if ( abnormalDongList.indexOf(dongInfoList[index].dong ) != -1 ) {
					abnormalDongmarkers[abnormalDongList.indexOf(dongInfoList[index].dong) ].setMap(null);
				}
				
				//다른 동 마커를 지움. 
				hideAbnormalDongmarkers();
				hideConsumerMarkersMarkers();
				
				//요약리포트를 그리고 수용가 마커를 생성함.
				drawDongSummaryReport(addressArray) // 요약 리포트
				createConsumerMarkers(addressArray); //수용가 마커 생성. 

				//마커를 지우고 infoWindow 생성.
//				infoWindow.setContent( incheon + ' ' + addressArray[1] + ' ' + addressArray[2] );
//				infoWindow.setPosition( new google.maps.LatLng( dongInfoList[index].lat, dongInfoList[index].lng) ) ;
//				infoWindow.open( globalMap );
				
				// Locate to map
				globalMap.setCenter( centerPosition );
				globalMap.setOptions({ 'zoom' : 15 });
			}
			//그 외의 지명일 경우 마커를 생성한다.
			else {
				
				var color = "0000FF";

				var pinImage = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
								+ color, new google.maps.Size(21, 34),
						new google.maps.Point(0, 0), new google.maps.Point(10, 34));
				var pinShadow = new google.maps.MarkerImage(
						"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
						new google.maps.Size(40, 37), new google.maps.Point(0, 0),
						new google.maps.Point(12, 35));
				searchMarker = new google.maps.Marker({
					title : "",
					position : results[0].geometry.location,
					draggable : false,
					icon : pinImage,
					shadow : pinShadow,
					map:globalMap
				});
				// Locate to map
				globalMap.setCenter(results[0].geometry.location);
				globalMap.setOptions({ 'zoom' : 15 });
			}
			


		} else {
			alert('Geocode was not successful for the following reason: '
					+ status);
		}
	});

}

// Flag가 True인 아이콘을 출력.
function showIcon() {

	if (entire_flag) {
		showEntireabnormalDongmarkers();
		$('#img_entire').css("background-color", "yellow");
		console.log("ddd");
	} else {
		hideEntireabnormalDongmarkers();
		hideAbsenceabnormalDongmarkers();
		hideFreezedabnormalDongmarkers();
		hideLeakabnormalDongmarkers();
		hideoverUsedabnormalDongmarkers();
		$('#img_entire').css("background-color", "#FFFFFF");
		$('#img_leak').css("background-color", "#FFFFFF");
		$('#img_freezed').css("background-color", "#FFFFFF");
		$('#img_absence').css("background-color", "#FFFFFF");
	}

	if (leak_flag) {
		showLeakabnormalDongmarkers();
		$('#img_leak').css("background-color", "yellow");
	} else {
		hideLeakabnormalDongmarkers();
		$('#img_leak').css("background-color", "#FFFFFF");
	}

	if (absence_flag) {
		showAbsenceabnormalDongmarkers();
		$('#img_absence').css("background-color", "yellow");
	} else {
		hideAbsenceabnormalDongmarkers();
		$('#img_absence').css("background-color", "#FFFFFF");
	}

	if (freezed_flag) {
		showFreezedabnormalDongmarkers();
		$('#img_freezed').css("background-color", "yellow");
	} else {
		hideFreezedabnormalDongmarkers();
		$('#img_freezed').css("background-color", "#FFFFFF");
	}

}

// 전체 보기 아이콘을 클릭했을때
/*
 * 1.수용가 마커 배열이 0이 아니고 수 
 * 	1.1 
 * 1.지도를 초기화 한다.
 * 2.전체 동 개수만큼 반복한다.
 * 	2.1 누수인 동을 찾는다.
 * 		2.1.1지도에서 표시한다.
 */
function entire_clicked(id) {

	// 초기 리포트 페이지를 띄우고 초기 상태로 돌아감.
	$("#left_section_box_init").show();
	$("#left_section_box_report").hide();
	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (entire_flag == false) {
		entire_flag = true;

		leak_flag = false;
		freezed_flag = false;
		absence_flag = false;

		// $('#img_entire').css("background-color", "yellow");
		// $('#img_leak').css("background-color", "yellow");
		// $('#img_freezed').css("background-color", "yellow");
		// $('#img_absence').css("background-color", "yellow");

	} else {
		entire_flag = false;
		leak_flag = false;
		freezed_flag = false;
		absence_flag = false;

		// $('#img_entire').css("background-color", "#FFFFFF");
		// $('#img_leak').css("background-color", "#FFFFFF");
		// $('#img_freezed').css("background-color", "#FFFFFF");
		// $('#img_absence').css("background-color", "#FFFFFF");
	}

	showIcon();
}

/* 누수 아이콘을 클릭했을때
 * 누수 플래그가 true가 되고 나머지 플래그는 false가 됨. 
 * 수용가 마커들은 숨김.
 */
function leak_clicked(id) {

	// 초기 리포트 페이지를 띄우고 초기 상태로 돌아감.
	$("#left_section_box_init").show();
	$("#left_section_box_report").hide();
	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (leak_flag == false) {
		leak_flag = true;
		entire_flag = false;
		freezed_flag = false;
		absence_flag = false;

		// $('#img_leak').css("background-color", "yellow");

		// if (freezed_flag == true && absence_flag == true) {
		// entire_flag = true;
		//			
		// $('#img_entire').css("background-color", "yellow");
		// }

	} else {
		leak_flag = false;

		// $('#img_leak').css("background-color", "#FFFFFF");
		// $('#img_entire').css("background-color", "#FFFFFF");
	}

	showIcon();
}

// 동파 아이콘을 클릭했을때
function freezed_clicked(id) {
	
	// 초기 리포트 페이지를 띄우고 초기 상태로 돌아감.
	$("#left_section_box_init").show();
	$("#left_section_box_report").hide();
	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (freezed_flag == false) {
		freezed_flag = true;
		entire_flag = false;
		leak_flag = false;
		absence_flag = false;

		// $('#img_freezed').css("background-color", "yellow");

		// if (leak_flag == true && absence_flag == true) {
		// entire_flag = true;
		//			
		// $('#img_entire').css("background-color", "yellow");
		// }
	} else {
		freezed_flag = false;

		// $('#img_freezed').css("background-color", "#FFFFFF");
		// $('#img_entire').css("background-color", "#FFFFFF");

	}

	showIcon();
}

// 부재중 알림 아이콘을 클릭했을때
function absence_clicked(id) {

	// 초기 리포트 페이지를 띄우고 초기 상태로 돌아감.
	$("#left_section_box_init").show();
	$("#left_section_box_report").hide();
	globalMap.setCenter(new google.maps.LatLng(37.4562557, 126.70520620000002));
	globalMap.setOptions({
		'zoom' : 13
	});

	if (absence_flag == false) {
		absence_flag = true;
		entire_flag = false;
		leak_flag = false;
		freezed_flag = false;

		// $('#img_absence').css("background-color", "yellow");

		// if( leak_flag == true && freezed_flag == true ) {
		// entire_flag = true;
		// $('#img_entire').css("background-color", "yellow");
		// }
	} else {
		absence_flag = false;

		// $('#img_absence').css("background-color", "#FFFFFF");
		// $('#img_entire').css("background-color", "#FFFFFF");
	}

	showIcon();
}
