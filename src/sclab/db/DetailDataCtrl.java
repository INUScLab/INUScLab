package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DetailDataCtrl {

	DbConnector dbconnector;
	Connection conn;
	PreparedStatement pstmt;
	
	public String code;
	public String detail;
	public String number;
	public String meter_num;
	public String startday;
	public String endday;
	
	public DetailDataCtrl(){
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	
	void setParameters(String code, String detail, String number, String meter_num, String year, String month){
		this.code = code;
		this.detail = detail;
		this.number = number;
		this.meter_num = meter_num;
		this.startday = year + month + "01";
		this.endday = year + month + "31";
	}
	
	// 기본적인 정보 반환
	ArrayList<String> getInfo() {

		ArrayList<String> datas = new ArrayList<String>();
		String sql = null;
		
		sql = "select u.code, u.detail, u.number, u.meter_num, u.meter_type, sum(consumed) from USER u inner join CONSUMPTION c on u.code = c.code where (date between '" + startday + "' and '" + endday + "') and (u.code=" + code + " or u.detail='" + detail + "' or u.number= " + number + " or u.meter_num='" + meter_num + "')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				datas.add(rs.getString("u.code"));
				datas.add(rs.getString("u.detail"));
				datas.add(rs.getString("u.number"));
				datas.add(rs.getString("u.meter_num"));
				datas.add(rs.getString("u.meter_type"));
				datas.add(rs.getString("sum(consumed)"));
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 기간동안의 각각의 사용량
	ArrayList<String> getConsumedDays() {

		ArrayList<String> datas = new ArrayList<String>();
		String sql = null;
		
		sql = "select consumed from USER u inner join CONSUMPTION c on u.code = c.code where (date between '" + startday + "' and '" + endday + "') and (u.code=" + code + " or u.detail='" + detail + "' or u.number= " + number + " or u.meter_num='" + meter_num + "')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				datas.add(rs.getString("consumed"));
			}
	
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 모든 작업은 여기서 한다.
	public DetailData returnDatas(String code, String detail, String number, String meter_num, String year, String month){
		
		setParameters(code, detail, number, meter_num, year, month);
		
		DetailData dd = new DetailData();
		
		// 기본 정보
		ArrayList<String> info_array = getInfo();
		dd.setCode(info_array.get(0));
		dd.setDetail(info_array.get(1));
		dd.setNumber(info_array.get(2));
		dd.setMeter_num(info_array.get(3));
		dd.setMeter_type(info_array.get(4));
		dd.setTotal_consumed(info_array.get(5));
		
		dd.setConsumed_days(getConsumedDays());

		// DB연결 해제
		disconnect();
		
		return dd;
	}
}
