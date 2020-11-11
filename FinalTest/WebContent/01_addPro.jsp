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
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int score = Integer.parseInt(request.getParameter("score"));
		
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setScore(score);
		
		int check = instance.checkId(vo);
		
		if (check == -1) {
			instance.addStudent(vo);
	%>
			<script type="text/javascript">
				alert('회원가입에 성공했습니다.');
				location.href = "main.jsp";
			</script>
	<%		
		} else {
	%>
			<script type="text/javascript">
				alert('중복된 id입니다. 다시 입력해주세요.');
				location.href = "main.jsp";
			</script>
	<%
		}
	%>
</body>
</html>