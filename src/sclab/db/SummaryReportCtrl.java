package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SummaryReportCtrl {

	DbConnector dbconnector ;
	Connection conn  ;
	PreparedStatement pstmt ;
	
	String guGun;
	String umDong;
	String detail;
	double lat;
	double lng;
	
	double consumed;
	double predicted;
	
	int leak;
	int absence;
	int freezed;
	int reverse;
	int fat;
	int breakage;
	
	String latelyLeak;
	String latelyAbsence;
	String latelyFreezed;
	String latelyReverse;
	String latelyFat;
	String latelyBreakage;
	
	double day1;
	double day2;
	double day3;
	double day4;
	double day5;
	double day6;
	double day7;
	
	String gun;
	String dong;
	
	public SummaryReportCtrl() {
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
		
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}

	public ArrayList<SummaryReport> getSummaryReportList ( ) {

		ArrayList<SummaryReport> summuryReportList  = new ArrayList<SummaryReport> () ;
		
//		String  addressArray [ ] = address.split(" ");
//		this.gun = addressArray[1];
//		this.dong = addressArray[2];
//		
		String sql = "SELECT U.SIGOON , U.UMDONG , U.DETAIL , U.LAT , U.LNG , C.CONSUMED , C.PREDICTED , C.LEAK , C.ABSENCE , C.FREEZED , C.REVERSE , C.FAT , C.BREAKAGE ,  (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND LEAK=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYLEAK ,  (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND ABSENCE=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYABSENCE , (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND FREEZED=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYFREEZED ,  (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND REVERSE=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYREVERSE ,  (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND FAT=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYFAT , (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND BREAKAGE=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYBREAKAGE ,  (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-21') AS DAY1 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-22') AS DAY2 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-23') AS DAY3 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-24') AS DAY4 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-25') AS DAY5 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-26') AS DAY6 ,(SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-27') AS DAY7 FROM USER U INNER JOIN CONSUMPTION C ON U.CODE = C.CODE AND C.DATE = '2015-02-28'";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				guGun = rs.getString("U.SIGOON");
				umDong = rs.getString("U.UMDONG");
				detail = rs.getString("U.DETAIL");
				lat = rs.getDouble("U.LAT");
				lng = rs.getDouble("U.LNG");
				
				consumed = rs.getDouble("C.CONSUMED");
				predicted = rs.getDouble("C.PREDICTED");
				
				leak = rs.getInt("C.LEAK");
				absence = rs.getInt("C.ABSENCE");
				freezed = rs.getInt("C.FREEZED");
				reverse = rs.getInt("C.REVERSE");
				fat = rs.getInt("C.FAT");
				breakage = rs.getInt("C.BREAKAGE");
				
				latelyLeak = rs.getString("LATELYLEAK");
				latelyAbsence = rs.getString("LATELYABSENCE");
				latelyFreezed = rs.getString("LATELYFREEZED");
				latelyReverse = rs.getString("LATELYREVERSE");
				latelyFat = rs.getString("LATELYFAT");
				latelyBreakage = rs.getString("LATELYBREAKAGE");
				
				day1 = rs.getDouble("DAY1");
				day2 = rs.getDouble("DAY2");
				day3 = rs.getDouble("DAY3");
				day4 = rs.getDouble("DAY4");
				day5 = rs.getDouble("DAY5");
				day6 = rs.getDouble("DAY6");
				day7 = rs.getDouble("DAY7");
				
				SummaryReport dongSummaryReport  = new SummaryReport( guGun , umDong , detail , lat , lng , consumed , predicted , 
						leak , absence , freezed , reverse ,fat , breakage , 
						latelyLeak , latelyAbsence , latelyFreezed , latelyReverse , latelyFat , latelyBreakage , 
						day1 , day2 , day3 , day4 , day5 , day6 , day7 );
				
				summuryReportList.add(dongSummaryReport);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return summuryReportList;
	}

	//사용량,예측량,지역 평균 사용량 
	//일주일 히스토리
	//부가서비스 별 회
}
