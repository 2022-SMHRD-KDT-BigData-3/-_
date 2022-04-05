package Model;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
		   
		   // 전역변수선언
		   
		   Connection conn = null;
		   PreparedStatement psmt = null;
		   int cnt = 0;
		   MemberDTO info= null;
		   ResultSet rs = null;
		   
		   // DB연결메소드
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
		   
		   // 회원가입메소드
		   public int join(MemberDTO dto) {
		      // db연결 메소드 호출
		      db_conn();
		      
		      try {
		         // 2. DB에서 무엇을 할지 결정
		         // 회원가입 기능 = 입력받은 회원 데이터들을 회원 Table에 추가하기
		         String sql = "insert into member values(user_seq.nextval, ?, ?, ?)";
		         
		         // 3. sql문장을 DB에 전달 -> 전달 성공 시 PreparedStatement 객체로 반환
		         psmt = conn.prepareStatement(sql);
		         
		         // 4. ? 바인드 변수에 값 채우기
		         // join메소드 매개변수로 dto(입력받은 값들의 묶음 = 가방) 받아오기
		         psmt.setString(1, dto.getId() );
		         psmt.setString(2, dto.getPw() );
		         psmt.setString(3, dto.getNick());
		         
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
		   
		   // 로그인 메소드
		   public MemberDTO login(MemberDTO dto) {
		      db_conn();
		      try {
		         String sql = "select * from member where id =? and pw =?";
		         // select로 member에서 가지고 오는데 id과 pw값이 다 일치할때만 가지고 오겠다
		         
		        psmt = conn.prepareStatement(sql);
		        
		        psmt.setString(1, dto.getId());
		        psmt.setString(2, dto.getPw());
		        
		        // select절은 Query -> ResultSet(rs) 
		        rs = psmt.executeQuery();
		        
		        // rs.next() : 다음 행에 값이 있는지(t) 없는지(f) boolean타입으로 반환
		        if(rs.next()) {
		        	// 실행문장 실행 = 값이 있다 = 로그인성공
		        	int seq = rs.getInt("seq");
		        	String id = rs.getString(2);
		        	String pw = rs.getString(3);
		        	String nick = rs.getString("nick");
		        	
		        	
		        	// info = 로그인한 사람의 정보를 담고있는 memberDTO형태의 객체
		        	info = new MemberDTO(seq, id, pw, nick);
		        }
		      } catch (Exception e) {
		         e.printStackTrace();
		         // 이거 적어야 어디서 오류 났는지 알려주니까 꼭 적어야함! 
		      } finally {
		    	  db_close();
		      } return info;
		   }
		   
		   // 회원정보수정 메소드
		   public int updata(MemberDTO dto) {
			   try {
				db_conn();
				String sql = "update member set pw=?, nick=? where id=?";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1,dto.getPw());
				psmt.setString(2,dto.getNick());
				psmt.setString(3,dto.getId());
				
				cnt = psmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				db_close();
			}
			 return cnt;
		   }
}

