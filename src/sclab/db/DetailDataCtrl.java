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
	
	void setParameters(String sido, String sigoon, String umdong, String code, String startday, String endday){
		this.sido = sido;
		this.sigoon = sigoon;
		this.umdong = umdong;
		this.code = code;
		this.startday = startday;
		this.endday = endday;
	}
	
	// 기간동안의 사용량, 누수 횟수, 부재중 횟수, 동파 횟수 반환
	String getValue(String column) {

		String data = null;
		String sql = null;
		
		if(sigoon.equals("전체")){
			sql = "select " + column +" from (select code,sigoon from USER where sido=\"" + sido + "\") u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"';";
		}
		
		else if (umdong.equals("전체")){
			sql = "select " + column +" from (select code,sigoon from USER where sido=\"" + sido + "\" sigoon=\"" + sigoon + "\") u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"';";
		}
		else if (code.equals("전체")){
			sql = "select " + column +" from (select code,sigoon from USER where sido=\"" + sido + "\" sigoon=\"" + sigoon + "\" umdong=\"" + umdong + "\") u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"';";
		}
		else{
			sql = "select " + column +" from CONSUMPTION where code = " + code + " and date between '" + startday + "' and '" + endday +"';";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				data = rs.getString(column);
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	
	// 기간동안의 사용량 평균, 누수 횟수 평균, 부재중 횟수 평균, 동파 횟수 평균 반환
	String getAvgValue(String column) {

		String data = null;
		String sql = null;
		
		if(sigoon.equals("전체")){
			sql = "select avg(value) from (select " + column +" as value from (select code,sido from USER) u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"' group by sido)alias;";
		}
		else if (umdong.equals("전체")){
			sql = "select avg(value) from (select " + column +" as value from (select code,sigoon from USER where sido=\"" + sido + "\") u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"' group by sigoon)alias;";
		}
		else if (code.equals("전체")){
			sql = "select avg(value) from (select " + column +" as value from (select code,umdong from USER where sido=\"" + sido + "\" and sigoon=\"" + sigoon + "\") u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"' group by umdong)alias;";
		}
		else{
			sql ="select avg(value) from (select " + column +" as value from (select code from USER where sido=\"" + sido + "\" and sigoon=\"" + sigoon + "\" and umdong=\"" + umdong + "\") u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"' group by u.code)alias;";
		}

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				data = rs.getString("avg(value)");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	
	// 기간동안의 각각의 사용량
	ArrayList<String> getValueDays(String column) {

		ArrayList<String> datas = new ArrayList<String>();
		String sql = null;
		
		if(sigoon.equals("전체")){
			sql = "select " + column +" from (select code,sigoon from USER where sido=\"" + sido + "\") u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"' group by date;";
		}
		
		else if (umdong.equals("전체")){
			sql = "select " + column +" from (select code,sigoon from USER where sido=\"" + sido + "\" sigoon=\"" + sigoon + "\") u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"' group by date;";
		}
		else if (code.equals("전체")){
			sql = "select " + column +" from (select code,sigoon from USER where sido=\"" + sido + "\" sigoon=\"" + sigoon + "\" umdong=\"" + umdong + "\") u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday +"' group by date;";
		}
		else{
			sql = "select " + column +" from CONSUMPTION where code = " + code + " and date between '" + startday + "' and '" + endday +"' group by date;";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				datas.add(rs.getString(column));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 모든 작업은 여기서 한다.
	public DetailData returnDatas(String sido, String sigoon, String umdong, String code, String startday, String endday){
		
		setParameters(sido, sigoon, umdong, code, startday, endday);
		
		DetailData dd = new DetailData();
		
		// 기간 동안 사용량
		dd.setConsumed_days(getValueDays("sum(consumed)"));
		
		// 사용량, 누수 횟수, 부재중 횟수, 동파 횟수
		dd.setConsumed(getValue("sum(consumed)"));
		dd.setLeak(getValue("sum(leak)"));
		dd.setAbsence(getValue("sum(absence)"));
		dd.setFreezed(getValue("sum(freezed)"));
		
		// 사용량 평균, 누수 횟수 평균, 부재중 횟수 평균, 동파 횟수 평균
		dd.setAvg_consumed(getAvgValue("sum(consumed)"));
		dd.setAvg_leak(getAvgValue("sum(leak)"));
		dd.setAvg_absence(getAvgValue("sum(absence)"));
		dd.setAvg_freezed(getAvgValue("sum(freezed)"));

		// DB연결 해제
		disconnect();
		
		return dd;
	}
}
