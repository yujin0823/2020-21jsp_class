<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% int bcode = Integer.parseInt(request.getParameter("bcode")); %>
	<script type="text/javascript">
		if (confirm("정말 삭제하겠습니끼?") == true) location.href="deleteBookPro.jsp?bcode=<%=bcode %>"; 
		else history.go(-1);
	</script>
</body>
</html>