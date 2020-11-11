<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	BookDAO instance = BookDAO.getInstance();
 		// getInstance()메서드를 통해서 instance가져온다.
 		// 따라서 안에 있는 메서드 사용할 수 있다.
    	int bcode = instance.getMaxCode();
 		// 테이블을 만들어주기 전에 bcode의 최대값의 +1을 한 값을 가져온다.
 		// bcode는 primary key이기때문에 겹치면 안 된다. 
 		// 그래서 input창에 그 최대값을 넣어 값 변경을 할 수 없도록 만든다.
    %>
    
    <%-- header.jsp파일 가져오기 --%>
	<%@include file = "header.jsp" %>
	<%-- required로 데이터 유효성 검사 -> 입력하지 않으면 BookInsert.do 못 간다. --%>
	<form action="BookInsert.do" method="post">
		<table border="1">
			<tr>
				<th colspan="2" align="center">도서 정보 수정</th>
			</tr>
			<tr>
				<th>도서코드</th>
				<td>
					<input type="text" name="bcode" value="<%=bcode %>" readonly>
				</td>
			</tr>
			<tr>
				<th>도서제목</th>
				<td>
					<input type="text" name="btitle" required>
				</td>
			</tr>
			<tr>
				<th>도서저자</th>
				<td>
					<input type="text" name="bwriter" required>
				</td>
			</tr>
			<tr>
				<th>출판사 코드</th>
				<td>
					<select name="bpub" required>
						<option value="1001">양영디지털</option>
						<option value="1002">북스미디어</option>
						<option value="1003">한빛아카데미</option>
						<option value="1004">이지스</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="bprice" required>
				</td>
			</tr>
			<tr>
				<th>출간날짜</th>
				<td>
					<input type="text" name="bdate" placeholder="2019-07-22" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록"> <%-- 제출 --%>
					<input type="reset" value="재작성"> <%-- 다시 작성 --%>
				</td>
			</tr>
		</table>
	</form>
	<%-- footer.jsp파일 가져오기 --%>
	<%@include file = "footer.jsp" %>