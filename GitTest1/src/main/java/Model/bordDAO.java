package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class bordDAO {
	
	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	int cnt = 0;
	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "hr";
			String pw = "hr";
			con = DriverManager.getConnection(url,id,pw);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close() {
		
			try {
				if(con != null) {
				con.close();
				}
				if(pstm != null ) {
					pstm.close();
				}
				if(rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	public ArrayList<bordDTO> all_bord(int startNum){
		
		ArrayList<bordDTO> bord_list = new ArrayList<bordDTO>();
		bordDTO dto = null;
		int maxData = 30; //한페이지에서 최대로 가져올 수 있는 사용자 임의의 수
		conn();
		
		try {
			String sql  = "select * from bord where num >= ?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, startNum);
			rs = pstm.executeQuery();
			while(rs.next()) {
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String date = rs.getString(3);
				dto = new bordDTO(num, title, date);
				bord_list.add(dto);
				
				if(bord_list.size()==maxData) { 
					break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close();
		}		
		
		return bord_list;
	}	
	public int insert(bordDTO dto) {
		// db연결 메소드 호출
		conn();
		try {
			// 2. DB에서 무엇을 할지 결정
			// 회원가입 기능 = 입력받은 회원 데이터들을 회원 Table에 추가하기
			String sql = "insert into bord values(num_seq.nextval,?, ?)";

			// 3. sql문장을 DB에 전달 -> 전달 성공 시 PreparedStatement 객체로 반환
			pstm = con.prepareStatement(sql);

			// 4. ? 바인드 변수에 값 채우기
			// insert메소드 매개변수로 dto(입력받은 값들의 묶음 = 가방) 받아오기
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getDate());
		
			// 5. sql문 실행
			// insert -> DB에 변화생기기 때문에 Update
			// int 형태로 반환, int의 의미 : 몇개의 행에 변화가 생겼는지
			 cnt = pstm.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {// 6. DB문 닫기
			close();
		}
		return cnt;
	}
}
