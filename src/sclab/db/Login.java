package sclab.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Login {
   
   DbConnector dbconnector;  // sclab에서 만든 클래스  선언
   Connection conn;   // 내장 클래스 선언 
   PreparedStatement pstmt; // 내장 클래스 선언
   
   
   public Login(){
      dbconnector = new DbConnector();
      conn = dbconnector.getConn();
      pstmt = dbconnector.getPstmt();
   }  //선언한 객체들 초기화 ( 생성자에서 초기화 )
   
   void disconnect(){
      dbconnector.disconnect();
   } // db 연결을 끊어주는 함수
   
   public String checkId(String id,String pw){
      
      String sql = "select strcmp((select SHA2(\"" + pw + "\",512)),(select password from ADMIN where id =\"" + id +"\")) as checkId;"; // 쿼리
      String value = null;
      
      try {
         pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery();
         
         while(rs.next()){
            value = rs.getString("checkId");
         }
         
         rs.close();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      return value;
   } // 아디와 비밀번호 체크하는 함수
}