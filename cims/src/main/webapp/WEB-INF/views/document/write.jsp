<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

$(document).ready(function() {
	$("#app1").click(function() {
		window.open("${initParam.root}doc_popup.do?txt=app1","결재대상자지정","left=300,top=50,width=1500,height=800"); 
	});
	$("#app2").click(function() {
		window.open("${initParam.root}doc_popup.do?txt=app2", "결재대상자지정","left=300,top=50,width=1500,height=800"); 
	});
	$("#app3").click(function() {
		window.open("${initParam.root}doc_popup.do?txt=app3", "결재대상자지정","left=300,top=50,width=1500,height=800"); 
	});
	$("#app4").click(function() {
		window.open("${initParam.root}doc_popup.do?txt=app4", "결재대상자지정","left=300,top=50,width=1500,height=800"); 
	});
	
	$("#completeBtn").click(function() {
		var title = $("#title").val();
		var content=$("#content").val();
		if(title==""){
			alert("공문의 제목을 입력하세요");
		}else if($("#app1").val()=="" &&$("#app2").val()==""&&$("#app3").val()==""&&$("#app4").val()==""){
			alert("결재자를 지정하세요");
		}else if(content==""){
			alert("공문 내용을 입력하세요");
		}else{
			$("#writeForm").submit();
		}

	});

	
	
	
	
	
});

</script>

<section id="main-content">
	<section class="wrapper">
		<div class="marginDocWrite">
			<div class="content-panel">
				<h3>
					&nbsp;<i class="fa fa-angle-right"></i> Document Write
				</h3>
				<center>
					<form id="writeForm" action="${initParam.root }doc_write.do" enctype="multipart/form-data" method="post">
						<table class="table">
							<tr>
								<td colspan="6">Document Title : <input size="50%" type="text" id="title" name="title" placeholder="Write Docunemt Title"></td>
							</tr>
							<tr>
								<td colspan="6">Writter : ${sessionScope.evo.departmentVO.deptName} ${sessionScope.evo.positionVO.positionName} ${sessionScope.evo.empName} (${sessionScope.evo.empNo})</td>
							</tr>
							<tr>
								<td colspan="6">Approver 1 : <input type="text" id="app1" name="approver1" size="30" readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan="6">Approver 2 : <input type="text" id="app2" name="approver2" size="30" readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan="6">Approver 3 : <input type="text" id="app3" name="approver3" size="30" readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan="6">Approver 4 : <input type="text" id="app4" name="approver4" size="30" readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan="6"><textarea style="width: 100%; height: 70;" id="content" name="content" rows="10" cols="70" placeholder="Write Docunemt Content"></textarea></td>
							</tr>
							<tr>
								<td>Attached File</td>
								<td colspan="5"><input type="file" name="multipartFile"></td>
							</tr>
							<tr>
								<td colspan="6" align="center">
									<input type="button" class="btn btn-primary" id="completeBtn" value="Complete">
									<input type="reset" class="btn btn-warning" value="Reset">
								</td>
							</tr>

						</table>

					</form>
				</center>
			</div>
		</div>
	</section>
</section>