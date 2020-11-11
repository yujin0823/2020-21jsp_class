<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" 
    	integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가 화면</title>
<style>
	* {
		margin: 0 auto;
		background-color: white;
		border: none;
		font-weight: bold;
	}
	
	h3 {
		width: 100%;
		margin: 20px auto 10px auto;
		text-align: center;
	}

	input {
		height: 30px;
	}
	
	.submit {
		width: 100%;
		height: 30px;
		background-color: lightblue;
		border-radius: 10px;
		margin-bottom: 10px;
	}
	
	i {
		width: 50px;
		height: 30px;
		padding-top: 10px;
		font-size: 20px;
		text-align: center;
	}
</style>
</head>
<body>	
	<h3>회원가입</h3>
	<form method="post" action="01_addPro.jsp">
		<table>
			<tr>
				<td><i class="fas fa-id-card-alt"></i></td>
				<td><input type="text" name="id" required placeholder="id"></td>
			</tr>
			<tr>
				<td><i class="fas fa-unlock"></i></td>
				<td><input type="password" name="pw" required placeholder="password"></td>
			</tr>
			<tr>
				<td><i class="fas fa-user-alt"></i></td>
				<td><input type="text" name="name" required placeholder="name"></td>
			</tr>
			<tr>
				<td><i class="fas fa-marker"></i></td>
				<td><input type="text" name="score" required placeholder="score"></td>
			</tr>
			<tr>
				<td colspan="2"><input class="submit" type="submit" value="회원가입"></td>
			</tr>
			<tr>
				<td><button type="reset">초기화</button></td>
				<td><button onclick="location.href='main.jsp'">메인으로 이동</button></td>
			</tr>
		</table>
	</form>
</body>
</html>