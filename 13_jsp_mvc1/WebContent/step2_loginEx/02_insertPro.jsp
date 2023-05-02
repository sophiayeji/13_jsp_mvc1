<%@page import="step2_loginEx.MemberDAO"%>
<%@page import="step2_loginEx.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPro</title>
</head>
<body>
	
	<%
				request.setCharacterEncoding("utf-8");
			
				MemberDTO memberDTO = new MemberDTO();	
			
				//memberDTO.memberId = request.getParameter("memberId");
				//memberDTO.passwd = request.getParameter("passwd");
				//memberDTO.name = request.getParameter("name");
				
				memberDTO.setMemberId(request.getParameter("memberId"));
				memberDTO.setPasswd(request.getParameter("passwd"));
				memberDTO.setName(request.getParameter("name"));
			
				boolean isJoin = MemberDAO.getInstance().insertMember(memberDTO);
		
				if(isJoin) {
			%>
				<script>
					alert("You are now a member.");
					location.href = "00_main.jsp";
				</script>		
			<% 		
				}
				else {				//중복된 아이디가 있음
			%>		
				<script>
					alert("This is a duplicated ID.");
					history.go(-1);
				</script>		
			<% 		
				}
		%>


</body>
</html>