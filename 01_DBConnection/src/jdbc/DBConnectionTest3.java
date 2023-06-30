package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import config.ServerInfo;

public class DBConnectionTest3 {
	

	/*
	 * 디비 서버에 대한 정보가 프로그램상에 하드코딩 되어져 있음
	 * --> 해결책 : 별도의 모듈에 디비서버에 대한 정보를 뽑아내서 별도 처리
	 * */

	public static void main(String[] args) {

		
		
		// 1. 드라이버 로딩
		try {
			Class.forName(ServerInfo.DRIVER_NAME);
			
			
		// 2. 디비 연결
			Connection conn = DriverManager.getConnection(ServerInfo.URL, ServerInfo.USER, ServerInfo.PASSWORD);	
			
			System.out.println("Connection");
			
			
		// 3. Statement 객체 생성 - UPDATE
			String query = "UPDATE emp SET dept_title = ? WHERE emp_id = ?";
			PreparedStatement st = conn.prepareStatement(query);
			
			
			
		// 4. 쿼리문 실행
			st.setString(1, "디자인팀");
			st.setInt(2, 1);
			
			int result = st.executeUpdate();
			
			
			System.out.println(result+ "명 수정!");
			
			
			
			String query1 = "SELECT * FROM emp";
			PreparedStatement st1 = conn.prepareStatement(query1);
			ResultSet rs1 =  st1.executeQuery();
			
			
			
			
			
			while(rs1.next()){				  
				  String empId = rs1.getString("emp_id");
				  String empName = rs1.getString("emp_name");
				  String deptTitle = rs1.getString("dept_title");
			System.out.println (empId+" / "+ empName+" / "+deptTitle );
				  
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
				
		
		
	}

}
