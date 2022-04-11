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

}
