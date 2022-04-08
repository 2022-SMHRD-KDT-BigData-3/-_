package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;


public class FoodRecDAO {
	 // 전역변수 선언
	   Connection conn = null;
	   PreparedStatement psmt = null;
	   int cnt = 0;
	   MemberDTO info = null;
	   ResultSet rs = null;
	   
	// DB연결 메소드
	   public void db_conn() {
	      // 1. ojdbc6.jar -> maven pom.xml에 import / dependencies 부터 repositories까지
	      // maven에서는 pom.xml에서 라이브러리 넣어서 다운로드

	      try {
	         // 2. Class찾기 -> Java와 DB를 이어주는 통로
	         // 만약에 클래스 못찾으면 어떻게 할래 -> try catch문

	         Class.forName("oracle.jdbc.driver.OracleDriver");

	         // 3. DB에 접속하기 위한 카드키 만들기(URL, id, pw)
	         // Data Source Explorer -> new oracle 오른쪽 클릭 -> 프로퍼티스 - > 드라이버 프로퍼티스
	         String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
	         String db_id = "campus_k_0325_2";
	         String db_pw = "smhrd2";

	         // 4. DB연결 -> 연결 성공시 Connection 객체로 반환
	         // 만약에 url id pw 잘못되면 어떻게 할래 -> try catch문
	         // 하나더만들면 복잡하니까 catch만 똑 잘라내서 캐치문 뒤에 붙이

	         conn = DriverManager.getConnection(db_url, db_id, db_pw);
	         if (conn != null) {
	            System.out.println("DB연결성공");
	         } else {
	            System.out.println("DB연결실패");
	         }
	         // 최상위 Exception 호출해서 캐치문을 하나로 만듬
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      // catch (ClassNotFoundException e) {
	      // e.printStackTrace();
	      // } catch (SQLException e) {
	      // e.printStackTrace();
	      // }
	   }

	   // DB종료 메소드
	   public void db_close() {
	      try {
	         // 역순으로 닫기, 안열렸는데 닫으면 오류나기 때문에 not null일때만 닫기
	         if (rs != null)
	            rs.close();
	         if (psmt != null)
	            psmt.close();
	         if (conn != null)
	            conn.close();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   }
	   
	  //영양소 선택 메소드
	   public ArrayList<FoodRecDTO>  f_dec(String choice) {
		   
		   ArrayList<FoodRecDTO> list = new ArrayList<FoodRecDTO>();
		   db_conn();
		   
		     
		   try {
			   System.out.println("test "+choice);
			   String sql=null;
			   if(choice.equals("pro")) {
				    sql = "select * from food_rec order by "+choice+" desc";
			   } else {
				    sql = "select * from food_rec where "+ choice+">=5 order by "+choice ;
			   }
			   psmt = conn.prepareStatement(sql);
			   
			  
			   rs = psmt.executeQuery();
			   
			   while(rs.next()) {
				   String fname = rs.getString(1);
				   int cal = rs.getInt(2);
				   int pro = rs.getInt(3);
				   int fat = rs.getInt(4);
				   int car = rs.getInt(5);
				   int sug = rs.getInt(6);
				   
				   FoodRecDTO dto = new FoodRecDTO(fname, cal, pro, fat, car, sug);
				   // DTO만 반환하면 마지막 DTO값만 출력되기 때문에
				   // 크기를 가변할 수 있는 ArrayList사용!
				   
				   list.add(dto);
				   
			   }
			   
			   
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		   return list;
		   
	   }


}
