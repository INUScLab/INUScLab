package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProcessedDataCtrl {
	
	DbConnector dbconnector = new DbConnector();
	Connection conn = dbconnector.getConn();
	PreparedStatement pstmt = dbconnector.getPstmt();
	
	public String pd_sido;
	public String pd_sigoon;
	public String pd_umdong;
	public String startday;
	public String endday;
	
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
	ArrayList<ArrayList<String>> getLank(String column) {

		ArrayList<ArrayList<String>> datas = new ArrayList<ArrayList<String>>();
		
		String sql = "select umdong," + column + "from (select code, umdong from USER where umdong in (select name from UMDONG where sigoon_no = (select no from SIGOON where name = '" + pd_sigoon + "'))) u inner join CONSUMPTION c on c.code = u.code where date between '" + startday + "' and '" + endday + "' group by umdong order by " + column + "desc;";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				ArrayList<String> temp  = new ArrayList<String>();
				
				temp.add(rs.getString("umdong"));
				temp.add(rs.getString(column));
				datas.add(temp);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 모든 작업은 여기서 한다. 
	public ProcessedData returnRanks(String pd_sido, String pd_sigoon, String pd_umdong, String startday, String endday){
		
		setParameters(pd_sido, pd_sigoon,pd_umdong,startday,endday);
		
		ProcessedData pd = new ProcessedData();
		
		pd.setLank_difference(getLank("abs(sum(consumed)-sum(predicted))"));
		pd.setLank_leak(getLank("sum(leak)"));
		pd.setLank_absence(getLank("sum(absence)"));
		pd.setLank_overused(getLank("sum(overused)"));
		pd.setLank_freezed(getLank("sum(freezed)"));
		
		disconnect();
		
		return pd;
	}
}
