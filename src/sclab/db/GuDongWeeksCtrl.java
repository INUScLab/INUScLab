package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuDongWeeksCtrl {

	DbConnector dbconnector = new DbConnector();
	Connection conn = dbconnector.getConn();
	PreparedStatement pstmt = dbconnector.getPstmt();

	public ArrayList<GuDongWeeks> getGuDongWeeksList ( ) {

		ArrayList<GuDongWeeks> getGuDongWeeksList  = new ArrayList<GuDongWeeks> () ;
		
		String guGun;
		String umDong;
		double day1;
		double day2;
		double day3;
		double day4;
		double day5;
		double day6;
		double day7;
		
		String sql = "SELECT DISTINCT UMDONG AS DONG ,SIGOON AS GOON, (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-21') ) AS DAY1 , (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-22') ) AS DAY2 ,  (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-23') ) AS DAY3 , (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-24') ) AS DAY4 , (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-25') ) AS DAY5 , (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-26') ) AS DAY6 ,  (SELECT SUM(CONSUMED) FROM CONSUMPTION WHERE CODE IN ( SELECT CODE FROM USER WHERE UMDONG = DONG AND SIGOON = GOON AND DATE = '2015-02-27') ) AS DAY7   FROM USER";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				guGun = rs.getString("DONG");
				umDong = rs.getString("GOON");
				day1 = rs.getDouble("DAY1");
				day2 = rs.getDouble("DAY2");
				day3 = rs.getDouble("DAY3");
				day4 = rs.getDouble("DAY4");
				day5 = rs.getDouble("DAY5");
				day6 = rs.getDouble("DAY6");
				day7 = rs.getDouble("DAY7");
				
				System.out.println(rs);
				
				GuDongWeeks guDongWeeks = new GuDongWeeks( guGun , umDong, day1 , day2 , day3 , day4 , day5 , day6 , day7);
				getGuDongWeeksList.add(guDongWeeks);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return getGuDongWeeksList;
	}

}
