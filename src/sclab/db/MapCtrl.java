package sclab.db;

import java.sql.*;
import java.util.*;

import sclab.db.DbConnector;

public class MapCtrl {

	DbConnector dbconnector = new DbConnector();
	Connection conn = dbconnector.getConn();
	PreparedStatement pstmt = dbconnector.getPstmt();

	// OverUse flag가 1인 동을 받아옴 
	public ArrayList<User> getOverUsedDongList() {

		ArrayList<User> overUsedDongList = new ArrayList<User>();

		String sql = "SELECT DISTINCT UMDONG FROM USER where code in (SELECT DISTINCT code FROM CONSUMPTION WHERE overused=1 and DATE='2015-02-28')";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUmdong(rs.getString("umdong"));
				overUsedDongList.add(user);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbconnector.disconnect();
		}
		return overUsedDongList;
	}

	//OverUse flag가 1인 동을 받아옴.
	public ArrayList<User> getNormalDongList() {

		ArrayList<User> normalDongList = new ArrayList<User>();

		String sql = "SELECT DISTINCT UMDONG FROM USER where code in (SELECT DISTINCT code FROM CONSUMPTION WHERE overused=0 and DATE='2015-02-28')";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUmdong(rs.getString("umdong"));
				normalDongList.add(user);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbconnector.disconnect();
		}
		return normalDongList;
	}

}