<%@page import="step2_loginEx.MemberDAO"%>
<%@page import="step2_loginEx.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro</title>
</head>
<body>
	<%
	
		request.setCharacterEncoding("utf-8");
	
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId(request.getParameter("memberId"));
		memberDTO.setPasswd(request.getParameter("passwd"));
		
		boolean isDelete = MemberDAO.getInstance().deleteMember(memberDTO);
	
		if (isDelete) {
			session.invalidate();
	
	%>		
		<script>
			alert("Your account has been deleted succesfully.");
			location.href = "00_main.jsp";
		</script>
		
	<% 
		}
		else {		
	%>		
		<script>
			alert("Check you Id or Password");
			history.go(-1);
		</script>
				
	<% 
		}
	
	%>




</body>
</html>