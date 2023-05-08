<%@page import="step3_boardEx.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="step3_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bList</title>
</head>
<body>
	<h3>게시글 전체 조회하기</h3>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		
		<%
		
			ArrayList<BoardDTO> boardList = BoardDAO.getInstance().getBoardList();
		
			int idx = 1;		
			for (BoardDTO boardDTO: boardList) {
		%>
				<tr>
					<td><%=idx %></td>
					<td><a href="bDetail.jsp?boardId=<%=boardDTO.getBoardId()%>"><%=boardDTO.getSubject()%></a></td>
					<td><%=boardDTO.getWriter() %></td>
					<td><%=boardDTO.getEnrollDT() %></td>
					<td><%=boardDTO.getReadCnt() %></td>
				</tr>
		
		<% 
				idx++;
			}
		%>
		
		
		
		
		<tr>
			<td colspan="5">
				<input type="button" value="글쓰기" onclick="location.href=''bWrite.jsp">
			</td>
		</tr>
	</table>
</html>