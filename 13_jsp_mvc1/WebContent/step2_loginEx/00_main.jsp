<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String memberId =(String)session.getAttribute("memberId");
	
		if(memberId == null) {
	%>		
		
		<h3>JUST DO IT!</h3>
		<p><a href ="01_insert.jsp" > Join!</a></p>
		
		<p>Login!</p>
	<%		
		}
	
		else {
	%>
		<h3>Welcome!<%=memberId %></h3>
		<p>Logout!</p>
		<p>Delete!</p>
		<p>Update!</p>
	<% 		
		}
	%>



</body>
</html>