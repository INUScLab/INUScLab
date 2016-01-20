package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserConsumptionCtrl {

	DbConnector dbconnector = new DbConnector();
	Connection conn = dbconnector.getConn();
	PreparedStatement pstmt = dbconnector.getPstmt();

	public ArrayList<UserConsumption> getUSerConsumption ( ) {

		ArrayList<UserConsumption> userConsumptionList = new ArrayList<UserConsumption> () ;
		
		String siGoon;
		String umDong;
		String detail;
		double lat;
		double lng;
		double consumed;
		double predicted;
		int leak;
		int absence;
		int overused;
		
		String sql = "SELECT U.SIGOON , U.UMDONG , U.DETAIL , U.LAT , U.LNG , C.CONSUMED , C.PREDICTED , C.LEAK , C.ABSENCE , C.OVERUSED FROM USER U INNER JOIN CONSUMPTION C ON U.CODE = C.CODE AND C.DATE = '2015-02-28'";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				siGoon = rs.getString("SIGOON");
				umDong = rs.getString("UMDONG");
				detail = rs.getString("DETAIL");
				lat = rs.getDouble("LAT");
				lng = rs.getDouble("LNG");
				consumed = rs.getDouble("CONSUMED");
				predicted = rs.getDouble("PREDICTED");
				leak = rs.getInt("LEAK");
				absence = rs.getInt("ABSENCE");
				overused= rs.getInt("OVERUSED");

				
				UserConsumption userConsumption = new UserConsumption(siGoon , umDong, detail, lat, lng, consumed, predicted, leak, absence, overused);
				userConsumptionList.add(userConsumption);
			}
			rs.close();
		} catch (SQLException e) {
		}

		return userConsumptionList;
	}

}
