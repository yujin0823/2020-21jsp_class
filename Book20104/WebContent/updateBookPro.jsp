<%@page import="book.BookVO"%>
<%@page import="java.sql.Date"%>
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
		// post로 값 넘겨 받을 때 항상 한글 깨짐 방지를 위해서 입력!
		request.setCharacterEncoding("utf-8");
		BookDAO instance = BookDAO.getInstance();
		// getInstance()메서드를 통해서 instance가져온다. -> 안에 있는 메서드 사용할 수 있다.
		
		// updateBook.jsp의 form태그에서 input으로 사용자에거 받은 정보 얻기
		// <파라미터 작업> updateBook.jsp에서 넘겨받은 bcode, btitle, bwriter, bpub, bprice, bdate
		// bcode, bpub, bprice  => 정수로 반환 Integer.parseInt(request.getParameter("bcode"));
		// btitle, bwriter, bdate 스트링 값 가져오는 방법 => request.getParameter("파라미터 이름");
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		String btitle = request.getParameter("btitle");	
		String bwriter = request.getParameter("bwriter");
		int bpub = Integer.parseInt(request.getParameter("bpub"));
		int bprice = Integer.parseInt(request.getParameter("bprice"));
		String bdate = request.getParameter("bdate");
		// String에서 Date : form에서 사용자가 입력한 데이터 Stirng으로 지정된 것을 Date로 변경해준다.
		Date passDate = Date.valueOf(bdate);
		
		// 한 번에 vo객체에 사용자가 입력한 정보를 넣어준다.
		BookVO vo = new BookVO(bcode, btitle, bwriter, bpub, bprice, passDate);
		// 결과값 : executeUpdate()로 실행 => 결과 int -> 성공한 레코드 수  > 0
		int cnt = instance.updateBook(vo);
		
		if (cnt > 0) { // 성공한 레코드의 수가 0이상이면
	%>
			<script type="text/javascript">
				// alert창으로 완료되었다고 띄어주고  BookList.do로 이동
				// select.jsp로 보내면 안 된다. -> list를 받아올 수 없기 때문에 table에 책 목록이 뜨지 않는다. 
				alert('도서 정보 수정 성공');
				location.href="BookList.do";
			</script>
	<%		
		}
	%>
</body>
</html>