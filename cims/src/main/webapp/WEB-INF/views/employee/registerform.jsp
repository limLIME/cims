<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document).ready(function(){
			$("#cancelBtn").click(function(){
				location.href="${initParam.root}home.do";
			});
			
			$("#registerBtn").click(function(){
				if($("#deptNo").val()==""){
					alert("부서를 선택하세요");
				}else if($("#positionNo").val()==""){
					alert("직책을 선택하세요");
				}else if($("#empNo").val()==""){
					alert("사원번호를 입력하세요");
				}else if($("#name").val()==""){
					alert("이름을 입력하세요");
				}else if($("#password").val()==""){
					alert("password를 입력하세요");
				}else if($("#empTel").val()==""){
					alert("전화번호를 입력하세요");
				}else{
					$("#registerForm").submit();
				}
				
			});
			
	});
</script>

<section id="main-content">
	<section class="wrapper">
	<div class="marginMain">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
		<h3>
			<i class="fa fa-angle-right"></i> Employee Register 
		</h3>
	<hr><br>
					<form id="registerForm" action="${initParam.root }emp_register.do"
						class="form-horizontal style-form" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Department Number</label>
							<div class="col-sm-10" style="font-size: 1.3em">
							
							<c:forEach items="${deptList }" var="dept">
								<input type="radio"  name="deptNo" value="${dept.departmentVO.deptNo }">${dept.departmentVO.deptName } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Position Number</label>
							<div class="col-sm-10"  style="font-size: 1.3em">
								<c:forEach items="${positionList }" var="position">
								<input type="radio"  name="positionNo" value="${position.positionVO.positionNo }">${position.positionVO.positionName } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Employee Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empNo" id="empNo">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName" id="name">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Password</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="password" id="password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Telephone Number</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empTel" id="empTel">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Sign</label>
							<div class="col-sm-10">
								<input type="file" name="file[0]" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">Portrait</label>
							<div class="col-sm-10">
								<input type="file" name="file[1]" class="form-control">
							</div>
						</div>						
				<center>
						<input type="button" value="Register" class="btn btn-primary" id="registerBtn">&nbsp;
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






