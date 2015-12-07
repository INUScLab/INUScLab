var StreetViewPanorama = new function(){}
var globalGeocoder;
var globalMap;
var globalMarker;
var address = "대한민국";

function initialize(x, y) { // 맵 초기화
	// 입력된 좌표가 없으면 기본좌표를 대한민국 경위도 원점.
	if(x==0){ x=37.16333659; }
	if(y==0){ y=127.03148913; }

	globalGeocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(x, y);

	var myOptions = { 
		zoom: 6,
		center: latlng, 
		//disableDoubleClickZoom:false,
        
		navigationControl: false,    // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택..
		navigationControlOptions: { 
			position: google.maps.ControlPosition.TOP_RIGHT,
			style: google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
		},
        
		streetViewControl: false,
		scaleControl: false,    // 지도 축적 보여줄 것인지.
		//scaleControlOptions: { position: google.maps.ControlPosition.TOP_RIGHT },
        
		mapTypeControl: false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
		mapTypeId: google.maps.MapTypeId.ROADMAP  // HYBRID, ROADMAP, SATELLITE, TERRAIN
	}; 

	globalMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	geocodeAddress(globalGeocoder, globalMap);   
}

function geocodeAddress(geocoder, resultsMap) {
	geocoder.geocode(
		{'address': address},
		function(results, status) {
			if (status === google.maps.GeocoderStatus.OK) {
				resultsMap.setCenter(results[0].geometry.location);

				var globalMarker = new google.maps.Marker({
					map: resultsMap, 
					position: results[0].geometry.location,
					draggable: false} );
			}
			else {
				alert('Geocode was not successful for the following reason: ' + status);
			}
		}
	);
}