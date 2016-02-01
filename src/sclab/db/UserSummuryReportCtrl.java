package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserSummuryReportCtrl {

	DbConnector dbconnector ;
	Connection conn  ;
	PreparedStatement pstmt ;
	
	public UserSummuryReportCtrl() {
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
		
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}

	

	public ArrayList<UserSummuryReport> getUserSummuryReportList ( ) {

		ArrayList<UserSummuryReport> userSummuryReportList  = new ArrayList<UserSummuryReport> () ;
		
		String guGun;
		String umDong;
		String detail;
		double monthAverage;
		String latelyLeak;
		double day1;
		double day2;
		double day3;
		double day4;
		double day5;
		double day6;
		double day7;
		
		String sql = "SELECT  U.SIGOON , U.UMDONG , U.DETAIL , ( SELECT SUM(CONSUMED)/28 FROM CONSUMPTION WHERE CODE = U.CODE AND DATE BETWEEN '2015-02-01' AND '2015-02-28') AS MONTHAVG , (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND LEAK=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYLEEK ,  (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-21')  AS 1DAY , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-22')  AS 2DAY , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-23')  AS 3DAY , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-24')  AS 4DAY , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-25')  AS 5DAY , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-26')  AS 6DAY , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '2015-02-27')  AS 7DAY FROM USER U";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				guGun = rs.getString("U.SIGOON");
				umDong = rs.getString("U.UMDONG");
				detail = rs.getString("U.DETAIL");
				monthAverage = rs.getDouble("MONTHAVG");
				latelyLeak = rs.getString("LATELYLEEK");
				day1 = rs.getDouble("DAY1");
				day2 = rs.getDouble("DAY2");
				day3 = rs.getDouble("DAY3");
				day4 = rs.getDouble("DAY4");
				day5 = rs.getDouble("DAY5");
				day6 = rs.getDouble("DAY6");
				day7 = rs.getDouble("DAY7");
				
				UserSummuryReport userSummuryReport = new UserSummuryReport( guGun , umDong, detail, monthAverage, latelyLeak, day1 , day2 , day3 , day4 , day5 , day6 , day7);
				userSummuryReportList.add(userSummuryReport);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return userSummuryReportList;
	}

}
