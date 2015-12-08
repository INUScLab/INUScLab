var StreetViewPanorama = new function(){}
var globalGeocoder;
var globalMap;
var globalMarker;
var markers = [ ] ;

//var address = "대한민국";

function initialize(x, y) { // 맵 초기화

	//Incheon
	if(x==0){ x=37.4562557; }
	if(y==0){ y=126.70520620000002; }
	

	globalGeocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(x, y);

	var myOptions = { 
		zoom: 10,
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
	
	//Delete all markers before search
	deletemarkers();
	
	geocoder.geocode(
		{'address': address},
		function(results, status) {
			if (status === google.maps.GeocoderStatus.OK) {
				resultsMap.setCenter(results[0].geometry.location);

				globalMarker = new google.maps.Marker({
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

function treeNodeClicked( spot ) {
	
	//spot지명으로 SELECT query실행하기.
	
	
	
}

//Deletes all markers in the array by removing references to them.
function deletemarkers() {
  setMapOnAll(null);
  markers = [];
}
