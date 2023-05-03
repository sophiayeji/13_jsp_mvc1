<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>

	<%
	
		//session.removeAttribute("memberId");
		session.invalidate();
		// 로그아웃 설정할 때 invalidate로 설정하는게 더 좋다!!!
	%>
	<script>
		alert("You are logged out.");
		location.href = "00_main.jsp";
	</script>
</body>
</html>