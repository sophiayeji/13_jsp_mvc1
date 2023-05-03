package step2_loginEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//DAO(Data Access Object) : 데이터 접근(입출력 insert,update,delete)객체 
public class MemberDAO {
	
	//SingleTon 디자인 패턴 
	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void getConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login_ex?serverTimezone=Asia/Seoul" , "root" , "1234");
	 	} catch(Exception e) {
	 		e.printStackTrace();
	 	} 
		
	}
	
	public void getClose() {
		if(rs!=null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if(conn!=null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
	}
	
	
	public boolean insertMember(MemberDTO memberDTO) {
			
		boolean isJoin = false;
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT*FROM MEMBER WHERE MEMBER_ID=?");
			pstmt.setString(1, memberDTO.getMemberId());
			rs = pstmt.executeQuery();
			
			if(!rs.next()) {
				pstmt =conn.prepareStatement("INSERT INTO MEMBER VALUES(?,?,?,NOW())");
				pstmt.setString(1,memberDTO.getMemberId());
				pstmt.setString(2,memberDTO.getPasswd());
				pstmt.setString(3,memberDTO.getName());
				pstmt.executeUpdate();
				isJoin=true;
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isJoin;
		
	}
	
}
