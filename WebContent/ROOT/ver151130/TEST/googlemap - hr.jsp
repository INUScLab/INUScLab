<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<style type="text/css">
 	#map_canvas { width: 300px; height: 350px; margin-left: 50px; margin: auto; }
</style>

<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=false&region=KR"> 
</script> 

<script type="text/javascript">
function initialize(x, y) { // 맵 초기화
	// 입력된 좌표가 없으면 기본좌표를 역삼동으로 설정.
	if(x==0){ x=37.50075507977441; }
	if(y==0){ y=127.03690767288208; }

	globalGeocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(x, y);

	var myOptions = { 
		zoom: 16, 
		center: latlng, 
		//disableDoubleClickZoom:false,
        
		navigationControl: false,    // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
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
	var address = "송내역";
	geocoder.geocode(
		{'address': address},
		function(results, status) {
			if (status === google.maps.GeocoderStatus.OK) {
				globalMap.setCenter(results[0].geometry.location);

				var globalMarker = new google.maps.Marker({
					map: globalMap, 
					position: results[0].geometry.location,
					draggable: false} );
			}
			else {
				alert('Geocode was not successful for the following reason: ' + status);
			}
		}
	);
}
</script> 
</head>

<body onload="initialize(0,0)">
	<div id="map_canvas"></div>
</body>
</html>