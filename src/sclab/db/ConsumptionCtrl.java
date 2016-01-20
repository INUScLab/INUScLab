package sclab.db;

import java.sql.*;
import java.util.*;

import sclab.db.DbConnector;

public class ConsumptionCtrl {

	DbConnector dbconnector = new DbConnector();
	Connection conn = dbconnector.getConn();
	PreparedStatement pstmt = dbconnector.getPstmt();
	
	public void disconnect(){
		dbconnector.disconnect();
	}
	
	// 일사용량(7일)
	public ArrayList<ArrayList<String>> get7dayUsage(String umdong) {

		ArrayList<ArrayList<String>> datas = new ArrayList<ArrayList<String>>();
		
		String sql = "select sum(CONSUMED), sum(PREDICTED) from CONSUMPTION where CODE in(select CODE from USER where UMDONG = \'" + umdong + "\') and DATE between '2015-02-22' and '2015-02-28' group by DATE order by DATE DESC;";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				ArrayList<String> usage = new ArrayList<String>();
				
				usage.add(rs.getString("sum(CONSUMED)"));
				usage.add(rs.getString("sum(PREDICTED)"));
				datas.add(usage);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 주 사용량
	public String[] getWeekUsage(String umdong) {
		
		String[] datas = new String[2];
		
		String sql = "select sum(CONSUMED), sum(PREDICTED) from CONSUMPTION where CODE in(select CODE from USER where UMDONG = \'" + umdong + "\') and DATE between '2015-02-22' and '2015-02-28';";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				datas[0] = rs.getString("sum(CONSUMED)");
				datas[1] = rs.getString("sum(PREDICTED)");
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 월 사용량
	public String[] getMonthUsage(String umdong) {
		
		String[] datas = new String[2];
		
		String sql = "select sum(CONSUMED), sum(PREDICTED) from CONSUMPTION where CODE = ANY(select CODE from USER where UMDONG = \'" + umdong + "\') and DATE between '2015-02-22' and '2015-02-28';";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				datas[0] = rs.getString("sum(CONSUMED)");
				datas[1] = rs.getString("sum(PREDICTED)");
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
}