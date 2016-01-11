var globalGeocoder;
var globalMap;
// var globalBounds;

var address;
var geoIter = 0;
var delay = 100;
var init_zoom = 13;
var load_info;
var addname = new Array();
var markers = new Array();
var visable = new Array();
var geocoder = new google.maps.Geocoder();
var searchMarkers = [];

// 로딩 개선 임시 함수 - 주소 반환
function retAddress(num) {
	var ret = [

	/*
	 * new google.maps.LatLng(37.4706225, 126.62348259999999), // 해안동4가 new
	 * google.maps.LatLng(37.4713196, 126.6222775), // 해안동3가 new
	 * google.maps.LatLng(37.4721283, 126.62117690000002), // 해안동2가 new
	 * google.maps.LatLng(37.4727853, 126.61997369999995), // 해안동1가 new
	 * google.maps.LatLng(37.4527683, 126.60540530000003), // 항동7가 new
	 * google.maps.LatLng(37.4699837, 126.62288089999993), // 항동6가 new
	 * google.maps.LatLng(37.4706863, 126.6217011), // 항동5가 new
	 * google.maps.LatLng(37.4713561, 126.62049189999993), // 항동4가 new
	 * google.maps.LatLng(37.4720203, 126.61934550000001), // 항동3가 new
	 * google.maps.LatLng(37.4722867, 126.61748220000004), // 항동2가 new
	 * google.maps.LatLng(37.4740084, 126.61688030000005), // 항동1가 new
	 * google.maps.LatLng(37.4712676, 126.62409560000003), // 중앙동4가 new
	 * google.maps.LatLng(37.4719717, 126.62285199999997), // 중앙동3가 new
	 * google.maps.LatLng(37.4727503, 126.6217077), // 중앙동2가 new
	 * google.maps.LatLng(37.4734147, 126.62044070000002), // 중앙동1가 new
	 * google.maps.LatLng(37.4969641, 126.55511049999996), // 중산동 new
	 * google.maps.LatLng(37.4771504, 126.62608560000001), // 전동 new
	 * google.maps.LatLng(37.475303, 126.6307779), // 인현동 new
	 * google.maps.LatLng(37.4516407, 126.38298450000002), // 을왕동 new
	 * google.maps.LatLng(37.4692908, 126.6358113), // 율목동 new
	 * google.maps.LatLng(37.4701037, 126.63748379999993), // 유동 new
	 * google.maps.LatLng(37.4608981, 126.46788179999999), // 운서동 new
	 * google.maps.LatLng(37.5136961, 126.51457959999993), // 운북동 new
	 * google.maps.LatLng(37.4871994, 126.52872330000002), // 운남동 new
	 * google.maps.LatLng(37.44384489999999, 126.40241779999997), // 용유동 new
	 * google.maps.LatLng(37.4732405, 126.6311968), // 용동 new
	 * google.maps.LatLng(37.493814, 126.53115389999994), // 영종동 new
	 * google.maps.LatLng(37.4532083, 126.60450880000008), // 연안동 new
	 * google.maps.LatLng(37.4370836, 126.62632910000002), // 신흥동3가 new
	 * google.maps.LatLng(37.4675463, 126.63497819999998), // 신흥동2가 new
	 * google.maps.LatLng(37.467379, 126.63162990000001), // 신흥동1가 new
	 * google.maps.LatLng(37.467569, 126.63400560000002), // 신흥동 new
	 * google.maps.LatLng(37.4703185, 126.62506239999993), // 신포동 new
	 * google.maps.LatLng(37.4661435, 126.62879459999999), // 신생동 new
	 * google.maps.LatLng(37.4731843, 126.62581950000003), // 송학동3가 new
	 * google.maps.LatLng(37.4737442, 126.62442980000003), // 송학동2가 new
	 * google.maps.LatLng(37.47453530000001, 126.62255110000001), // 송학동1가 new
	 * google.maps.LatLng(37.4781178, 126.62090319999993), // 송월동3가 new
	 * google.maps.LatLng(37.4788625, 126.61935599999993), // 송월동2가 new
	 * google.maps.LatLng(37.4802231, 126.62312210000005), // 송월동1가 new
	 * google.maps.LatLng(37.4799553, 126.62422919999995), // 송월동 new
	 * google.maps.LatLng(37.465605, 126.63703859999998), // 선화동 new
	 * google.maps.LatLng(37.4746348, 126.61808659999997), // 선린동 new
	 * google.maps.LatLng(37.4687046, 126.62515150000002), // 사동 new
	 * google.maps.LatLng(37.475791, 126.62082599999997), // 북성동3가 new
	 * google.maps.LatLng(37.4763567, 126.61819309999998), // 북성동2가 new
	 * google.maps.LatLng(37.4719734, 126.60649519999993), // 북성동1가 new
	 * google.maps.LatLng(37.4752058, 126.61853489999999), // 북성동 new
	 * google.maps.LatLng(37.3851838, 126.41862860000003), // 무의동 new
	 * google.maps.LatLng(37.4767898, 126.6290338), // 동인천동 new
	 * google.maps.LatLng(37.4669935, 126.64011499999992), // 도원동 new
	 * google.maps.LatLng(37.4374541, 126.42279370000006), // 덕교동 new
	 * google.maps.LatLng(37.470025, 126.62940720000006), // 답동 new
	 * google.maps.LatLng(37.4734741, 126.62807229999999), // 내동 new
	 * google.maps.LatLng(37.4513142, 126.41376709999997), // 남북동 new
	 * google.maps.LatLng(37.4720069, 126.62478409999994), // 관동3가 new
	 * google.maps.LatLng(37.4727273, 126.62346049999996), // 관동2가 new
	 * google.maps.LatLng(37.4736524, 126.62160990000007), // 관동1가 new
	 * google.maps.LatLng(37.4720018, 126.6327215), // 경동 new
	 * google.maps.LatLng(37.2545429, 126.30721859999994), // 자월면 new
	 * google.maps.LatLng(37.255991, 126.48386600000003), // 영흥면 new
	 * google.maps.LatLng(37.6649707, 125.69830330000002), // 연평면 new
	 * google.maps.LatLng(37.5323923, 126.42712690000008), // 북도면 new
	 * google.maps.LatLng(37.9728415, 124.71827099999996), // 백령면 new
	 * google.maps.LatLng(37.4562557, 126.70520620000002), // 인천광역시 new
	 * google.maps.LatLng(37.8237659, 124.71183139999994), // 대청면 new
	 * google.maps.LatLng(37.4245633, 126.66513310000005), // 청학동 new
	 * google.maps.LatLng(37.4263243, 126.64820029999998), // 옥련2동 new
	 * google.maps.LatLng(37.4276293, 126.65525460000003), // 옥련1동 new
	 * google.maps.LatLng(37.4195759, 126.69183520000001), // 연수3동 new
	 * google.maps.LatLng(37.4116317, 126.68180840000002), // 연수2동 new
	 * google.maps.LatLng(37.4221584, 126.68158619999997), // 연수1동 new
	 * google.maps.LatLng(37.4075206, 126.64533979999999), // 송도3교 new
	 * google.maps.LatLng(37.3995724, 126.62018920000003), // 송도2동 new
	 * google.maps.LatLng(37.3913837, 126.65161690000002), // 송도1동 new
	 * google.maps.LatLng(37.4289492, 126.69698590000007), // 선학동 new
	 * google.maps.LatLng(37.408438, 126.6782809), // 동춘3동 new
	 * google.maps.LatLng(37.4027156, 126.66930990000003), // 동춘2동 new
	 * google.maps.LatLng(37.40946479999999, 126.67080959999998), // 동춘1동 new
	 * google.maps.LatLng(37.5349774, 126.65575190000004), // 청라중흥S클래스2단지아파트 new
	 * google.maps.LatLng(37.5320889, 126.65683519999993), // 청라딜라이트타워1차 new
	 * google.maps.LatLng(37.5128726, 126.62709710000001), // 원창동 new
	 * google.maps.LatLng(37.597461, 126.70511110000007), // 원당동 new
	 * google.maps.LatLng(37.5890784, 126.64717380000002), // 왕길동 new
	 * google.maps.LatLng(37.5814539, 126.6021538), // 오류동 new
	 * google.maps.LatLng(37.5489758, 126.67819400000008), // 연희동 new
	 * google.maps.LatLng(37.5419307, 126.67925790000004), // 심곡동 new
	 * google.maps.LatLng(37.514508, 126.67227849999995), // 신현원창동 new
	 * google.maps.LatLng(37.5179976, 126.66719749999993), // 신현동 new
	 * google.maps.LatLng(37.5715712, 126.69168109999998), // 시천동 new
	 * google.maps.LatLng(37.5080919, 126.67844509999998), // 석남3동 new
	 * google.maps.LatLng(37.5028704, 126.6747236), // 석남2동 new
	 * google.maps.LatLng(37.5111474, 126.6747504), // 석남1동 new
	 * google.maps.LatLng(37.579081, 126.67223969999998), // 백석동 new
	 * google.maps.LatLng(37.6045958, 126.66772020000008), // 마전동 new
	 * google.maps.LatLng(37.6249822, 126.6644288), // 대곡동 new
	 * google.maps.LatLng(37.5863452, 126.70368009999993), // 당하동 new
	 * google.maps.LatLng(37.6141387, 126.6438508), // 금곡동 new
	 * google.maps.LatLng(37.55127179999999, 126.69373100000007), // 공촌동 new
	 * google.maps.LatLng(37.539602, 126.62609680000003), // 경서동 new
	 * google.maps.LatLng(37.5648367, 126.68359429999998), // 검암동 new
	 * google.maps.LatLng(37.5642799, 126.67344400000002), // 검암경서동 new
	 * google.maps.LatLng(37.6058577, 126.65349919999994), // 2 서구검단 new
	 * google.maps.LatLng(37.5883248, 126.67819409999993), // 검단4동 new
	 * google.maps.LatLng(37.5937487, 126.6975238), // 검단3동 new
	 * google.maps.LatLng(37.6171347, 126.68869110000003), // 검단2동 new
	 * google.maps.LatLng(37.60216399999999, 126.66124919999993), // 검단1동 new
	 * google.maps.LatLng(37.4873175, 126.68352819999996), // 가좌4동 new
	 * google.maps.LatLng(37.4923998, 126.67975039999999), // 가좌3동 new
	 * google.maps.LatLng(37.4907611, 126.68475000000001), // 가좌2동 new
	 * google.maps.LatLng(37.4939275, 126.67294600000002), // 가좌1동 new
	 * google.maps.LatLng(37.515314, 126.67775000000006), // 가정3동 new
	 * google.maps.LatLng(37.5263396, 126.67777760000001), // 가정2동 new
	 * google.maps.LatLng(37.5232009, 126.67441710000003), // 가정1동 new
	 * google.maps.LatLng(37.5147585, 126.70444240000006), // 청천2동 new
	 * google.maps.LatLng(37.5170362, 126.70172060000004), // 청천1동 new
	 * google.maps.LatLng(37.484319, 126.74685509999995), // 일신동 new
	 * google.maps.LatLng(37.4738196, 126.7079152), // 십정2동 new
	 * google.maps.LatLng(37.4757631, 126.69624929999998), // 십정1동 new
	 * google.maps.LatLng(37.5116204, 126.73646729999996), // 삼산2동 new
	 * google.maps.LatLng(37.5183696, 126.73763299999996), // 삼산1동 new
	 * google.maps.LatLng(37.5017602, 126.71133110000005), // 산곡4동 new
	 * google.maps.LatLng(37.4909005, 126.70966450000003), // 산곡3동 new
	 * google.maps.LatLng(37.5057877, 126.70860820000007), // 산곡2동 new
	 * google.maps.LatLng(37.5069264, 126.70013700000004), // 산곡1동 new
	 * google.maps.LatLng(37.4864013, 126.7244412), // 부평6동 new
	 * google.maps.LatLng(37.4935945, 126.72791269999993), // 부평5동 new
	 * google.maps.LatLng(37.5008166, 126.72488479999993), // 부평4동 new
	 * google.maps.LatLng(37.4860951, 126.7081928), // 부평3동 new
	 * google.maps.LatLng(37.4868181, 126.71774679999999), // 부평2동 new
	 * google.maps.LatLng(37.4942333, 126.71999640000001), // 부평1동 new
	 * google.maps.LatLng(37.5042323, 126.73482869999998), // 부개3동 new
	 * google.maps.LatLng(37.4947335, 126.73699469999997), // 부개2동 new
	 * google.maps.LatLng(37.4854567, 126.73680100000001), // 부개1동 new
	 * google.maps.LatLng(37.4710711, 126.75441160000003), // 구산동 new
	 * google.maps.LatLng(37.5105654, 126.7257184), // 갈산2동 new
	 * google.maps.LatLng(37.5175916, 126.72707909999997), // 갈산1동 new
	 * google.maps.LatLng(37.4790534, 126.63098749999995), // 화평동 new
	 * google.maps.LatLng(37.4843169, 126.63014450000003), // 화수2동 new
	 * google.maps.LatLng(37.4814283, 126.62992259999999), // 화수1.화평동 new
	 * google.maps.LatLng(37.4710516, 126.63996739999993), // 창영동 new
	 * google.maps.LatLng(37.4878262, 126.63907940000001), // 송현3동 new
	 * google.maps.LatLng(37.4761425, 126.63720809999995), // 송현1.2동 new
	 * google.maps.LatLng(37.4773181, 126.64803189999998), // 송림6동 new
	 * google.maps.LatLng(37.478179, 126.64989270000001), // 송림4동 new
	 * google.maps.LatLng(37.4729016, 126.64650419999998), // 송림3.5동 new
	 * google.maps.LatLng(37.4757902, 126.64264350000008), // 송림2동 new
	 * google.maps.LatLng(37.4762061, 126.64025470000001), // 송림1동 new
	 * google.maps.LatLng(37.483261, 126.62556189999998), // 만석동 new
	 * google.maps.LatLng(37.4725685, 126.6398388), // 금창동 new
	 * google.maps.LatLng(37.6141387, 126.6438508), // 금곡동 new
	 * google.maps.LatLng(37.4359079, 126.74752339999998), // 장수서창동 new
	 * google.maps.LatLng(37.4588216, 126.76046710000003), // 장수동 new
	 * google.maps.LatLng(37.4384605, 126.76397769999994), // 운연동 new
	 * google.maps.LatLng(37.4366931, 126.72847179999997), // 수산동 new
	 * google.maps.LatLng(37.4331494, 126.75235399999997), // 서창동 new
	 * google.maps.LatLng(37.4436848, 126.73763510000003), // 만수6동 new
	 * google.maps.LatLng(37.4579329, 126.72783070000003), // 만수5동 new
	 * google.maps.LatLng(37.4594598, 126.7356069), // 만수4동 new
	 * google.maps.LatLng(37.4618213, 126.72319199999993), // 만수3동 new
	 * google.maps.LatLng(37.4592098, 126.73083029999998), // 만수2동 new
	 * google.maps.LatLng(37.4487671, 126.73199649999992), // 만수1동 new
	 * google.maps.LatLng(37.4184043, 126.72590059999993), // 도림동 new
	 * google.maps.LatLng(37.3936979, 126.70111380000003), // 논현고잔동 new
	 * google.maps.LatLng(37.4108924, 126.69841769999994), // 논현2동 new
	 * google.maps.LatLng(37.4053411, 126.72960439999997), // 논현1동 new
	 * google.maps.LatLng(37.4243564, 126.70940559999997), // 남촌동 new
	 * google.maps.LatLng(37.4322408, 126.7152486), // 남촌도림동 new
	 * google.maps.LatLng(37.4495728, 126.72410830000001), // 구월4동 new
	 * google.maps.LatLng(37.452655, 126.69688880000001), // 구월3동 new
	 * google.maps.LatLng(37.4561268, 126.71355410000001), // 구월2동 new
	 * google.maps.LatLng(37.4523223, 126.71169340000006), // 구월1동 new
	 * google.maps.LatLng(37.3928913, 126.70230909999998), // 고잔동 new
	 * google.maps.LatLng(37.4665143, 126.70066610000003), // 간석4동 new
	 * google.maps.LatLng(37.46607059999999, 126.71452569999997), // 간석3동 new
	 * google.maps.LatLng(37.4616541, 126.70894339999995), // 간석2동 new
	 * google.maps.LatLng(37.4585714, 126.70530480000002), // 간석1동
	 */

	/** ************ 남구 ****************** */
	new google.maps.LatLng(37.4464052, 126.66750290000004), // 학익2동
	new google.maps.LatLng(37.4399059, 126.66392040000005), // 학익1동
	new google.maps.LatLng(37.4495722, 126.68933470000002), // 주안8동
	new google.maps.LatLng(37.4483491, 126.67764080000006), // 주안7동
	new google.maps.LatLng(37.4622647, 126.68936129999997), // 주안6동
	new google.maps.LatLng(37.4658472, 126.68702840000003), // 주안5동
	new google.maps.LatLng(37.4548766, 126.69025039999997), // 주안4동
	new google.maps.LatLng(37.4447945, 126.67394730000001), // 주안3동
	new google.maps.LatLng(37.4546543, 126.6728081), // 주안2동
	new google.maps.LatLng(37.4637642, 126.67672449999998), // 주안1동
	new google.maps.LatLng(37.452459, 126.64036639999995), // 용현5동
	new google.maps.LatLng(37.4567647, 126.65189310000005), // 용현3동
	new google.maps.LatLng(37.4551537, 126.64550480000003), // 용현2동
	new google.maps.LatLng(37.45620890000001, 126.65980939999997), // 용현1.4동
	new google.maps.LatLng(37.4649858, 126.65914220000002), // 숭의4동
	new google.maps.LatLng(37.4625139, 126.64719939999998), // 숭의2동
	new google.maps.LatLng(37.4672073, 126.6471153), // 숭의1.3동
	new google.maps.LatLng(37.4376286, 126.68502940000008), // 문학동
	new google.maps.LatLng(37.4674306, 126.6647256), // 도화2.3동
	new google.maps.LatLng(37.4608476, 126.67380789999993), // 도화1동
	new google.maps.LatLng(37.444267, 126.69686109999998), // 관교동
	/** ******************************* */

	/*
	 * new google.maps.LatLng(37.5250633, 126.71002450000003), // 효성2동 new
	 * google.maps.LatLng(37.5324505, 126.71210710000003), // 효성1동 new
	 * google.maps.LatLng(37.5807815, 126.78688569999997), // 하야동 new
	 * google.maps.LatLng(37.5841036, 126.77138339999999), // 평동 new
	 * google.maps.LatLng(37.5762231, 126.73577150000006), // 장기동 new
	 * google.maps.LatLng(37.5279794, 126.73643889999994), // 작전서운동 new
	 * google.maps.LatLng(37.5328956, 126.723884), // 작전2동 new
	 * google.maps.LatLng(37.530757, 126.72985540000002), // 작전1동 new
	 * google.maps.LatLng(37.5468065, 126.73456520000002), // 임학동 new
	 * google.maps.LatLng(37.5867154, 126.73941000000002), // 이화동 new
	 * google.maps.LatLng(37.5403889, 126.74493559999996), // 용종동 new
	 * google.maps.LatLng(37.5814539, 126.6021538), // 오류동 new
	 * google.maps.LatLng(37.5782688, 126.74567159999992), // 선주지동 new
	 * google.maps.LatLng(37.5309726, 126.7511591), // 서운동 new
	 * google.maps.LatLng(37.5741841, 126.77099680000003), // 상야동 new
	 * google.maps.LatLng(37.546437, 126.74719749999997), // 병방동 new
	 * google.maps.LatLng(37.5549455, 126.7328738), // 방축동 new
	 * google.maps.LatLng(37.5554494, 126.7465598), // 박촌동 new
	 * google.maps.LatLng(37.5640787, 126.71032170000001), // 목상동 new
	 * google.maps.LatLng(37.58016569999999, 126.68830130000003), // 둑실동 new
	 * google.maps.LatLng(37.5600517, 126.75978529999998), // 동양동 new
	 * google.maps.LatLng(37.5636, 126.72232589999999), // 다남동 new
	 * google.maps.LatLng(37.5812841, 126.75827140000001), // 노오지동 new
	 * google.maps.LatLng(37.5673308, 126.74496709999994), // 귤현동 new
	 * google.maps.LatLng(37.5366733, 126.72916129999999), // 계산3동 new
	 * google.maps.LatLng(37.5436725, 126.73707739999998), // 계양2동 new
	 * google.maps.LatLng(37.5766125, 126.73424269999998), // 계양1동 new
	 * google.maps.LatLng(37.5345067, 126.74171619999993), // 계산4동 new
	 * google.maps.LatLng(37.5366733, 126.72916129999999), // 계산3동 new
	 * google.maps.LatLng(37.5441443, 126.72802219999994), // 계산2동 new
	 * google.maps.LatLng(37.5428944, 126.72438360000001), // 계산1동 new
	 * google.maps.LatLng(37.5776763, 126.72326450000003), // 갈현동 new
	 * google.maps.LatLng(37.6318251, 126.41973140000005), // 화도면 new
	 * google.maps.LatLng(37.7745941, 126.41118059999997), // 하점면 new
	 * google.maps.LatLng(37.7984931, 126.40827300000001), // 양사면 new
	 * google.maps.LatLng(37.6631371, 126.42199170000004), // 양도면 new
	 * google.maps.LatLng(37.764413, 126.46346760000006), // 송해면 new
	 * google.maps.LatLng(37.7125767, 126.48474880000003), // 선원면 new
	 * google.maps.LatLng(37.6506578, 126.24166560000003), // 서도면 new
	 * google.maps.LatLng(37.7033913, 126.32082850000006), // 삼산면 new
	 * google.maps.LatLng(37.6864711, 126.48021229999995), // 불은면 new
	 * google.maps.LatLng(37.71917699999999, 126.38999860000001), // 내가면 new
	 * google.maps.LatLng(37.6405809, 126.49117509999996), // 길상면 new
	 * google.maps.LatLng(37.7838437, 126.28317199999992), // 교동면 new
	 * google.maps.LatLng(37.7483209, 126.4835663), // 강화읍 new
	 * google.maps.LatLng(37.4737341, 126.62147959999993), // 중구 new
	 * google.maps.LatLng(37.213889, 126.17833300000007), // 옹진군 new
	 * google.maps.LatLng(37.4094099, 126.67830879999997), // 연수구 new
	 * google.maps.LatLng(37.5454212, 126.67597230000001), // 서구 new
	 * google.maps.LatLng(37.5069818, 126.72177390000002), // 부평구 new
	 * google.maps.LatLng(37.4738184, 126.64333850000003), // 동구 new
	 * google.maps.LatLng(37.4469893, 126.73194160000003), // 남동구 new
	 * google.maps.LatLng(37.4636808, 126.65047709999999), // 남구 new
	 * google.maps.LatLng(37.53695039999999, 126.73774349999997), // 계양구 new
	 * google.maps.LatLng(37.7467263, 126.4878731), // 강화군 new
	 * google.maps.LatLng(37.4562557, 126.70520620000002), // 인천광역시
	 */
	];

	return ret[parseInt(num)];
}

