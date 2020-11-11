<%@page import="java.text.*"%>
<%@page import="java.sql.Date"%>
<%@page import="book.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<%-- header.jsp파일 가져오기 --%>
	<%@include file = "header.jsp" %>
	
	<table border="1">
		<tr>
			<th>도서코드</th>
			<th>도서제목</th>
			<th>도서저자</th>
			<th>출판사</th>
			<th>가격</th>
			<th>출간날짜</th>
			<th>삭제</th>
		</tr>
		
	<%
		// BookListController에서 list를 받아온다. (ArrayList<BookVO>)로 형변환 해야한다!
		ArrayList<BookVO> list = (ArrayList<BookVO>)request.getAttribute("list");
		for (int i = 0; i < list.size(); i++) { // i를 받아온 list의 사이즈만큼 1씩 증가하면서
			BookVO vo = list.get(i);
			
			String Bpub = "";
			// bpub은 원래 숫자(number)의 형태이며 테이블에 1001이런식으로 뜬다.
			// list.get(i)의 출판사코드를 가져와서 각 출판사 코드에 맞는 출판사명을 넣어준다.
			switch (vo.getBpub()) {
				case 1001: Bpub = "양영디지털";
				break;
				case 1002: Bpub = "북스미디어";
				break;
				case 1003: Bpub = "한빛아카데미";
				break;
				case 1004: Bpub = "이지스";
				break;
			}
			
			int bprice = list.get(i).getBprice();
			// list의 i번째 값의 price가져온다.
			DecimalFormat df = new DecimalFormat("###,###");
			// 가격의 세자리마다 콤마를 출력
			// "###,###"의 방식으로 price 포맷한다.
			String test = df.format(bprice);
			
			Date dbate = vo.getBdate();
			// vo의 date를 가져와서
//			SimpleDateFormat sdf = new SimpleDateFormat("YYYY년MM월DD일");
			// Date 타입 -> String 타입
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			
			String temp = sdf.format(dbate); // date타입이 들어간다. ex) 2020년 11월 11일
//			Date testDate = Date.valueOf(temp);
	%>
			<tr align="center">
				<%-- 각 bcode에 맞는 update, delete 페이지로 이동 --%> 
				<td><a href="updateBook.jsp?bcode=<%=vo.getBcode() %>"><%=vo.getBcode() %></a></td>
				<td><%=vo.getBtitle() %></td>
				<td><%=vo.getBwriter() %></td>
				<td><%=Bpub %></td>
				<td><%=test %></td>
				<td><%=temp %></td>
				<td><a href="deleteBook.jsp?bcode=<%=vo.getBcode() %>">삭제</a></td>
			</tr>
	<%		
		}
	%>
	</table>
	 <%-- footer.jsp파일 가져오기 --%>
	<%@include file = "footer.jsp" %>