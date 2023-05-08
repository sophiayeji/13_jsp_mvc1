<%@page import="step3_boardEx.BoardDAO"%>
<%@page import="step3_boardEx.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bWritePro</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("utf-8");
	
		//before
		//BoardDTO boardDTO = new BoardDTO(); 
		//boardDTO.setWriter(request.getParameter("writer"));
		//boardDTO.setSubject(request.getParameter("subject"));		
		//boardDTO.setEmail(request.getParameter("email"));
		//boardDTO.setPassword(request.getParameter("password"));
		//boardDTO.setContent(request.getParameter("content"));
	
	%>	
		<!-- after -->
		<jsp:useBean id ="boardDTO" class ="step3_boardEx.BoardDTO">
			<jsp:setProperty property = "*" name="boardDTO" />
		</jsp:useBean>
	
	<%
		BoardDAO.getInstance().insertBoard(boardDTO);
		//response.sendRedirect
	%>
		<script>
			alert("등록되었습니다.");
			location.href="bWrite.jsp";
		</script>
	




</body>
</html>