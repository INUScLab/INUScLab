<%@ page import = "java.sql.*" pageEncoding="utf-8"  %>

<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?sensor=false&region=KR"> 
</script>

<script type="text/javascript">
var StreetViewPanorama = new function(){}
var globalGeocoder;
var globalMap;
var globalMarker;
var address = "부천시청";

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

<%!
public String queryAddress() throws Exception {
	String url = "jdbc:mysql://sclab-database.ccf2v8m44pmt.ap-northeast-1.rds.amazonaws.com:3306/sclab";
	String id = "sclab";						// 사용자 계정
	String pw = "sclab422";						// 사용자 계정의 패스워드
	String res = "송내역";
	String userid = "1";

	//userid = (String)request.getAttribute("USERID");

	if(!userid.equals("0")) {
		Connection conn = null;					// null로 초기화 한다.
		Class.forName("com.mysql.jdbc.Driver");			// 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

		String strTemp = " ";
		try{
			conn = DriverManager.getConnection(url,id,pw);	// DriverManager 객체로부터 Connection 객체를 얻어온다.
			strTemp = "제대로 연결되었습니다.";			// 커넥션이 제대로 연결되면 수행된다.
		}
		catch(Exception e) {					// 예외가 발생하면 예외 상황을 처리한다.
			strTemp = "문제 발생.";
			e.printStackTrace();
			return res;
		}

		
		/*
		if(conn != null) {
			String sql = "SELECT ADDRESS FROM USER WHERE NUMBER='MT_00"+ userid + "'";
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try{
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while(rs.next()){
					res = rs.getString(1);
				}
			}
			catch(Exception e) {
				System.out.println(e);
			}
			finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				conn.close();
			}
		}
		*/
	}

	return res;
}
%>


<%-- function querying(id_num) {
	 address = "<%= queryAddress() %>";
	switch(id_num) {
		case 0001 : initMap1;
		case 0002 : address = "부천시 중동"
		case 0003 : address = "부산광역시"
		case 0004 : address = "인천대학교 정보기술대학"
		case 0005 : address = "서울시청"
		default : address = "대한민국"
	}
	geocodeAddress(globalGeocoder, globalMap);
} --%>

function test(element) {
	var idx = element.selectedIndex;
	var val = element.options[idx].value;
	var content = element.options[idx].innerHTML;

	switch(val) {
	case "1" : address = "부천시청"; break;
	case "2" : address = "서울시청"; break;
	case "3" : address = "인천시청"; break;
	default : break;
	geocodeAddress(globalGeocoder, globalMap);
	}
}
	


</script>

<br>
<form name="id_form" align="left" method="get" action="googlemap.jsp" >
	<span>  지도에 출력할 사용자의 번호를 선택하세요 :   </span>
	<select onChange="test(this)">
		<option value="0">부천시청</option>
		<option value="1">서울시청</option>
		<option value="2">인천시청</option>
	</select>
</form>

<br>
<div id="map_canvas" style="width: 450px; height: 450px;" >
	<script type="text/javascript"> initialize(0, 0); </script>
</div>
<br>
