<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.UserDAO" import="test.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 점수 확인</title>
</head>
<body>
	<h2>학생목록 조회</h2>
	<br>
	<button onclick="location.href='01_index.jsp'">홈으로</button>
	<hr>
	
	<% 
		UserDAO instance = UserDAO.getInstance();
		UserVO VO = new UserVO();
	%>
	
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>학번</th>
				<th>점수</th>
			</tr>
	<%
			for (int i = 0; i < instance.getMaxNo(); i++) {
				
	%>		
			<tr>
				<td><%=instance.list.get(i).getNo() + 1 %></td>
				<td><%=instance.list.get(i).getName() %></td>
				<td><%=instance.list.get(i).getGrade() %></td>
				<td><%=instance.list.get(i).getJumsu() %></td>
			</tr>
			
	<%
			}
	%>
		</table>
</body>
</html>