// 맵 초기화
function initialize(x, y) {
	// Incheon
	if (x == 0)
		x = 37.4562557;
	if (y == 0)
		y = 126.70520620000002;

	if (addname.length != d.aNodes.length) {
		delete addname;
		for (var i = d.aNodes.length - 1; i >= 0; i--)
			addname.push(d.aNodes[i].name);
	}

	for ( var i in addname) {
		visable.push(true);
	}

	globalGeocoder = new google.maps.Geocoder();
	// globalBounds = new google.maps.LatLngBounds();
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

	globalMap = new google.maps.Map(document.getElementById("map_canvas"),
			myOptions);

	// Search Box
	var input = document.getElementById('pac-input');

	// Color-interpolation Box
	var colorBox = document.getElementById('color-interpolation');

	// Hide boxes
	input.hidden = true;
	colorBox.hidden = true;

	// Appending boxes
	globalMap.controls[google.maps.ControlPosition.TOP_RIGHT].push(input);
	globalMap.controls[google.maps.ControlPosition.BOTTOM_LEFT].push(colorBox);

	load_info = new google.maps.InfoWindow();
	load_info.open(globalMap, new google.maps.Marker({
		map : globalMap,
		position : latlng,
		draggable : false,
		icon : "null"
	}));

	geocodeAddress();

	globalMap.addListener('zoom_changed', function() {
		// console.log('Zoom: ' + globalMap.getZoom() );
		console.log('Zoom: ' + globalMap.getCenter());
		// 줌을 확대했을때 map center와 일정한 거리 안에 들어오는 동은 전부 상세 주소 출력.
	});
	
	//autoComplete Event
	var autocomplete = new google.maps.places.Autocomplete(input);
	google.maps.event.addDomListener(window, 'load', initialize);
	
	service.style.visibility="hidden";	// 부가서비스 테이블 숨기기
}


