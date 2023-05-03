<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<%
		String memberID = (String)session.getAttribute("memberId");	
	
	%>

	<form action="07_deletePro.jsp" method="post">
		<fieldset>
			<legend>Delete Member '<%=memberID %>' </legend>
			<p>Id : <input type="text" name="memberId"  value="<%=memberID %>" readonly></p>		
			<p>Password : <input type="password" name="passwd"></p>		
			<p><input type="submit" value="delete"></p>
		</fieldset>	
	</form>

</body>
</html>




