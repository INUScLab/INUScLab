var StreetViewPanorama = new function() {
}
var globalGeocoder;
var globalMap;
var address;
var init_zoom = 12;
var addname = new Array();
var markers = new Array();
var infowin = new Array();
var visable = new Array();
google.maps.InfoWindow.prototype.opened = false;

// 맵 초기화
function initialize(x, y) {
	// Incheon
	if (x == 0) {
		x = 37.4562557;
	}
	if (y == 0) {
		y = 126.70520620000002;
	}

	addname.push("청학동");
	addname.push("산곡동");
	addname.push("송월동");
	addname.push("검암동");
	addname.push("연수구");
	addname.push("부평구");
	addname.push("동구");
	addname.push("서구");
	addname.push("인천광역시");

	for ( var i in addname)
		visable.push(true);

	globalGeocoder = new google.maps.Geocoder();
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
	geocodeAddress(globalGeocoder, globalMap);

	
	
	
	
	
	
	
	
	
	var input = document.getElementById('pac-input');
	var searchBox = new google.maps.places.SearchBox(input);
	console.log("searchBox" , searchBox);
	globalMap.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

	var autocomplete = new google.maps.places.Autocomplete(input);
	autocomplete.bindTo('bounds', globalMap);

	var infowindow = new google.maps.InfoWindow();
	var marker = new google.maps.Marker({
		map : globalMap,
		anchorPoint : new google.maps.Point(0, -29)
	});

	autocomplete.addListener('place_changed', function() {
		infowindow.close();
		marker.setVisible(false);
		var place = autocomplete.getPlace();
		if (!place.geometry) {
			window.alert("Autocomplete's returned place contains no geometry");
			return;
		}

		// If the place has a geometry, then present it on a map.
		if (place.geometry.viewport) {
			globalMap.fitBounds(place.geometry.viewport);
		} else {
			globalMap.setCenter(place.geometry.location);
			globalMap.setZoom(17); // Why 17? Because it looks good.
		}
		marker.setIcon(/** @type {google.maps.Icon} */
		({
			url : place.icon,
			size : new google.maps.Size(71, 71),
			origin : new google.maps.Point(0, 0),
			anchor : new google.maps.Point(17, 34),
			scaledSize : new google.maps.Size(35, 35)
		}));
		marker.setPosition(place.geometry.location);
		marker.setVisible(true);

		var address = '';
		if (place.address_components) {
			address = [
					(place.address_components[0]
							&& place.address_components[0].short_name || ''),
					(place.address_components[1]
							&& place.address_components[1].short_name || ''),
					(place.address_components[2]
							&& place.address_components[2].short_name || '') ]
					.join(' ');
		}

		infowindow.setContent('<div><strong>' + place.name + '</strong><br>'
				+ address);
		infowindow.open(globalMap, marker);
	});

}

function setData(cons, pred, name) {
	var data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
		role : "style"
	} ], [ '사용량', cons, '#b87333' ], // RGB value
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
		width : 120,
		height : 80,
		fontSize : 10,
		bar : {
			groupWidth : "95%"
		},
		legend : {
			position : "none"
		},
	};

	var node = document.createElement('div'), infoWindow = new google.maps.InfoWindow(), chart = new google.visualization.ColumnChart(
			node);

	chart.draw(view, options);
	return node;
}

function getMksInfo(map) {
	for (var i = 0; i < markers.length; i++) {
		if (markers[i].title < 0 || markers[i].title >= markers.length) {
			markers[i].setTitle(i.toString());
		}

		var contentString = addname[i];

		if (infowin.length < markers.length) {
			var iwin = new google.maps.InfoWindow({
				// content: contentString
				content : setData(i, i, contentString)
			});

			// console.log(setData(1,5, contentString));

			iwin.opened = true;
			infowin.push(iwin);

			markers[i].addListener('click', function() {
				var idx = this.title;
				if (infowin[idx].opened) {
					infowin[idx].close();
					infowin[idx].opened = false;
				} else {
					infowin[idx].open(map, this);
					infowin[idx].opened = true;
				}
			});
		} else
			infowin[i].setContent(contentString);
	}
}

// Sets the map on all markers in the array.
function setMapOnAll(map) {
	for (var i = 0; i < markers.length; i++) {
		if (visable[i]) {
			markers[i].setMap(map);
			infowin[i].open(map, markers[i]);
			infowin[i].opened = true;
		} else {
			markers[i].setMap(null);
			infowin[i].close();
			infowin[i].opened = false;
		}
	}
}

function geocodeAddress(geocoder, resultsMap) {
	var loc;

	for ( var a in addname) {
		loc = addname[a];
		if (loc != "인천광역시")
			loc = "인천광역시 " + loc;

		geocoder.geocode({
			'address' : loc
		}, function(results, status) {
			if (status === google.maps.GeocoderStatus.OK) {

				globalMap.setCenter(results[0].geometry.location);

				var marker = new google.maps.Marker({
					title : "-1",
					position : results[0].geometry.location,
					draggable : false
				});

				markers.push(marker);
				if (addname.length == markers.length) {
					getMksInfo(resultsMap);
					setMapOnAll(resultsMap);
				}
			} else
				a--;
		});
	}
}
