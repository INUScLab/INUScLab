package sclab.db;

import java.sql.*;
import java.util.*;

import sclab.db.DbConnector;

public class MapCtrl {

	DbConnector dbconnector ;
	Connection conn ;
	PreparedStatement pstmt ;

	public MapCtrl() {
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}

	// OverUse flag가 1인 동을 받아옴 
	public ArrayList<String> getOverUsedDongList() {

		ArrayList<String> overUsedDongList = new ArrayList<String>();

		String sql = "SELECT DISTINCT UMDONG FROM USER where code in (SELECT DISTINCT code FROM CONSUMPTION WHERE overused=1 and DATE='2015-02-28')";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String Umdong = new String();
				Umdong = rs.getString("umdong");
				overUsedDongList.add(Umdong);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return overUsedDongList;
	}

	//OverUse flag가 0인 동을 받아옴.
	public ArrayList<String> getNormalDongList() {

		ArrayList<String> normalDongList = new ArrayList<String>();

		String sql = "SELECT DISTINCT UMDONG FROM USER where UMDONG not in (SELECT DISTINCT UMDONG FROM USER where code in (SELECT DISTINCT code FROM CONSUMPTION WHERE overused=1 and DATE='2015-02-28') )";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String umDong = new String();
				umDong = rs.getString("umdong");
				normalDongList.add(umDong);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return normalDongList;
	}

}