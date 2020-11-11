<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0_테스트시작화면</title>
</head>
<body>
	<h1>응용프로그래밍 개발 테스트</h1>
	<h3> - 사용자 등록 후 응시하시오. - </h3>
	<button onclick="location.href='01_index.jsp?btn=1'">사용자 정보 등록</button>
	<button onclick="location.href='01_index.jsp?btn=2'">사용자 점수 보기</button>
	<button onclick="location.href='02_userList.jsp'">사용자 전체 보기</button>
	<hr>
	
	<%	
		UserDAO instance = UserDAO.getInstance();
		if (request.getParameter("btn") != null) {
			int btn = Integer.parseInt(request.getParameter("btn"));
			
			if (btn == 1) {
	%>
				<h3>사용자 등록 화면</h3>
				<form method="post" action="03_registerPro.jsp">
					이름 : <input type="text" name="name" required><br>
					학번 : <input type="text" name="grade" required placeholder="예) 4자리"><br>
					<input type="submit" value="등록">
				</form>
	<%
			} else if (btn == 2) {
	%>
				<h3>결과 확인 화면</h3>
				<form method="get" action="06_printResult.jsp">
					등록한 이름 : <input type="text" name="name" required><br>
					등록한 학번 : <input type="text" name="grade" required placeholder="예) 4자리">
					<br><br><br>
					<input type="submit" value="결과확인">
				</form>
	<%			
			}
		}
	%>
	
	<%	
		if (request.getParameter("idx") != null) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			
			int myEx01 = Integer.parseInt(request.getParameter("Ex01"));
			int myEx02 = Integer.parseInt(request.getParameter("Ex02"));
			int myEx03 = Integer.parseInt(request.getParameter("Ex03"));
			
			instance.checkResult(myEx01, myEx02, myEx03, idx);
		}
	%>
</body>
</html>