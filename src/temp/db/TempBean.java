package temp.db;

import java.sql.*;
import java.util.*;

public class TempBean{

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// MySQL 연결정보
			String jdbc_driver = "com.mysql.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://sclab-database.ccf2v8m44pmt.ap-northeast-1.rds.amazonaws.com:3306/sclab";
	
	// 데이터베이스 연결 메서드
	void connect(){
		try{
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,"sclab","sclab422");
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	void disconnect(){
		if(pstmt != null){
			try{
				pstmt.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(conn != null){
			try{
				conn.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	// 전체 주소록 목록을 가져오는 메서드
	public ArrayList<Consumption> getDBList() {
		connect();
		ArrayList<Consumption> datas = new ArrayList<Consumption>();
		
		String sql = "select * from CONSUMPTION";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Consumption consumption = new Consumption();
				
				System.out.println(rs.getInt("code"));
				consumption.setCode(rs.getInt("code"));
				consumption.setDate(rs.getString("date"));
				consumption.setPredict_value(rs.getString("predict_value"));
				consumption.setRaw_value(rs.getString("raw_value"));
				datas.add(consumption);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
}