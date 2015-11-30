<%@ page import = "java.sql.*" pageEncoding="utf-8"  %>

<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=false&region=KR"> 
</script>

<script type="text/javascript">
var StreetViewPanorama = new function(){}
var globalGeocoder;
var globalMap;
var globalMarker;
var address = "역삼동";

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



function querying(element) { 
	var idx = element.selectedIndex; 
	var val = element.options[idx].value; 

	switch(val) { 
		case "1" : address = "부천시청"; break;
		case "2" : address = "부천시 원미구 중4동 은하마을"; break;
		case "3" : address = "광주시청"; break;
		case "4" : address = "인천대학교 정보기술대학"; break;
		case "5" : address = "서울시청"; break;
		default : address = "역삼동"; break;
	} 
	geocodeAddress(globalGeocoder, globalMap); 
}

</script>
<!-- 이건 주석 -->
<br>
<form name="id_form" align="left" method="post" action="">
	<span>  지도에 출력할 사용자의 번호를 선택하세요 :   </span>
	<select onChange="querying(this)">
		<option value="0">초기화</option>
		<option value="1">부천시청</option>
		<option value="2">은하마을</option>
		<option value="3">광주시청</option>
		<option value="4">인천대학교 정보기술대학</option>
		<option value="5">서울시청</option>
	</select>
</form>

<br>
<div id="map_canvas" style="width: 100%; height: 80%;" >
	<script type="text/javascript"> initialize(0, 0); </script>
</div>
<br>
