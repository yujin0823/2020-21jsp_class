<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"
    import="test.TestVO" import="test.TestDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20104 이유진</title>
</head>
<body>
	<%
		TestVO vo = new TestVO();
		TestDAO instance = TestDAO.getInstance();
		ArrayList<TestVO> scoreList = instance.jumsuList;
		
		String myname = request.getParameter("name");
		int myRegNum = Integer.parseInt(request.getParameter("regNum"));
		
		int result = 0;
		String resultStr = "";
		
		if (myname.equals(vo.getName())) {
			if (myRegNum == vo.getRegNum()) {
				int myComNum = scoreList.get(0).getComNum();
				int myExcelNum = scoreList.get(0).getExcelNum();
				
				result = instance.checkResult(myComNum, myExcelNum);
				//out.println(myComNum + ", " + myExcelNum + ", " + result);
	%>
				<h2><%=myname %>님 (<%=myRegNum %>)의 결과입니다.</h2>
	<%			
				if (result == 1) {
					resultStr = "합격을 축하드립니다.";
	%>
					<h2><font color="blue"><%=resultStr %></font></h2>
	<%
				} else if (result == 0) {
					resultStr = "불합격입니다.";
	%>
					<h2><font color="red"><%=resultStr %></font></h2>
	<%
				}
			} else {
	%>
				<script>
					alert("수험번호 불일치");
					history.go(-1);
				</script>
	<%				
			}
		} else {
	%>
				<script>
					alert("수험자 이름 불일치");
					history.go(-1);
				</script>
	<%			
			}
	%>
</body>
</html>