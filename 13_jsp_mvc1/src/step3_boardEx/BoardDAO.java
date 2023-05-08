package step3_boardEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {

	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void getConnection() {
		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board_ex?serverTimezone=Asia/Seoul" , "root" , "1234");			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getClose() {
		
		if(rs!=null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if(conn!=null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}		
	}

	public void insertBoard(BoardDTO boardDTO) {
		
		try {
			getConnection();
			
			String sql = "INSERT INTO BOARD (WRITER, EMAIL, SUBJECT, PASSWORD, ENROLL_DT , READ_CNT , CONTENT) ";
				   sql +="VALUES(?, ?, ?, ?, NOW(), 0, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getWriter());
			pstmt.setString(2, boardDTO.getEmail());
			pstmt.setString(3, boardDTO.getSubject());
			pstmt.setString(4, boardDTO.getPassword());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.executeUpdate();	   
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {getClose();}		
	}
	
	public ArrayList <BoardDTO> getBoardList() {
		
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try {
			getConnection();
			pstmt=conn.prepareStatement("SELECT*FROM BOARD");
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBoardId(rs.getLong("BOARD_ID"));
				boardDTO.setSubject(rs.getString("SUBJECT"));
				boardDTO.setWriter(rs.getString("WRITER"));
				boardDTO.setEnrollDT(rs.getDate("ENROLL_DT"));
				boardDTO.setReadCnt(rs.getLong("READ_CNT"));
			
				boardList.add(boardDTO);
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return boardList;
	}
	
	public BoardDTO getBoardDetail(long boardId) {
		BoardDTO boardDTO = new BoardDTO();
		try {
			getConnection();
			
			pstmt = conn.prepareStatement("UPDATE BOARD SET READ_CNT= READ_CNT +1 WHERE BOARD_ID = ?");		
			pstmt.setLong(1,boardId);
			pstmt.executeUpdate();
			
			pstmt =conn.prepareStatement("SELECT * FROM BOARD WHERE BOARD_ID =?");
			pstmt.setLong(1,boardId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				boardDTO.setBoardId(rs.getLong("BOARD_ID"));
				boardDTO.setWriter(rs.getString("WRITER"));
				boardDTO.setEmail(rs.getString("EMAIL"));
				boardDTO.setSubject(rs.getString("SUBJECT"));
				boardDTO.setEnrollDT(rs.getDate("ENROLL_DT"));
				boardDTO.setReadCnt(rs.getLong("READ_CNT"));
				boardDTO.setContent(rs.getString("CONTENT"));
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
			
		return boardDTO;
	}	
}













