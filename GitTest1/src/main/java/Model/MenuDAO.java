package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MenuDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	MenuDTO info = null;
	ResultSet rs = null;
	CheckingDTO info2 = null;
	
	public void db_conn() {
	      
	      try {
	         // 1. ojdbc6.jar -> import 
	         // maven에서는 pom.xml에서 라이브러리 넣어서 다운로드
	         
	         // 2. Class찾기 -> Java와 DB를 이어주는 통로
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         
	         // 3. DB에 접속하기 위한 카드키만들기(url, id, pw)
	         String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	         String db_id = "campus_k_0325_2";
	         String db_pw = "smhrd2";
	         
	         // 4. DB연결 -> 연결 성공 시 Connection 객체로 반환
	         conn = DriverManager.getConnection(db_url, db_id, db_pw);
	         
	         if(conn != null) {
	            System.out.println("DB연결성공");
	         }else {
	            System.out.println("DB연결실패");
	         }
	      
	         
	      } catch (ClassNotFoundException e) {
	         
	         e.printStackTrace();
	      } catch (SQLException e) {
	        
	         e.printStackTrace();
	      }
	   }
	   // DB종료메소드
	   // 역순으로 닫아줄것임
	   public void db_close() {
	      
	         try {
	        	if(rs!=null)rs.close();
	            if(psmt != null)psmt.close();
	            if(conn != null)conn.close();
	            
	         } catch (SQLException e) {
	           e.printStackTrace();
	         }
	   }
	   

	   // 식단 넣기
	   // 식단 가져오기
	   public int insert(MenuDTO dto) {
		      // db연결 메소드 호출
		      db_conn();
		      
		      try {
		         // 2. DB에서 무엇을 할지 결정
		         // 메뉴 넣기 = 입력받은 회원 데이터들을 회원 Table에 추가하기
		         String sql = "insert into menu values(?,?, sysdata,?,?,?,?,?)";
		         
		         // 3. sql문장을 DB에 전달 -> 전달 성공 시 PreparedStatement 객체로 반환
		         psmt = conn.prepareStatement(sql);
		         
		         // 4. ? 바인드 변수에 값 채우기
		         // join메소드 매개변수로 dto(입력받은 값들의 묶음 = 가방) 받아오기
		         psmt.setString(1, dto.getId() );
		         psmt.setInt(2, dto.getMeal() );
		         psmt.setString(3, dto.getFname());
		         psmt.setInt(4, dto.getCal());
		         psmt.setInt(5, dto.getPro());
		         psmt.setInt(6, dto.getCar());
		         psmt.setInt(7, dto.getFat());
		         
		         // 5. sql문 실행
		         // insert -> DB에 변화생기기 때문에 Update
		         // int 형태로 반환, int의 의미 : 몇개의 행에 변화가 생겼는지
		         cnt = psmt.executeUpdate();
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {// 6. DB문 닫기 
		         db_close();
		      } return cnt;
		   }
	
}
