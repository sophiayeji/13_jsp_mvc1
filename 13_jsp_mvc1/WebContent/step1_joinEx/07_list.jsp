<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>

	<!-- --
	
		db연결함
		select쿼리 작성 > 자바로 옮김 > html로 옮김
		db연결종료 
	
	 -->

	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/join_ex?serverTimezone=Asia/Seoul" , "root" ,  "1234");
			
			pstmt = conn.prepareStatement("SELECT* FROM MEMBER;");
			rs = pstmt.executeQuery();
			
			/*
			
			# db의 컬럼명을 가져 오는 2가지 방법
			
				1) rs.get자료형메서드("컬럼명");
				  
					ex) 
						rs.getString("PRODUCT_CD"); 
						rs.getInt("PRODUCT_PRICE");
						rs.getDate("ENROLL_DT");
				
						
				2) rs.get자료형메서드(index);
					
					ex) 
						rs.getString(1);
						rs.getInt(2);
						rs.getDate(3);
				
					- 유지보수 및 가독성 향상을 위해서 컬럼명지정 방식을 권장한다.
					- index가 1부터 시작되는 점을 유의해야 한다.
		
		*/
		%>
			<table border ="1">
				<caption>회원리스트 조회</caption>
				<tr>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>가입일자</th>				
				</tr>
		<%
			while (rs.next())	{ // 데이터베이스에서 select구문 결과물 1row가 있으면 
			
			String id = rs.getString("ID"); // rs.getString(1);
			String passwd = rs.getString("PASSWD"); // rs.getString(2);
			String name = rs.getString("NAME"); // rs.getString(3);
			Date joinDate = rs.getDate("JOIN_DATE"); // rs.getDate(4);
			//System.out.println(id + "/" + passwd + "/" + name + "/" + joinDate);
		%>
				<tr>
					<td><%=id %></td>
					<td><%=passwd %></td>
					<td><%=name %></td>
					<td><%=joinDate %></td>				
				</tr>
		
		<% 
			
			
		}
		
		
		%>	
							
			</table>
		<% 
	
	
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		
	
	
	%>



</body>
</html>