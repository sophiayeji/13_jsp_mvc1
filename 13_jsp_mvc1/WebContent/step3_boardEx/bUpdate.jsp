<%@page import="step3_boardEx.BoardDAO"%>
<%@page import="step3_boardEx.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdate</title>
<script src="../ckeditor/ckeditor.js"></script>
</head>
<body>
	
	<% 
		long boardId = Long.parseLong(request.getParameter("boardId"));
		BoardDTO boardDTO = BoardDAO.getInstance().getBoardDetail(boardId , false);
	%>
	
	<h3>게시글 수정하기</h3>
	<form action="bUpdatePro.jsp" method="post" >
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
				<td><input type="text" name="subject" value="<%=boardDTO.getSubject()%>"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>
					<textarea rows="10" cols="30" name="content"><%=boardDTO.getContent() %></textarea>
					<script>CKEDITOR.replace("content")</script>
				</td>
			</tr>
		</table>
		<p>
			<input type="hidden" name="boardId" value="<%=boardDTO.getBoardId() %>">
			<input type="submit" value="수정" />
			<input type="button" onclick="location.href='bList.jsp'" value="전체글보기" />
		</p>
	</form>
</body>
</html>