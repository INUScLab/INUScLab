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
		
		String umDong;
		String detail;
		double lat;
		double lng;
		double consumed;
		double predicted;
		int leak;
		int absence;
		int overused;
		
		String sql = "SELECT U.UMDONG , U.DETAIL , U.LAT , U.LNG , C.CONSUMED , C.PREDICTED , C.LEAK , C.ABSENCE , C.OVERUSED FROM USER U INNER JOIN CONSUMPTION C ON U.CODE = C.CODE AND C.DATE = '2015-02-28'";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				umDong = rs.getString("U.UMDONG");
				detail = rs.getString("U.DETAIL");
				lat = rs.getDouble("U.LAT");
				lng = rs.getDouble("U.LNG");
				consumed = rs.getDouble("C.CONSUMED");
				predicted = rs.getDouble("C.PREDICTED");
				leak = rs.getInt("C.LEAK");
				absence = rs.getInt("C.ABSENCE");
				overused= rs.getInt("C.OVERUSED");
				
				UserConsumption userConsumption = new UserConsumption(umDong, detail, lat, lng, consumed, predicted, leak, absence, overused);
				userConsumptionList.add(userConsumption);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userConsumptionList;
	}

}
