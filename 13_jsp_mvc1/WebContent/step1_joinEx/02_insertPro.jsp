<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPro</title>
</head>
<body>
	<%-- 
	
		# JDBC 데이터 베이스 연동 방법 
		
		1) (중요)mysql-connector-j-x.x.xx.jar파일을 WEB-INF 폴더안의 lib 폴더안에 넣는다. 
		2) Class.forName("com.mysql.cj.jdbc.Driver"); 을 작성한다. 
		3) DriverManager의 getConnection(url , id , password) 메소드를 통하여서 Connection 객체를 생성한다.
		4) PreparedStatement 객체를 생성 및 사용 하여 SQL을 실행한다.
		5) SELECT 쿼리의 경우 ResultSet 객체를 사용하여 데이터를 처리한다.
		
	--%>
	
	<% 
	
		request.setCharacterEncoding("utf-8");
	
		String id = 	request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = 	request.getParameter("name");
		
		// 데이터베이스를 연결하기 위한 객체
		Connection conn = null;
				
		// 쿼리문을 실행하기 위한 객체
		PreparedStatement pstmt = null;
		
		try {

			// forName 생성
			Class.forName("com.mysql.cj.jdbc.Driver");	
			
			// DB 연결 정보 > "jdbc:mysql://db server ip:port number/database name?option"
			String url = "jdbc:mysql://localhost:3306/join_ex?serverTimezone=Asia/Seoul";
			// DB 연결 계정
			String user    = "root";
			// DB 연결 비밀번호
			String password  = "1234";
			
			// 데이터 베이스 연동
			conn = DriverManager.getConnection(url , user , password);
		
			/*
			
			# prepareStatement
	
			- 원래 statement객체로 사용하였으나 SQL Injection 공격에 대응하는 보안 기법으로 prepareStatement를 사용한다.
			
			- 우선 ?로 쿼리문의 파라메타 형식을 만들고 setter 메서드로 데이터를 대입하여 쿼리문을 완성한다.
			   pstmt.set자료형(인덱스, 값);
			
			- 인덱스는 1부터 시작한다.
	
			Ex)
			pstmt.setInt(index , value);     // 정수 타입 데이터 적용 메서드
			pstmt.setString(index , value);  // 문자열 타입 데이터 적용 메서드
			pstmt.setDate(index , value);  	 // 날짜 타입 데이터 적용 메서드

		*/
		    
		    //선처리문 쿼리작성
			String sql ="INSERT INTO MEMBER VALUES(?,?,?,NOW())";
			pstmt = conn.prepareStatement(sql);
			
			//선처리문 쿼리완성
			pstmt.setString(1,id);			// INSERT INTO MEMBER VALUES(id,?,?,NOW()) 
			pstmt.setString(2,passwd);		// INSERT INTO MEMBER VALUES(id,passwd,?,NOW()) 
			pstmt.setString(3,name);		// INSERT INTO MEMBER VALUES(id,passwd,name,NOW())
			
			//쿼리문 실행
			pstmt.executeUpdate();
			
			// executeUpdate() : insert , update ,delete문 실행 메서드
			// executeQuery()  : select문 실행 메서드
			
			
			} catch(Exception e) {
				e.printStackTrace();
			}finally {	
				//데이터베이스 연동종료
				pstmt.close();
				conn.close();
			}		
		
	%>

	<h3>가입되었습니다.</h3>
	<a href="01_main.jsp">뒤로가기</a>
	
</body>
</html>