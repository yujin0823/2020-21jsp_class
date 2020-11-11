<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_셤문제</title>
</head>
<body>
	<%
		int idx = Integer.parseInt(request.getParameter("idx"));
	%>
	<h2>다음 문제를 읽고 답을 고르시오.</h2>
	<form method="post" action="01_index.jsp?idx=<%=idx %>">
		<p>JSP를 바르게 풀어 쓴 것은?[10점]</p> <!-- 2 -->
		<input type="radio" name="Ex01" value="1"> Jason Server Page 
		<input type="radio" name="Ex01" value="2"> Java Server Page 
		<input type="radio" name="Ex01" value="3"> Java Servlet Page 
		
		<p>JSP태그의 종류와 설명이 잘못 짝지어진 것은?[10점]</p> <!-- 2 -->
		<input type="radio" name="Ex02" value="1"> 지시어(&lt;%@ %&gt;)<br>
		<input type="radio" name="Ex02" value="2"> 표현식(&lt;%! %&gt;)<br>
		<input type="radio" name="Ex02" value="3"> 주석(&lt;%-- --%&gt;)<br>
		<input type="radio" name="Ex02" value="4"> 스크립트릿(&lt;% %&gt;)<br>
		
		<p>JSP를 바르게 풀어 쓴 것은?[10점]</p> <!-- 3 -->
		<input type="radio" name="Ex03" value="1"> 서블릿 기술에 기초한다.<br>
		<input type="radio" name="Ex03" value="2"> 자바 언어의 특성을 활용할 수 있다<br>
		<input type="radio" name="Ex03" value="3"> 내장객체가 있어서 선언없이 사용할 수 있다.<br>
		<input type="radio" name="Ex03" value="4"> 스크립트 방식으로 프로그램을 작성할 수 있다.<br>
		<br><br>
		<input type="submit" value="제출하기">
	</form>
</body>
</html>