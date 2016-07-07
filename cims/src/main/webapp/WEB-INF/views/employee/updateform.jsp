<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript">
	$(document).ready(function(){
			$("#cancelBtn").click(function(){
				location.href="${initParam.root}home.do?pageNo=1";
			});
			
			$("#updateBtn").click(function(){
				if($("#password").val()==""){
					alert("password를 입력하세요");
				}else{
					$("#updateForm").submit();
				}
				
			});
			
	});
</script>

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
					<form id="updateForm" action="${initParam.root }emp_update.do"
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
								<input type="text" class="form-control" name="password" id="password">
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
						<input type="button" value="Update" class="btn btn-primary" id="updateBtn" >&nbsp;
						<input type="reset" value="Reset" class="btn btn-warning">&nbsp;
						<input type="button" value="Cancel" class="btn btn-danger" id="cancelBtn">
						</center>
					</form>
				</div>
			</div>
			</div>
		</div>
	</section>
</section>





