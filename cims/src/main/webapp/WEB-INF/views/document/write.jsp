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
});

</script>

<section id="main-content">
          <section class="wrapper">

<div class="marginDocWrite">
<div class="content-panel">
<h3>&nbsp;<i class="fa fa-angle-right"></i>Document Write</h3>
<center>
<form id="writeForm" action="${initParam.root }doc_write.do" enctype="multipart/form-data" method="post">

<table class="table" >
	<tr>
		<td colspan="4">
			Document Title : <input size="50%" type="text" name="title" placeholder="Write Docunemt Title"></td>

	</tr>
	<tr>
		<td colspan="4">Writter :  ${sessionScope.evo.departmentVO.deptName}  ${sessionScope.evo.positionVO.positionName}  ${sessionScope.evo.empName}</td>
	</tr>
		 <tr>
	 <td>Approver 1 :</td>
	 <td colspan="3"> <input type="text" id="app1" name="approver1" ></td>
	 </tr>
	 	 <tr>
	 <td>Approver 2 :</td>
	 <td colspan="3"><input type="text" id="app2" name="approver2"  ></td>
	 </tr>
	<tr>
	<td>Approver 3 :</td>
	 <td colspan="3"><input type="text" id="app3" name="approver3" readonly="readonly"></td>
	 </tr>
	<tr>
	<td>Approver 4 :</td>
	 <td colspan="3"><input type="text" id="app4" name="approver4" readonly="readonly"></td>
	 </tr>
	<tr>
		<td colspan="4">
		<textarea style="width:100%;height:70;" name="content" rows="10" cols="70" placeholder="Write Docunemt Content"></textarea></td>
	</tr>
	<tr>
		<td>Attached File</td>
		<td colspan="3"><input type="file" name="multipartFile"></td>
	</tr>
	<tr>
	<td colspan="4" align="center">
	<input type="submit" class ="btn btn-primary" value="Complete"> 
	<input type="reset" class ="btn btn-warning" value="Reset">
	</td>
	</tr>
	
</table>

</form>
</center>
</div></div>
</section></section>