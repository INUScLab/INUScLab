package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DongSummaryReportCtrl {

	DbConnector dbconnector ;
	Connection conn  ;
	PreparedStatement pstmt ;
	
	public DongSummaryReportCtrl() {
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
		
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}

	public ArrayList<DongSummaryReport> getDongSummaryReportList ( String dongName ) {

		ArrayList<DongSummaryReport> dongSummuryReportList  = new ArrayList<DongSummaryReport> () ;
		
		
		String guGun;
		String umDong;
		String latelyLeak;
		double monthAverage;
		double day1;
		double day2;
		double day3;
		double day4;
		double day5;
		double day6;
		double day7;
		
		String sql = "SELECT DISTINCT SIGOON AS GOON, UMDONG AS DONG , ( SELECT SUM(CONSUMED)/28 FROM CONSUMPTION WHERE CODE IN (SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON ) AND DATE BETWEEN '2015-02-01' AND '2015-02-28') AS MONTHAVG ,(SELECT DATE FROM CONSUMPTION WHERE CODE IN (SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON ) AND LEAK=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYLEEK , (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-21') ) AS DAY1 , (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-22') ) AS DAY2 ,  (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-23') ) AS DAY3 , (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-24') ) AS DAY4 , (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-25') ) AS DAY5 , (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-26') ) AS DAY6 ,  (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-27') ) AS DAY7   FROM USER";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				guGun = rs.getString("GOON");
				umDong = rs.getString("DONG");
				latelyLeak = rs.getString("LATELYLEEK");
				monthAverage = rs.getDouble("MONTHAVG");
				day1 = rs.getDouble("DAY1");
				day2 = rs.getDouble("DAY2");
				day3 = rs.getDouble("DAY3");
				day4 = rs.getDouble("DAY4");
				day5 = rs.getDouble("DAY5");
				day6 = rs.getDouble("DAY6");
				day7 = rs.getDouble("DAY7");
				
				DongSummaryReport guDongWeeks = new DongSummaryReport( guGun , umDong, monthAverage, latelyLeak, day1 , day2 , day3 , day4 , day5 , day6 , day7);
				dongSummuryReportList.add(guDongWeeks);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return dongSummuryReportList;
	}

	//사용량,예측량,지역 평균 사용량 
	//일주일 히스토리
	//부가서비스 별 회
}
