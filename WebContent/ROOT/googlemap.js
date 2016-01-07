var globalGeocoder;
var globalMap;
//var globalBounds;

var address;
var geoIter = 0;
var delay = 100;
var init_zoom = 13;
var load_info;
var addname = new Array();
var markers = new Array();
var visable = new Array();

// 맵 초기화
function initialize(x, y) {	
	// Incheon
	if (x == 0) x = 37.4562557;
	if (y == 0)	y = 126.70520620000002;

	if(addname.length != d.aNodes.length){
		delete addname;
		for(var i = d.aNodes.length-1; i >= 0; i--)
			addname.push(d.aNodes[i].name);
	}

	for(var i in addname) {
		visable.push(true);
	}
			
	globalGeocoder = new google.maps.Geocoder();
	//globalBounds = new google.maps.LatLngBounds();
	var latlng = new google.maps.LatLng(x, y);

	var myOptions = {
		zoom : init_zoom,
		center : latlng,
		// disableDoubleClickZoom:false,

		navigationControl : false, // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택..
		navigationControlOptions : {
			position : google.maps.ControlPosition.TOP_RIGHT,
			style : google.maps.NavigationControlStyle.DEFAULT
		// ANDROID, DEFAULT, SMALL, ZOOM_PAN
		},

		streetViewControl : false,
		scaleControl : false, // 지도 축적 보여줄 것인지.
		// scaleControlOptions: { position:
		// google.maps.ControlPosition.TOP_RIGHT },

		mapTypeControl : false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
		mapTypeId : google.maps.MapTypeId.ROADMAP
	// HYBRID, ROADMAP, SATELLITE, TERRAIN
	};

	globalMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	
	//Search Box
	var input = document.getElementById('pac-input');

	//Color-interpolation Box
	var colorBox = document.getElementById('color-interpolation');
	
	//Hide boxes
	input.hidden = true;
	colorBox.hidden = true;
	
	//Appending boxes
	globalMap.controls[google.maps.ControlPosition.TOP_RIGHT].push(input);
	globalMap.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(colorBox);
	
	load_info = new google.maps.InfoWindow();
	load_info.open(
		globalMap,
		new google.maps.Marker( {
			map : globalMap,
			position : latlng,
			draggable : false,
			icon : "null" }
		)
	);
	
	geocodeAddress();

	// 상세보기 버튼
	btn = document.getElementById("btn_detail");
	//그래프 그려지기 전까지 disable
	btn.style.visibility = 'hidden';
}

function setData(cons, pred, name) {
	var data = google.visualization.arrayToDataTable([
			[ 'Element', 'value', {	role : "style"} ],
			[ '사용량', cons, '#b87333' ], // RGB value
			[ '예측량', pred, 'silver' ] // English color name
	]);

	var view = new google.visualization.DataView(data);
	view.setColumns(
	[ 0, 1, {
		calc : "stringify",
		sourceColumn : 1,
		type : "string",
		role : "annotation"
	}, 2 ]);

	var options = {
		title : name,
		width : 200,
		height : 160,
		fontSize : 10,
		bar : {
			groupWidth : "95%"
		},
		legend : {
			position : "none"
		},
	};

	chart = new google.visualization.ColumnChart(document.getElementById("info_graph"));			
	
	// 상세보기 버튼 이벤트
	google.visualization.events.addListener(chart, 'ready',
			  function() {
				btn.style.visibility = 'visible';
				btn.value = 'test';
			  });
	
	btn.onclick = function() {
		}
	
	chart.draw(view, options);
}

function getMksInfo() {
	for (var i = 0; i < markers.length; i++) {	
		markers[i].addListener(
			'click',
			function() {
				var idx = this.get("id");
				console.log(idx);
				setData(parseFloat(idx) +0.5, parseFloat(idx) +0.7, addname[idx]);
			}
		);
	}
	
}

// Sets the map on all markers in the array.
function setMapOnAll() {
	for (var i = 0; i < markers.length; i++) {
		if (visable[i]) {
			markers[i].setMap(globalMap);
		}
		else {
			markers[i].setMap(null);
		}
	}
}

function geocodeExcute(loc, next) {	var initColorValue = parseInt("0000FF", 16);
	/*var endColorValue = parseInt("FF0000", 16);
	var addValue = parseFloat(endColorValue - initColorValue) / (addname.length + 1);

	var pinColorHex = "0000FF";
	var pinColorInt = parseInt(pinColorHex, 16) + parseInt((geoIter + 1) * addValue);*/
	var redColor = "FF0000";
	var greenColor = "2EFE64";	
	var color = "";
	
	if( normalUsedDongList.indexOf(loc) != -1)
		color = greenColor;
	else color = redColor;
	
	if (loc != "인천광역시")
		loc = "인천광역시 " + loc;
	
	globalGeocoder.geocode(
		{ 'address' : loc },
		function(results, status) {
			if (status === google.maps.GeocoderStatus.OK) {
				//pinColorHex = pinColorInt.toString(16);

				var sName = results[0].address_components[0].short_name.toString();
				var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + color,//pinColorHex,
					new google.maps.Size(21, 34),
					new google.maps.Point(0,0),
					new google.maps.Point(10, 34));
				var pinShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
					new google.maps.Size(40, 37),
					new google.maps.Point(0, 0),
					new google.maps.Point(12, 35));
				var marker = new google.maps.Marker({
					title : sName,
					position : results[0].geometry.location,
					draggable : false,
					icon: pinImage,
					shadow: pinShadow,
				});
				console.log("lat", loc , results[0].geometry.location.lat());				
				console.log("lng", loc , results[0].geometry.location.lng());				
				marker.set("type", "point");
				marker.set("id", markers.length.toString());
				//globalBounds.extend(marker.position);
									
				markers.push(marker);
				
				delay/=2;
				if(delay < 100) delay = 100;
				
				if (addname.length != markers.length){
					load_info.setContent(
						"<Strong>Now Loading</Strong><br>"
						+ 100 * parseFloat(markers.length) / parseFloat(addname.length) + "%"
					);
				}
			}
			else if (status === google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
				geoIter--;
				if(geoIter < 0) geoIter = 0;
				
				delay++;
			}
			next();
		}
	);
}
function geocodeAddress() {
	if(geoIter < addname.length) {
		setTimeout( 'geocodeExcute("'+ addname[geoIter] +'", geocodeAddress)', delay );
		geoIter++;
	}
	else {
		//globalMap.fitBounds(globalBounds);
		globalMap.setCenter(markers[markers.length-1].position);
		
		//Show boxes
		document.getElementById('pac-input').hidden = false;
		document.getElementById('color-interpolation').hidden = false;
		
		load_info.close();
		getMksInfo();
		d.ot(0);
	}
}
