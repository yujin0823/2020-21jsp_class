<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.StudentDAO" import="test.StudentVO"%>
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
		StudentVO vo = new StudentVO();
		
		String id = request.getParameter("id");
		vo.setId(id);
		
		int check = instance.checkId(vo);
		
		if (check == -1) {
	%>
			<script type="text/javascript">
				alert('없는 id입니다.');
				location.href = "main.jsp";
			</script>
	<%
		} else {
	%>		
			<form method="post" action="03_updatePro2.jsp?idx=<%=check %>">
				<table>
					<tr>
						<td>id</td>
						<td>pw</td>
						<td>이름</td>
						<td>점수</td>
					</tr>
					<tr>
						<td><input type="text" name="id" value="<%=instance.list.get(check).getId() %>" required></td>
						<td><input type="password" name="pw" value="<%=instance.list.get(check).getPw() %>" required></td>
						<td><input type="text" name="name" value="<%=instance.list.get(check).getName() %>" required></td>
						<td><input type="text" name="score" value="<%=instance.list.get(check).getScore() %>" required></td>
					</tr>
				</table>
				<input type="submit" value="제출">
			</form>
	<%		
		}
	%>
</body>
</html>