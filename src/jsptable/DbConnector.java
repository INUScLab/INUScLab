package jsptable;

import java.sql.*;
import java.util.*;

public class DbConnector{

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	// MySQL 연결정보
	private String jdbc_driver = "com.mysql.jdbc.Driver";
	private String jdbc_url = "jdbc:mysql://sclab-database.ccf2v8m44pmt.ap-northeast-1.rds.amazonaws.com:3306/sclab";
	
	// 데이터베이스 연결 메서드
	public void connect(){
		try{
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,"sclab","sclab422");
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public void disconnect(){
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
	
	public Connection getConn() {
		return conn;
	}	
	public PreparedStatement getPstmt() {
		return pstmt;
	}
}