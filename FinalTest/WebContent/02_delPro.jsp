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
		StudentDAO instance = StudentDAO.getInstance();
		StudentVO vo = new StudentVO();
		
		String id = request.getParameter("id");
		vo.setId(id);
		
		int check = instance.checkId(vo);
		//System.out.println(check);
		
		if (check == -1) {
	%>
			<script type="text/javascript">
				alert('없는 id입니다.');
				location.href = "main.jsp";
			</script>
	<%		
		} else {
			instance.removeStudent(check);
	%>
			<script type="text/javascript">
				alert('회원탈퇴에 성공하셨습니다.');
				location.href = "main.jsp";
			</script>
	<%	
		}
	%>
</body>
</html>