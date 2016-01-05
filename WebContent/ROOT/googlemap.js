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
var infowin = new Array();
var visable = new Array();
google.maps.InfoWindow.prototype.opened;

// 맵 초기화
function initialize(x, y) {	
	// Incheon
	if (x == 0) x = 37.4562557;
	if (y == 0)	y = 126.70520620000002;

	addname.push("신흥동");
	addname.push("연안동");
	addname.push("무의동");
	addname.push("을왕동");
	addname.push("남북동");
	addname.push("덕교동");
	addname.push("운복동");
	addname.push("중산동");
	addname.push("운남동");
	addname.push("운서동");
	addname.push("중구");
	addname.push("서구");
	addname.push("동구");
	addname.push("부평구");
	addname.push("연수구");
	addname.push("인천광역시");

	for(var i in addname) {
		visable.push(true);
		infowin.push(new google.maps.InfoWindow());
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
				
	//SearchBox
	var input = document.getElementById('pac-input');
	var searchBox = new google.maps.places.SearchBox(input);
	
	globalMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	globalMap.controls[google.maps.ControlPosition.TOP_RIGHT].push(input);
	
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
}

function setData(cons, pred, name) {
	var data = google.visualization.arrayToDataTable( [
		[ 'Element', 'value', {role : "style"} ], 
		[ '사용량', cons, '#b87333' ], // RGB value
		[ '예측량', pred, 'silver' ] // English color name
	]);

	var view = new google.visualization.DataView(data);
	view.setColumns([ 0, 1, {
		calc : "stringify",
		sourceColumn : 1,
		type : "string",
		role : "annotation"
	}, 2 ]);

	var options = {
		title : name,
		width : 135,
		height : 85,
		fontSize : 10,		
		bar : {
			groupWidth : "95%"
		},
		legend : {
			position : "none"
		},
	};

	var p_node = document.createElement('div');	
	p_node.style.width = "135px";
	p_node.style.height = "90px";
	p_node.style.align = "horizon: middle; vertical: middle;";
	
	var c_node = p_node.appendChild(document.createElement('div'));	
	
	chart = new google.visualization.ColumnChart(c_node);
	chart.draw(view, options);
	
	return p_node;
}

function getMksInfo() {
	for (var i = 0; i < markers.length; i++) {		
		var contentString = addname[i];	
		infowin[i].setContent(setData(i+1, i+1, contentString));

		markers[i].addListener(
			'click',
			function() {
				var idx = this.get("id");
				if (infowin[idx].opened) {
					infowin[idx].close();
					infowin[idx].opened = false;
				} else {
					infowin[idx].open(globalMap, this);
					infowin[idx].opened = true;
				}
			}
		);
	}
	
	infowin[infowin.length-1].opened = true;
}

// Sets the map on all markers in the array.
function setMapOnAll() {
	for (var i = 0; i < markers.length; i++) {
		if (visable[i]) {
			markers[i].setMap(globalMap);
			
			if (!infowin[i].opened) infowin[i].close();
			else infowin[i].open(globalMap, markers[i]);
			
			console.log(markers[i]);
		}
		else {
			markers[i].setMap(null);
			infowin[i].close();
			infowin[i].opened = false;
		}
	}
}
function geocodeExcute(loc, next) {	
	var initColorValue = parseInt("0000FF", 16);
	var endColorValue = parseInt("FF0000" , 16);
	var addValue = parseFloat( endColorValue - initColorValue ) / (addname.length+1) ;

	var pinColorHex = "0000FF";
	var pinColorInt = parseInt(pinColorHex , 16) + parseInt((geoIter+1) * addValue);
	
	if (loc != "인천광역시")
		loc = "인천광역시 " + loc;
	
	globalGeocoder.geocode(
		{ 'address' : loc },
		function(results, status) {
			if (status === google.maps.GeocoderStatus.OK) {
				pinColorHex = pinColorInt.toString(16);
				console.log(pinColorHex);
				console.log(status);

				var sName = results[0].address_components[0].short_name.toString();
				var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColorHex,
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
				
				marker.set("type", "point");
				marker.set("id", markers.length.toString());
				//globalBounds.extend(marker.position);
									
				console.log(marker);
				markers.push(marker);
				
				delay = 100;
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
		
		load_info.close();
		getMksInfo();
		d.ot(0);
	}
}
