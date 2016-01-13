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

	public ArrayList<ArrayList<UserConsumption>> getUSerConsumption ( ) {

		ArrayList<ArrayList<UserConsumption>> userConsumptionList = new ArrayList<ArrayList<UserConsumption>> () ;
		
		String umDong;
		String detail;
		double lat;
		double lng;
		double consumed;
		double predicted;
		int leak;
		int absence;
		int overused;
		
		String sql = "SELECT UMDONG.U , DETAIL.U , LAT.U , LNG.U , CONSUMED.C , PREDICTED.C , LEAK.C , ABSENCE.C , OVERUSED.C FROM USER AS U , CONSUMPTION AS C WHERE USER.CODE = CONSUMPTION.CODE AND CONSUMPTION.DATE = '2015-02-28'  ";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				umDong = rs.getString("UMDONG");
				detail = rs.getString("DETAIL");
				lat = rs.getDouble("LAT");
				lng = rs.getDouble("LNG");
				consumed = rs.getDouble("CONSUMED");
				predicted = rs.getDouble("PREDICTED");
				leak = rs.getInt("LEAK");
				absence = rs.getInt("ABSENCE");
				overused= rs.getInt("OVERUSED");
				
				UserConsumption userConsumption = new UserConsumption(umDong, detail, lat, lng, consumed, predicted, leak, absence, overused);
//				userConsumptionList.add(userConsumption);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userConsumptionList;
	}

}
