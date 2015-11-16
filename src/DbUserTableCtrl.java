package jsptable.dbtable;

public class DbUserTableCtrl{
	DbConnector dbconnerctor = new DbConnector();
	Connection conn = dbconnerctor.getConn();
	PreparedStatement pstmt = dbconnerctor.getPstmt();
		
	// 수정된 내용 갱신을 위한 메서드
	public boolean updateDB(DbUserTable dbusertable){
		dbconnerctor.connect();
		
		String sql = "update user set dong=?, gu=?, do=?, si=?, size=? where code=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dbusertable.getUser_dong());
			pstmt.setString(2,dbusertable.getUser_gu());
			pstmt.setString(3,dbusertable.getUser_do());
			pstmt.setString(4,dbusertable.getUser_gu());
			pstmt.setInt(5,dbusertable.getUser_size());
			pstmt.setInt(6,dbusertable.getUser_code());
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
	public boolean deleteDB(int userCode){
		dbconnerctor.connect();
		
		String sql = "delete from user where code=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userCode);
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
	public boolean insertDB(DbUserTable dbusertable){
		dbconnerctor.connect();
		
		// sql 문자열, gb_id는 자동 등록되므로 입력하지 않는다.
		String sql = "insert into user(dong,gu,do,si,size) values(?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dbusertable.getUser_dong());
			pstmt.setString(2,dbusertable.getUser_gu());
			pstmt.setString(3,dbusertable.getUser_do());
			pstmt.setString(4,dbusertable.getUser_gu());
			pstmt.setString(5,dbusertable.getUser_size());
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
	public DbUserTable getDB(int user_code){
		dbconnerctor.connect();
		
		String sql = "select * from user where code=?";
		DbUserTable dbusertable = new DbUserTable();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_code);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
			rs.next();
			dbusertable.setUser_code(rs.getInt("code"));
			dbusertable.setUser_dong(rs.getString("dong"));
			dbusertable.setUser_gu(rs.getString("gu"));
			dbusertable.setUser_do(rs.getString("do"));
			dbusertable.setUser_gu(rs.getString("si"));
			dbusertable.setUser_size(rs.getInt("size"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			dbconnerctor.disconnect();
		}
		return dbuser;
	}
	
	// 전체 목록을 가져오는 메서드
	public ArrayList<DbUserTable> getDBList() {
		dbconnerctor.connect();
		ArrayList<DbUserTable> datas = new ArrayList<DbUserTable>();
		
		String sql = "select * from user order by code desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				DbUserTable dbusertable = new DbUserTable();
				
				dbusertable.setUser_code(rs.getInt("code"));
				dbusertable.setUser_dong(rs.getString("dong"));
				dbusertable.setUser_gu(rs.getString("gu"));
				dbusertable.setUser_do(rs.getString("do"));
				dbusertable.setUser_gu(rs.getString("si"));
				dbusertable.setUser_size(rs.getInt("size"));
				datas.add(dbusertable);
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