<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 점수 확인</title>
</head>
<body>	
	<%
		UserDAO instance = UserDAO.getInstance();	
	
		String myName = request.getParameter("name");
		int myGrade = Integer.parseInt(request.getParameter("grade"));
		
		int idx = instance.CheckLogin(myName, myGrade);
		
		if (idx == -1) {
	%>
			<h2>사용자 <%=myName %>[<%=myGrade %>] 님은 등록된 사용자가 아닙니다.</h2>
			<h2>사용자 등록 후 이용하시오</h2>
			<hr>
			<button onclick="location.href='01_index.jsp'">홈으로</button>
	<%
		} else {
	%>
			<h2>학생 개인 성적 출력</h2>
			<button onclick="location.href='01_index.jsp'">홈으로</button>
			<hr>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>학번</th>
					<th>점수</th>
				</tr>
				
				<tr>
					<td><%=instance.list.get(idx).getNo() + 1 %></td>
					<td><%=instance.list.get(idx).getName() %></td>
					<td><%=instance.list.get(idx).getGrade() %></td>
					<td><%=instance.list.get(idx).getJumsu() %></td>
				</tr>
			</table>
	<%
		}
	%>
</body>
</html>