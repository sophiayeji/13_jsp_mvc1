<%@page import="step2_loginEx.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>
	<% 
	
		request.setCharacterEncoding("utf-8");
	
		String memberId = request.getParameter("memberId");
		String passwd   = request.getParameter("passwd");
	
		if (MemberDAO.getInstance().loginMember(memberId , passwd)) {
			
			session.setAttribute("memberId", memberId);
			session.setMaxInactiveInterval(60 * 15);
			
	%>
			<script>
				alert("Logged in");
				location.href = "00_main.jsp";
			</script>
	<% 		
		}
		else {
	%>
			<script>
				alert("Check your ID or Password");
				history.go(-1);
			</script>
	<% 		
		}
	%>
	
</body>
</html>