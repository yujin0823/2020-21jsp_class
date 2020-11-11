<%@page import="book.BookVO"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
    	BookDAO instance = BookDAO.getInstance();
		// getInstance()메서드를 통해서 instance가져온다. -> 안에 있는 메서드 사용할 수 있다.
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		// 주소의 bcode를 가져와서
		// getABook()으로 그 bcode에 해당되는 책의 정보들을 가져온다.
		BookVO vo = instance.getABook(bcode);
    %>
    
    <%-- header.jsp파일 가져오기 --%>
	<%@include file = "header.jsp" %>
	<form action="updateBookPro.jsp" method="post">
		<table border="1">
			<tr>
				<th colspan="2" align="center">도서 정보 수정</th>
			</tr>
			<tr>
				<th>도서코드</th>
				<td>
					<input type="text" name="bcode" value="<%=vo.getBcode() %>" readonly>
				</td>
			</tr>
			<tr>
				<th>도서제목</th>
				<td>
					<input type="text" name="btitle" value="<%=vo.getBtitle() %>" required>
				</td>
			</tr>
			<tr>
				<th>도서저자</th>
				<td>
					<input type="text" name="bwriter" value="<%=vo.getBwriter() %>" required>
				</td>
			</tr>
			<tr>
				<th>출판사 코드</th>
				<td>
					<select name="bpub">
						<%
							String[] arr = {"양영디지털", "북스미디어", "한빛아카데미", "이지스"};
							int cnt = 0; // index를 위해서 변수 생성
							for (int i = 1001; i <= 1004; i++) { // 출판사 코드인 1001부터 1004까지
								if (vo.getBpub() == i) { // 사용자가 선택한 출판사명이 만약 i랑 같다면
						%>
									<%-- selected를 해줘서 딱 로딩했을 때 양영디지털이 아니라 사용자가 선택한 출판사명이 선택되도록 해준다. --%>
									<%-- index는 0부터 이므로 cnt 변수를 생성해서 arr[i]의 출판사명을 보이게 한다. --%>
									<%-- book.sql에 저장되어 있는 숫자(number)타입으로 value에 넣어준다. --%>
									<option value="<%=i %>" selected><%=arr[cnt] %></option> 
						<%			
								} else {
						%>
									<option value="<%=i %>"><%=arr[cnt] %></option>
						<%	
								}
								cnt++;
								// 그 다음의 출판사명을 보이게 해야하므로 cnt 즉 인덱스를 증가한다.
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" name="bprice" value="<%=vo.getBprice() %>" required>
				</td>
			</tr>
			<tr>
				<th>출간날짜</th>
				<td>
					<input type="text" name="bdate" value="<%=vo.getBdate() %>" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<%-- footer.jsp파일 가져오기 --%>
	<%@include file = "footer.jsp" %>