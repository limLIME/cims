<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function gomain() {
		location.href="${initParam.root}home.do?pageNo=1";
	}
</script>
</head>
<body>
	<section id="main-content"> 
	<section class="wrapper">
	<div class="marginMain">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h3>
						<i class="fa fa-angle-right"></i> Update Information of Employees
					</h3>
					<hr>
					<center>
					<h3>사원 정보 수정 완료</h3>
					<button  type="button" class="btn btn-success" onclick="gomain()">Go Main</button>
					</center>
				</div>
			</div>
		</div>
	</div>
	</section>
	</section>
</body>
</html>

