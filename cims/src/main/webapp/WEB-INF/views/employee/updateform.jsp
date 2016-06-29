<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			$("#Btn2").click(function(){
				location.href="${initParam.root}home.do";
			});
	});
</script>
</head>
<body>
<section id="main-content">
	<section class="wrapper">
		<div class="marginMain">
		<!-- BASIC FORM ELELEMNTS -->
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
		<h3>
			<i class="fa fa-angle-right"></i> Update Information of Employees
		</h3>
	<hr><br>
					<form action="${initParam.root }emp_update.do"
						class="form-horizontal style-form" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Department Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="deptNo" value="${evo.departmentVO.deptNo}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Position Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="positionNo" value="${evo.positionVO.positionNo}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Employee Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empNo" readonly="readonly" value="${evo.empNo}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName" readonly="readonly" value="${evo.empName}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Password</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Telephone Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empTel" value="${evo.empTel}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Sign</label>
							<div class="col-sm-10">
								<input type="file" name="file[0]" class="form-control" value = "${evo.empSign }">
							</div>
						</div>
						<div class="form-group">
							<!-- <label class="col-sm-2 col-sm-2 control-label">서명</label> -->
							<label class="col-sm-2 col-sm-2 control-label">Portrait</label>
							<div class="col-sm-10">
								<input type="file" name="file[1]" class="form-control" value="${evo.empPath }">
							</div>
						</div>
						<center>
						<input type="submit" value="Update" class="btn btn-primary" id="Btn1">&nbsp;
						<input type="reset" value="Reset" class="btn btn-warning">&nbsp;
						<input type="button" value="Cancle" class="btn btn-danger" id="Btn2">
						</center>
					</form>
				</div>
			</div>
			</div>
		</div>
	</section>
</section>
</body>
</html>







<%--     
<form action="${initParam.root }emp_update.do" method="post" enctype="multipart/form-data" >
   부서번호 <input type="text" name="deptNo" readonly="readonly" value="${sessionScope.evo.departmentVO.deptNo }"><br>
   직급번호 <input type="text" name="positionNo" readonly="readonly" value="${sessionScope.evo.positionVO.positionNo }"><br>
   사원번호 <input type="text" name="empNo" readonly="readonly" value="${sessionScope.evo.empNo }"><br>
   이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="empName" readonly="readonly" value="${sessionScope.evo.empName }"><br>
   비밀번호 <input type="text" name="password" value="${sessionScope.evo.password }"><br>
   전화번호 <input type="text" name="empTel" value="${sessionScope.evo.empTel }"><br>
   서명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="file" name="multipartFile">
<br><br>
<input type="submit" value="정보수정">
<input type="reset" value="리셋">
</form>
--%>