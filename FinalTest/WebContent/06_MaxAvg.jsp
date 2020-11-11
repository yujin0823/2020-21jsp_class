<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.StudentDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최대값 & 평균</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		StudentDAO instance = StudentDAO.getInstance();
		
		int sum = instance.printSum();
		int avg = instance.printAvg();
		String maxName = instance.list.get(instance.printMax()).getName();
		int maxNum = instance.list.get(instance.printMax()).getScore();
	%>
	<h3>통계</h3>
	<h3>--1등--</h3>
	<p><%=maxName %> : <%=maxNum %></p>
	<p>합계 : <%=sum %></p>
	<p>평균 : <%=avg %></p>
	
	<jsp:include page="table.jsp"/>
	<br>
	<button onclick="location.href='main.jsp'">메인</button>
</body>
</html>