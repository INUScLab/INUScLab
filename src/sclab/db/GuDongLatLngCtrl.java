package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuDongLatLngCtrl {

	DbConnector dbconnector ;
	Connection conn ;
	PreparedStatement pstmt ;

	public GuDongLatLngCtrl() {
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}

	void disconnect(){
		dbconnector.disconnect();
	}


	public ArrayList<GuDongLatLng> getGuDongLatLngList ( ) {

		ArrayList<GuDongLatLng> guDongLatLngList  = new ArrayList<GuDongLatLng> () ;
		
		String guGun;
		String umDong;
		double lat;
		double lng;
		
		String sql = "SELECT G.NAME AS GUGUN_NAME , D.NAME AS UMDONG_NAME , D.LAT , D.LNG FROM SIGOON G INNER JOIN UMDONG D ON G.NO = D.SIGOON_NO WHERE D.NAME NOT in (select NAME FROM UMDONG where NAME ='전체') ";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				guGun = rs.getString("GUGUN_NAME");
				umDong = rs.getString("UMDONG_NAME");
				lat = rs.getDouble("LAT");
				lng = rs.getDouble("LNG");
				
				GuDongLatLng guDongLatLng = new GuDongLatLng( guGun , umDong, lat, lng);
				guDongLatLngList.add(guDongLatLng);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return guDongLatLngList;
	}

}
