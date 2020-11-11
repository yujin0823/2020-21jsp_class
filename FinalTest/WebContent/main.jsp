<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.StudentDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20104 mainPage</title>
<link rel="stylesheet" href="style.css">
<style>
	table {
		text-align: center;
	}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		StudentDAO instance = StudentDAO.getInstance();
	%>

	<h1>FinalTest</h1>
	
	<div class="menu">
		<ul class="menu_box">
			<li>학생 정보
				<ul class="sub">
					<li><a href="01_add.jsp">추가</a></li>
					<li><a href="02_del.jsp">삭제</a></li>
					<li><a href="03_update.jsp">수정</a></li>
				</ul>
			</li>
			<li>학생 검색
				<ul class="sub">
					<li><a href="04_search.jsp">id</a></li>
					<li><a href="05_search.jsp">이름</a></li>
				</ul>
			</li>
			<li><a href="main.jsp?btn=5">정렬</a></li>
			<li><a href="06_MaxAvg.jsp">통계</a></li>
		</ul>
	</div>
	
	<!-- <button onclick="location.href='01_add.jsp'">학생 성적 추가</button>
	<button onclick="location.href='02_del.jsp'">학생 성적 삭제</button>
	<button onclick="location.href='03_update.jsp'">학생 성적 수정</button>
	<button onclick="location.href='04_search.jsp'">학생 성적 검색(id)</button>
	<button onclick="location.href='05_search.jsp'">학생 성적 검색(이름)</button>
	<button onclick="location.href='main.jsp?btn=5'">학생 성적 정렬</button>
	<button onclick="location.href='06_MaxAvg.jsp'">최댓값 & 평균</button> -->
	<hr>
	
	<%
		if (request.getParameter("btn") != null) {
			int btn = Integer.parseInt(request.getParameter("btn"));
			
			if (btn == 5) {
				instance.sortData();
			}
		}
	%>
	
	<jsp:include page="table.jsp"/>
</body>
</html>