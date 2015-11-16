package jsptable.dbtable;

public class DbConsumptionTableCtrl{
	DbConnector dbconnerctor = new DbConnector();
	Connection conn = dbconnerctor.getConn();
	PreparedStatement pstmt = dbconnerctor.getPstmt();
		
	// 수정된 내용 갱신을 위한 메서드
	public boolean updateDB(DbConsumptionTable dbconsumptiontable){
		dbconnerctor.connect();
		
		String sql = "update consumption set date=?, predict_value=?, raw_value=? where code=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dbconsumptiontable.getConsumption_date());
			pstmt.setString(2,dbconsumptiontable.getConsumption_predict());
			pstmt.setString(3,dbconsumptiontable.getConsumption_raw());
			pstmt.setInt(4,dbconsumptiontable.getConsumption_code());
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
			return false;
		}
		finally{
			dbconnerctor.disconnect();
		}
		return true;
	}
	
	// 특정 행을 삭제하는 메서드
	public boolean deleteDB(int consumptionCode){
		dbconnerctor.connect();
		
		String sql = "delete from consumption where code=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, consumptionCode);
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
			return false;
		}
		finally {
			dbconnerctor.disconnect();
		}
		return true;
	}
	
	// 신규 행을 추가하는 메서드
	public boolean insertDB(DbConsumptionTable dbconsumptiontable){
		dbconnerctor.connect();
		
		// sql 문자열, gb_id는 자동 등록되므로 입력하지 않는다.
		String sql = "insert into consumption(date,predict_value,raw_value) values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dbconsumptiontable.getConsumption_date());
			pstmt.setString(2,dbconsumptiontable.getConsumption_predict());
			pstmt.setString(3,dbconsumptiontable.getConsumption_raw());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			dbconnerctor.disconnect();
		}
		return true;
	}
	
	// 특정 게시글 가져오는 메서드
	public DbConsumptionTable getDB(int consumptionCode){
		dbconnerctor.connect();
		
		String sql = "select * from consumption where code=?";
		DbConsumptionTable dbconsumptiontable = new DbConsumptionTable();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, consumptionCode);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
			rs.next();
			dbconsumptiontable.setConsumption_code(rs.getInt("code"));
			dbconsumptiontable.setConsumption_date(rs.getString("date"));
			dbconsumptiontable.setConsumption_predict(rs.getString("predict_value"));
			dbconsumptiontable.setConsumption_raw(rs.getString("raw_value"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			dbconnerctor.disconnect();
		}
		return dbconsumption;
	}
	
	// 전체 목록을 가져오는 메서드
	public ArrayList<DbConsumptionTable> getDBList() {
		dbconnerctor.connect();
		ArrayList<DbConsumptionTable> datas = new ArrayList<DbConsumptionTable>();
		
		String sql = "select * from consumption order by code desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				DbConsumptionTable dbconsumptiontable = new DbConsumptionTable();
				
				dbconsumptiontable.setConsumption_code(rs.getInt("code"));
				dbconsumptiontable.setConsumption_date(rs.getString("date"));
				dbconsumptiontable.setConsumption_predict(rs.getString("predict_value"));
				dbconsumptiontable.setConsumption_raw(rs.getString("raw_value"));
				datas.add(dbconsumptiontable);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			dbconnerctor.disconnect();
		}
		return datas;
	}
}