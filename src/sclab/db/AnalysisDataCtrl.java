package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AnalysisDataCtrl {

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
	
	public String start_year;
	public String end_year;
	public String start_month;
	public String end_month;
	public String start_day;
	public String end_day;
	
	public String date_start;
	public String date_end;
	public String term;

	public boolean allnull;
	public String format;
	
	public AnalysisDataCtrl(){
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	
	void setParameters(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String start_year, String start_month, String start_day, String end_year, String end_month, String end_day){
		
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
		
		if(start_day != null){
			this.date_start = start_year + start_month + start_day;
			this.date_end = end_year + end_month + end_day;
			this.format = "%Y-%m-%d";
			this.term = start_year + "-" + start_month + "-" + start_day + "~" + end_year + "-" + end_month + "-" + end_day;
		}
		else if(start_month != null){
			this.date_start = start_year + start_month + "01";
			this.date_end = end_year + end_month + "31";
			this.format = "%Y-%m";
			this.term = start_year + "-" + start_month + "~" + end_year + "-" + end_month;
		}
		else{
			this.date_start = start_year + "0101";
			this.date_end = end_year + "1231";
			this.format = "%Y";
			this.term = start_year + "~" + end_year;
		}
	}
	
	// 검색한 정보 반환
	ArrayList<AnalysisData> getInfo() {

		ArrayList<AnalysisData> datas = new ArrayList<AnalysisData>();
		String sql = null;
			
		sql = "select code, detail, number, meter_num, meter_type, sum(c), count(c), avg(c) from (select u.code, u.detail, u.number, u.meter_num, u.meter_type, sum(consumed) as c from (select * from USER where sido like \"" + sido + "\" and sigoon like \"" + sigoon + "\" and umdong like \"" + umdong + "\") u inner join CONSUMPTION c on u.code = c.code where (date between '" + date_start + "' and '" + date_end + "') and (u.code=" + code + " or u.detail='" + detail + "' or u.number= " + number + " or u.meter_num='" + meter_num + "' or " + allnull + ") group by u.code, date_format(date,'" + format + "')) a group by code;";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				AnalysisData temp = new AnalysisData();
				temp.setCode(rs.getString("code"));
				temp.setDetail(rs.getString("detail"));
				temp.setNumber(rs.getString("number"));
				temp.setMeter_num(rs.getString("meter_num"));
				temp.setMeter_type(rs.getString("meter_type"));
				temp.setTerm(term);
				temp.setTotal_consumed(rs.getString("sum(c)"));
				temp.setCount(rs.getString("count(c)"));
				temp.setAvg_consumed(rs.getString("avg(c)"));
				
				datas.add(temp);
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 모든 작업은 여기서 한다.
	public ArrayList<AnalysisData> returnDatas(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String start_year, String start_month, String start_day, String end_year, String end_month, String end_day){
		
		setParameters(sido, sigoon, umdong, code, detail, number, meter_num, start_year, start_month, start_day, end_year, end_month, end_day);
		
		// 기본 정보
		ArrayList<AnalysisData> info_array = getInfo();

		// DB연결 해제
		disconnect();
		
		return info_array;
	}
	
}
