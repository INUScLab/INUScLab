package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProcessedDataCtrl {
	
	DbConnector dbconnector;
	Connection conn;
	PreparedStatement pstmt;
	
	public String pd_sido;
	public String pd_sigoon;
	public String pd_umdong;
	public String startday;
	public String endday;
	
	public ProcessedDataCtrl(){
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void setParameters(String pd_sido, String pd_sigoon, String pd_umdong, String startday, String endday){
		this.pd_sido = pd_sido;
		this.pd_sigoon = pd_sigoon;
		this.pd_umdong = pd_umdong;
		this.startday = startday;
		this.endday = endday;
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	
	// 매개변수 column의 동별 랭킹 반환
	ArrayList<ArrayList<String>> getRank(String column) {

		ArrayList<ArrayList<String>> datas = new ArrayList<ArrayList<String>>();
		
		String sql = null;
		String names = null;
		
		if(pd_sigoon.equals("전체")){
			names = "sigoon";
			sql = "select sigoon," + column + "from (select code, sigoon from USER where sido='" + pd_sido +"') u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday + "' group by sigoon order by " + column + "desc;";
		}
		
		else if (pd_umdong.equals("전체")){
			names = "umdong";
			sql = "select umdong," + column + "from (select code, umdong from USER where sido='" + pd_sido + "' and sigoon='" + pd_sigoon + "') u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday + "' group by umdong order by " + column + "desc;";
		}
		else{
			names="u.code";
			sql = "select u.code," + column + "from (select code, detail from USER where sido='" + pd_sido + "' and sigoon='" + pd_sigoon + "' and umdong='" + pd_umdong +"') u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday + "' group by detail order by " + column + "desc;";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				ArrayList<String> temp  = new ArrayList<String>();
				
				temp.add(rs.getString(names));
				temp.add(rs.getString(column));
				datas.add(temp);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	String getAvg(String column) {

		String data = null;
		
		String sql= null;
		String names = null;
		
		if(pd_sigoon.equals("전체")){
			names = "sigoon";
			sql = "select avg(all value) from (select " + column + " as value from (select code, sigoon from USER where sido='" + pd_sido +"') u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday + "' group by sigoon)alias;";
		}
		
		else if (pd_umdong.equals("전체")){
			names = "umdong";
			sql = "select avg(all value) from (select " + column + " as value from (select code, umdong from USER where sido='" + pd_sido + "' and sigoon='" + pd_sigoon + "') u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday + "' group by umdong)alias;";
		}
		else{
			names="u.code";
			sql = "select avg(all value) from (select " + column + " as value from (select code, detail from USER where sido='" + pd_sido + "' and sigoon='" + pd_sigoon + "' and umdong='" + pd_umdong +"') u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday + "' group by u.code)alias;";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				data = rs.getString("avg(all value)");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	
	// 모든 작업은 여기서 한다. 
	public ProcessedData returnRanks(String pd_sido, String pd_sigoon, String pd_umdong, String startday, String endday){
		
		setParameters(pd_sido, pd_sigoon, pd_umdong, startday, endday);
		
		ProcessedData pd = new ProcessedData();
		
		pd.setRank_difference(getRank("abs(sum(consumed)-sum(predicted))"));
		pd.setRank_leak(getRank("sum(leak)"));
		pd.setRank_absence(getRank("sum(absence)"));
		pd.setRank_overused(getRank("sum(overused)"));
		pd.setRank_freezed(getRank("sum(freezed)"));
		
		pd.setAvg_difference(getAvg("abs(sum(consumed)-sum(predicted))"));
		pd.setAvg_leak(getAvg("sum(leak)"));
		pd.setAvg_absence(getAvg("sum(absence)"));
		pd.setAvg_overused(getAvg("sum(overused)"));
		pd.setAvg_freezed(getAvg("sum(freezed)"));
		
		disconnect();
		
		return pd;
	}
}
