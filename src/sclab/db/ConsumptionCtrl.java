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
	
	// 오늘부터 7일간의 데이터를 각각 반환
	public ArrayList<String[]> get7dayUsage(int code) {
		
		ArrayList<String[]> datas = new ArrayList<String[]>();
		
		String sql = "select CONSUMED, PREDICTED from CONSUMPTION where CODE = " + code + " and DATE between '2015-02-01' and '2015-02-07' order by DATE desc;";
		
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				String[] usage = new String[2];
				
				usage[0] = rs.getString("consumed");
				usage[1] = rs.getString("predicted");
				System.out.println(usage[0]+ "," + usage[1]);
				datas.add(usage);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 오늘부터 일주일간의 데이터를 더하여 반환
	public ArrayList<String[]> getWeekUsage(int code) {
		
		ArrayList<String[]> datas = new ArrayList<String[]>();
		
		String sql = "select sum(CONSUMED), sum(PREDICTED) from CONSUMPTION where CODE = " + code + " and DATE between '2015-02-01' and '2015-02-07';";
		
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				String[] usage = new String[2];
				
				usage[0] = rs.getString("sum(CONSUMED)");
				usage[1] = rs.getString("sum(PREDICTED)");
				System.out.println(usage[0]+ "," + usage[1]);
				datas.add(usage);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 오늘부터 한달간의 데이터를 더하여 반환
	public ArrayList<String[]> getMonthUsage(int code) {
		
		ArrayList<String[]> datas = new ArrayList<String[]>();
		
		String sql = "select sum(CONSUMED), sum(PREDICTED) from CONSUMPTION where CODE = " + code + " and DATE between '2015-02-01' and '2015-02-28' order by DATE desc;";
		
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				String[] usage = new String[2];
				
				usage[0] = rs.getString("sum(CONSUMED)");
				usage[1] = rs.getString("sum(PREDICTED)");
				System.out.println(usage[0]+ "," + usage[1]);
				datas.add(usage);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 오늘부터 7일간의 데이터를 같은 동에 해당하는 사람들의 값을 모두 더하여 반환
	public ArrayList<String[]> getAll7dayUsage(ArrayList<Integer> codes) {
		
		ArrayList<String[]> datas = new ArrayList<String[]>();
		
		Iterator it = codes.iterator();
		ArrayList<String[]> day7usage = new ArrayList<String[]>();
		
		while (it.hasNext()) {
			String sql = "select sum(CONSUMED), sum(PREDICTED) from CONSUMPTION where CODE = " + it.next() + " and DATE between '2015-02-01' and '2015-02-28' order by DATE desc;";
			
			System.out.println(sql);
			
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					String[] usage = new String[2];
					
					usage[0] = rs.getString("consumed");
					usage[1] = rs.getString("predicted");
					
					System.out.println(usage[0]+ "," + usage[1]);
					datas.add(usage);
				}
				rs.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return datas;
	}
}