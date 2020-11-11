<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.UserDAO" import="test.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
</head>
<body>
	<%
		UserDAO instance = UserDAO.getInstance();
		UserVO VO = new UserVO();
		
		String myName = request.getParameter("name");
		int myGrade = Integer.parseInt(request.getParameter("grade"));
		int check = 0; // -1 : 겹침 0 : 안 겹침
		
		VO.setNo(instance.list.size());
		VO.setName(myName);
		VO.setGrade(myGrade);
		
		System.out.println(instance.getMaxNo());
		for (int i = 0; i < instance.getMaxNo(); i++) {
			String otherName = instance.list.get(i).getName();
			int otherGrade = instance.list.get(i).getGrade();
			
			if (myName.equals(otherName) || myGrade == otherGrade) {
				check = -1;
			} else {
				check = 0;
			}
		}
		
		if (check == -1) {
	%>
			<h2>이미 등록된 사용자입니다.</h2>
			<br>
			<hr>
			<button onclick="location.href='01_index.jsp'">홈으로</button>
	<%
		} else {
			instance.addUser(VO);
	%>
			<h2>사용자 <%=myName %>[<%=myGrade %>] 님이 등록되었습니다.</h2>
			<a href="04_test.jsp?idx=<%=instance.list.size() - 1 %>">문제 풀기로 이동합니다.</a>
	<%
		}
	%>
</body>
</html>