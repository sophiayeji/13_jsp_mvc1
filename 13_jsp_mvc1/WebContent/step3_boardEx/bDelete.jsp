<%@page import="step3_boardEx.BoardDTO"%>
<%@page import="step3_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bDelete</title>
</head>
<body>
	
	<% 
	long boardId = Long.parseLong(request.getParameter("boardId"));
	BoardDTO boardDTO = BoardDAO.getInstance().getBoardDetail(boardId, false);
	
	%>
	
	<h3>게시글 삭제하기</h3>
	<form action="bDeletePro.jsp" method="post">
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><%=boardDTO.getWriter() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=boardDTO.getEnrollDT() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=boardDTO.getSubject() %></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="password"></td> <!-- -서버로 넘어가는 정보 -->
			</tr>
		</table>
		<p>
			<input type="hidden" name="boardId" value=<%=boardDTO.getBoardId() %>>
			<input type="submit" value="삭제하기" />
			<input type="button" onclick="location.href='bList.jsp'" value="전체글보기" />
		</p>
	</form>
</body>
</html>