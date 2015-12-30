package sclab.db;

import java.sql.*;
import java.util.*;

import sclab.db.DbConnector;

public class UserCtrl{

	DbConnector dbconnector = new DbConnector();
	Connection conn = dbconnector.getConn();
	PreparedStatement pstmt = dbconnector.getPstmt();
	
	// 전체 주소록 목록을 가져오는 메서드
	public ArrayList<User> getDBList() {
		
		ArrayList<User> datas = new ArrayList<User>();
		
		String sql = "select * from USER";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				User user = new User();
				
				user.setCode(rs.getInt("code"));
				user.setSido(rs.getString("sido"));
				user.setSigoon(rs.getString("sigoon"));
				user.setUmdong(rs.getString("umdong"));
				user.setBlock(rs.getString("block"));
				datas.add(user);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			dbconnector.disconnect();
		}
		return datas;
	}
	
	// 동 목록을 가져오는 메서드
		public ArrayList<User> getdongList() {
			
			ArrayList<User> datas = new ArrayList<User>();
			
			String sql = "select distinct umdong from USER ";
			
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					User user = new User();
					user.setUmdong(rs.getString("umdong"));
					datas.add(user);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				dbconnector.disconnect();
			}
			return datas;
		}
	
}