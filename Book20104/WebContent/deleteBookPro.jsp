<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		// 주소의 bcode를 가져오기
		// 값이 정수형이면 Integer.parseInt로 형변환을 해야한다.
		BookDAO instance = BookDAO.getInstance();
		// getInstance()메서드를 통해서 instance가져온다. -> 안에 있는 메서드 사용할 수 있다.
		int cnt = instance.deleteBook(bcode);
		// 가져온 bcode를 deleteBook()에 넣어 delete문을 실행한다.
		// deleteBook(bcode)실행하고 결과값을 int로 받아온다. 
		// -> 성공한 레코드 수를 리턴  즉 오라클에 성공적으로 삽입하면 0이상의 수(> 0) 리턴
		
		if (cnt > 0) { // 성공한 레코드의 수가 있다면
	%>
			<script type="text/javascript">
				// 삭제 완료라고 alert창을 띄우고 도서 목록 페이지로 이동
				// select.jsp로 보내면 안 된다. -> list를 받아올 수 없기 때문에 table에 책 목록이 뜨지 않는다. 
				alert('도서 삭제 완료');
				location.href="BookList.do";
			</script>
	<%		
		} else { // 성공한 레코드의 수가 없으면
	%>
			<script type="text/javascript">
				// 삭제 실패라고 alert창을 띄우고 도서 목록 페이지로 이동
				alert('도서 삭제 실패');
				location.href="BookList.do";
			</script>
	<%	
		}
	%>
</body>
</html>