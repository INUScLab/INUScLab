<%@ page import = "java.sql.*" %>

<%

	Connection conn = null;						// null로 초기화 한다.

	try{
		String url = "jdbc:mysql://localhost:3306/jdbcTest";	// 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "testid";					// 사용자 계정
		String pw = "testpw";					// 사용자 계정의 패스워드

		Class.forName("com.mysql.jdbc.Driver");			// 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
		conn=DriverManager.getConnection(url,id,pw);		// DriverManager 객체로부터 Connection 객체를 얻어온다.
		out.println("제대로 연결되었습니다.");				// 커넥션이 제대로 연결되면 수행된다.


	}
	catch(Exception e){						// 예외가 발생하면 예외 상황을 처리한다.
		e.printStackTrace();
	}
%>

<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=false&region=KR"> 
</script> 

<script type="text/javascript">
var StreetViewPanorama = new function(){}
var globalGeocoder;
var globalMap;
var globalMarker;
var address = "송내역";

function initialize(x, y) { // 맵 초기화
	// 입력된 좌표가 없으면 기본좌표를 역삼동으로 설정.
	if(x==0){ x=37.50075507977441; }
	if(y==0){ y=127.03690767288208; }

	//alert('ok');
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
</script>

<div id="map_canvas" style="width: 450px; height: 450px;" >
	<script type="text/javascript"> initialize(0, 0); </script>
</div>