function setData(cons, pred, name) {
	var data = google.visualization.arrayToDataTable([ [ 'Element', 'value', {
		role : "style"
	} ], [ '사용량', cons, '#b87333' ], // RGB value
	[ '예측량', pred, 'silver' ], // English color name
	[ '일주일 평균', cons, '#b87333' ],
	[ '지역 평균', cons, '#b87333' ]
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
	//	width : 300,
	//	height : 260,
		fontSize : 10,
		bar : {
			groupWidth : "95%"
		},
		legend : {
			position : "none"
		},
	};

	chart = new google.visualization.ColumnChart(document
			.getElementById("info_graph"));

	chart.draw(view, options);
}

function drawHistory() {

    var data = new google.visualization.DataTable();
    data.addColumn('date', 'Time of Day');
    data.addColumn('number', 'Rating');

    /* 
    data.addRows([
      [new Date(2015, 1, 22), <%=days7Usage.get(6).get(0)%>],  [new Date(2015, 1, 23), <%=days7Usage.get(5).get(0)%>],  [new Date(2015, 1, 24), <%=days7Usage.get(4).get(0)%>],  [new Date(2015, 1, 25), <%=days7Usage.get(3).get(0)%>],
      [new Date(2015, 1, 26), <%=days7Usage.get(2).get(0)%>],  [new Date(2015, 1, 27), <%=days7Usage.get(1).get(0)%>],  [new Date(2015, 1, 28), <%=days7Usage.get(0).get(0)%>],
    ]);
     */

    data.addRows([
                  [new Date(2015, 1, 22), 100],  [new Date(2015, 1, 23), 300],  [new Date(2015, 1, 24), 200],  [new Date(2015, 1, 25), 400],
                  [new Date(2015, 1, 26), 300],  [new Date(2015, 1, 27), 300],  [new Date(2015, 1, 28), 600],
                ]);


    var options = {
            //width: 900,
            //height: 500,
            hAxis: {
              format: 'yy-MM-dd'
              //gridlines: {count: 15}
            },
            vAxis: {
              gridlines: {color: 'none'},
              minValue: 900,
              maxValue:1100
            },
            legend : {
    			position : "none"
    		}
          };

    var chart = new google.visualization.LineChart(document.getElementById('info_history'));

    chart.draw(data, options);
  }

function getMksInfo() {
	for (var i = 0; i < markers.length; i++) {
		markers[i].addListener('click',
				function() {
					var idx = this.get("id");
					console.log(this);
					setData(parseFloat(idx) + 0.5, parseFloat(idx) + 0.7,
							addname[idx]);
					
					drawHistory();	// history 그래프 그리기
					service.style.visibility="visible";	// 부가서비스 테이블 보여주기

					globalMap.setCenter(this.position);
					
					// 동을 클릭했을때
					getDetailAreaInformation();
				});
	}

}

// 동을 클릭했을때
function getDetailAreaInformation() {

	console.log(globalMap.getZoom());
	// 맵의 줌이 확대됨.
	// 구글맵에서 동을 검색했을때 확대되는 줌 값.
	if(globalMap.getZoom() != 16 ) {
		globalMap.setOptions({
			'zoom' : globalMap.getZoom() + 3
		});
	}

	// 동에 해당하는 상세 주소 리스트를 받아옴.

	// 상세 주소 리스트의 개수만큼 마커를 생성하고 띄움.

}

// Sets the map on all markers in the array.
function setMapOnAll() {
	for (var i = 0; i < markers.length; i++) {
		if (visable[i]) {
			markers[i].setMap(globalMap);
		} else {
			markers[i].setMap(null);
		}
	}
}

function geocodeExcute(loc, next) {

	var redColor = "FF0000";
	var greenColor = "2EFE64";
	var color = "";

	if (normalUsedDongList.indexOf(loc) != -1)
		color = greenColor;
	else
		color = redColor;

	var pinImage = new google.maps.MarkerImage(
			"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
					+ color, new google.maps.Size(21, 34),
			new google.maps.Point(0, 0), new google.maps.Point(10, 34));
	var pinShadow = new google.maps.MarkerImage(
			"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
			new google.maps.Size(40, 37), new google.maps.Point(0, 0),
			new google.maps.Point(12, 35));
	var marker = new google.maps.Marker({
		title : loc,
		position : retAddress(geoIter),
		draggable : false,
		icon : pinImage,
		shadow : pinShadow,
	});
	marker.set("type", "point");
	marker.set("id", markers.length.toString());
	// globalBounds.extend(marker.position);

	markers.push(marker);

	if (addname.length != markers.length) {
		load_info
				.setContent("<Strong>Now Loading</Strong><br>" + 100
						* parseFloat(markers.length)
						/ parseFloat(addname.length) + "%");
	}

	next();

	/*
	 * if (loc != "인천광역시") loc = "인천광역시 " + loc;
	 * 
	 * globalGeocoder.geocode( { 'address' : loc }, function(results, status) {
	 * if (status === google.maps.GeocoderStatus.OK) { //pinColorHex =
	 * pinColorInt.toString(16);
	 * 
	 * var sName = results[0].address_components[0].short_name.toString(); var
	 * pinImage = new
	 * google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" +
	 * color,//pinColorHex, new google.maps.Size(21, 34), new
	 * google.maps.Point(0,0), new google.maps.Point(10, 34)); var pinShadow =
	 * new
	 * google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
	 * new google.maps.Size(40, 37), new google.maps.Point(0, 0), new
	 * google.maps.Point(12, 35)); var marker = new google.maps.Marker({ title :
	 * sName, position : results[0].geometry.location, draggable : false, icon:
	 * pinImage, shadow: pinShadow, }); marker.set("type", "point");
	 * marker.set("id", markers.length.toString());
	 * //globalBounds.extend(marker.position);
	 * 
	 * markers.push(marker);
	 * 
	 * delay/=2; if(delay < 100) delay = 100;
	 * 
	 * if (addname.length != markers.length){ load_info.setContent( "<Strong>Now
	 * Loading</Strong><br>" + 100 * parseFloat(markers.length) /
	 * parseFloat(addname.length) + "%" ); } } else if (status ===
	 * google.maps.GeocoderStatus.OVER_QUERY_LIMIT) { geoIter--; if(geoIter < 0)
	 * geoIter = 0;
	 * 
	 * delay++; } next(); } );
	 */
}

function geocodeAddress() {
	if (geoIter < addname.length) {
		// setTimeout( 'geocodeExcute("'+ addname[geoIter] +'",
		// geocodeAddress)', delay );
		setTimeout('geocodeExcute("' + addname[geoIter] + '", geocodeAddress)',
				0);
		geoIter++;
	} else {
		// globalMap.fitBounds(globalBounds);
		globalMap.setCenter(markers[markers.length - 1].position);

		// Show boxes
		document.getElementById('pac-input').hidden = false;
		document.getElementById('color-interpolation').hidden = false;

		load_info.close();
		getMksInfo();
		d.ot(0);
	}
}

var searchMarker = new google.maps.Marker();

function codeAddress() {

	// Get Address from HTML
	var address = document.getElementById("pac-input").value;
	var color = "0000FF";

	var pinImage = new google.maps.MarkerImage(
			"http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|"
					+ color, new google.maps.Size(21, 34),
			new google.maps.Point(0, 0), new google.maps.Point(10, 34));
	var pinShadow = new google.maps.MarkerImage(
			"http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
			new google.maps.Size(40, 37), new google.maps.Point(0, 0),
			new google.maps.Point(12, 35));

	console.log("codeAddress");
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status === google.maps.GeocoderStatus.OK) {

			searchMarker.setMap(null);

			// Locate to map
			globalMap.setCenter(results[0].geometry.location);

			// if address is dong or block or specific area , zoom level + 3
			if (address == "부개동") {
				getDetailAreaInformation();

				// if address is not a dong or specific area , restore zoom
				// level to 13
			} else {

				globalMap.setOptions({
					'zoom' : 13
				});

				// Create Marker
				searchMarker = new google.maps.Marker({
					map : globalMap,
					position : results[0].geometry.location,
					icon : pinImage,
					shadow : pinShadow
				});
				searchMarkers.push(marker);
			}

		} else {
			alert('Geocode was not successful for the following reason: '
					+ status);
		}
	});

}
//내껄로 되돌아감.
