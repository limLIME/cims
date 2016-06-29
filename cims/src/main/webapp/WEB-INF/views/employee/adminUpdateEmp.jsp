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
			<i class="fa fa-angle-right"></i> Update Employee Information
		</h3>
	<hr><br>
					<form action="${initParam.root }emp_adminUpdate.do"
						class="form-horizontal style-form" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Department Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="deptNo" value="${vo.departmentVO.deptNo}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Position Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="positionNo" value="${vo.positionVO.positionNo}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Employee Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empNo" value="${vo.empNo}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName" value="${vo.empName}">
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
								<input type="text" class="form-control" name="empTel" value="${vo.empTel}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Sign</label>
							<div class="col-sm-10">
								<input type="file" name="file[0]" class="form-control" value = "${vo.empSign }">
							</div>
						</div>
						<div class="form-group">
							<!-- <label class="col-sm-2 col-sm-2 control-label">서명</label> -->
							<label class="col-sm-2 col-sm-2 control-label">Portrait</label>
							<div class="col-sm-10">
								<input type="file" name="file[1]" class="form-control" value="${vo.empPath }">
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



