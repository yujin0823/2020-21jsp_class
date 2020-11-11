<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.StudentDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		StudentDAO instance = StudentDAO.getInstance();
	%>

	<table border="1">
		<tr>
			<td>id</td>
			<td>이름</td>
			<td>점수</td>
		</tr>
	<%
		for (int i = 0; i < instance.getSize(); i++) {
	%>
		<tr>
			<td><%=instance.list.get(i).getId() %></td>
			<td><%=instance.list.get(i).getName() %></td>
			<td><%=instance.list.get(i).getScore() %></td>
		</tr>
	<%		
		}
	%>
	</table>
</body>
</html>