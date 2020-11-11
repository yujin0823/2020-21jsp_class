<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원검색(이름)</title>
</head>
<body>
	<h3>회원검색</h3>
	<form method="post" action="05_searchPro.jsp" accept-charset="utf-8">
		이름 : <input type="text" name="name" placeholder="이름" required>
		<input type="submit" value="제출">
		<br>
		<input type="reset" value="초기화">
		<button onclick="location.href='main.jsp'">메인으로 이동</button>
	</form>
</body>
</html>