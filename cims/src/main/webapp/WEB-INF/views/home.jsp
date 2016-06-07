<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.left4 {
	float: left;
	width: 200px;
	height: 400px;
	background-color: #fff;
	border: 5px solid #eee;
	margin-top: 60px;
	margin-left: 100px;
	padding: 5px;
	min-height: 150px;
}

.left4_1 {
	background-color: #fff;
	border: 5px solid #ccc;
	margin: 15px 0px 5px 0px;
	padding: 0px;
	min-height: 50px;
	height: 100px;
}

.right4 {
	background-color: #fff;
	border: 5px solid #eee;
	margin-top: 60px;
	margin-left: 300px;
	width: 200px;
	height: 400px;
	padding: 5px;
	min-height: 150px;
}

.right4_1 {
	background-color: #fff;
	border: 5px solid #ccc;
	margin: 15px 0px 5px 0px;
	padding: 0px;
	min-height: 50px;
	height: 100px;
}
</style>
</head>
<body>
	<div class="left4">
		<div class="left4_1">left4_1</div>
		<div class="left4_1">left4_1</div>
		<div class="left4_1">left4_1</div>
	</div>
	<div class="right4">
		<div class="right4_1">
			<img src="기본 이미지 경로" onmouseover="this.src='롤오버 이미지 경로';"
				onmouseout="this.src='기본 이미지 경로';" />
		</div>
		<div class="right4_1">right4_1</div>
		<div class="right4_1">right4_1</div>
	</div>
</body>
</html>
