<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.StudentDAO" import="test.StudentVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원검색(이름)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		StudentDAO instance = StudentDAO.getInstance();
		StudentVO vo = new StudentVO();
		
		String name = request.getParameter("name");
		vo.setName(name);
		
		int check = instance.checkName(vo);
		
		if (check == -1) {
	%>
			<script type="text/javascript">
				alert('없는 이름입니다.');
				location.href = "main.jsp";
			</script>
	<%
		} else {
	%>
			<h3>회원정보</h3>
			<table border="1">
				<tr>
					<td>id</td>
					<td>이름</td>
					<td>점수</td>
				</tr>
				<tr>
					<td><%=instance.list.get(check).getId() %></td>
					<td><%=instance.list.get(check).getName() %></td>
					<td><%=instance.list.get(check).getScore() %></td>
				</tr>
			</table>
	<%		
		}
	%>
	<br>
	<button onclick="location.href='main.jsp'">메인</button>
</body>
</html>