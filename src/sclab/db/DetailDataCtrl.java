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
	
	public String sido;
	public String sigoon;
	public String umdong;
	public String code;
	public String detail;
	public String number;
	public String meter_num;
	public String startday;
	public String endday;
	public String year;
	public boolean allnull;
	
	public DetailDataCtrl(){
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	
	void setParameters(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String year, String month){
		
		if(sido == null || sido.equals("전체")){
			this.sido = "%"; this.sigoon = "%"; this.umdong = "%";
		}
		else if (sigoon == null || sigoon.equals("전체")){
			this.sido = sido; this.sigoon = "%"; this.umdong = "%";
		}
		else if (umdong == null || umdong.equals("전체")){
			this.sido = sido; this.sigoon = sigoon; this.umdong = "%";
		}
		else{
			this.sido = sido; this.sigoon = sigoon; this.umdong = umdong;
		}
		
		this.code = code;
		this.detail = detail;
		this.number = number;
		this.meter_num = meter_num;

		if(code == null && detail == null && number == null && meter_num == null){
			this.allnull = true;
		}
		else{
			this.allnull = false;
		}
		
		if(month != null){
			this.startday = year + month + "01";
			this.endday = year + month + "31";
		}
		else{
			this.year = year;
		}
	}
	
	// 검색한 정보 반환
	ArrayList<DetailData> getInfo() {

		ArrayList<DetailData> datas = new ArrayList<DetailData>();
		String sql = null;
		
		sql = "select u.code, u.detail, u.number, u.meter_num, u.meter_type, sum(consumed), group_concat(consumed) from (select * from USER where sido like \"" + sido + "\" and sigoon like \"" + sigoon + "\" and umdong like \"" + umdong + "\") u inner join CONSUMPTION c on u.code = c.code where (date between '" + startday + "' and '" + endday + "') and (u.code=" + code + " or u.detail='" + detail + "' or u.number= " + number + " or u.meter_num='" + meter_num + "' or " + allnull + ") group by u.code";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				DetailData temp = new DetailData();
				temp.setCode(rs.getString("u.code"));
				temp.setDetail(rs.getString("u.detail"));
				temp.setNumber(rs.getString("u.number"));
				temp.setMeter_num(rs.getString("u.meter_num"));
				temp.setMeter_type(rs.getString("u.meter_type"));
				temp.setTotal_consumed(rs.getString("sum(consumed)"));
				
				String[] str = new String(rs.getString("group_concat(consumed)")).split(",");
				
				temp.setConsumed_days(str);
				
				datas.add(temp);
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 검색한 정보 반환
		ArrayList<DetailData> getInfo2() {

			ArrayList<DetailData> datas = new ArrayList<DetailData>();
			String sql = null;
			
			sql = "select code, detail, number, meter_num, meter_type, sum(c), group_concat(c order by d) from (select u.code, u.detail, u.number, u.meter_num, u.meter_type, date_format(date,'%Y-%m') as d, sum(consumed) as c from (select * from USER where sido like \"" + sido + "\" and sigoon like \"" + sigoon + "\" and umdong like \"" + umdong + "\") u inner join CONSUMPTION c on u.code = c.code where (date_format(date,'%Y')='" + year + "') and (u.code=" + code + " or u.detail='" + detail + "' or u.number= " + number + " or u.meter_num='" + meter_num + "' or " + allnull + ") group by u.code ,date_format(date,'%Y-%m')) a group by code;";
			
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					DetailData temp = new DetailData();
					temp.setCode(rs.getString("code"));
					temp.setDetail(rs.getString("detail"));
					temp.setNumber(rs.getString("number"));
					temp.setMeter_num(rs.getString("meter_num"));
					temp.setMeter_type(rs.getString("meter_type"));
					temp.setTotal_consumed(rs.getString("sum(c)"));
					
					String[] str = new String(rs.getString("group_concat(c order by d)")).split(",");
					
					temp.setConsumed_days(str);
					
					datas.add(temp);
				}
				
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return datas;
		}
	
	// 모든 작업은 여기서 한다.
	public ArrayList<DetailData> returnDatas(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String year, String month){
		
		setParameters(sido, sigoon, umdong, code, detail, number, meter_num, year, month);
		
		// 기본 정보
		ArrayList<DetailData> info_array = getInfo();

		// DB연결 해제
		disconnect();
		
		return info_array;
	}
	
	// 모든 작업은 여기서 한다.
	public ArrayList<DetailData> returnDatas2(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String year){
		
		setParameters(sido, sigoon, umdong, code, detail, number, meter_num, year, null);
		
		// 기본 정보
		ArrayList<DetailData> info_array = getInfo2();

		// DB연결 해제
		disconnect();
		
		return info_array;
	}
}
