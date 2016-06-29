<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

$(document).ready(function() {

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
	<tr id="ap1">
		<td width="30%">Next Approver(대리급) : </td>
	<td colspan="3">
			<div id="next">
				<select id="nextSign1" name="approver1">
				<option value="">No Approver</option>
				<c:forEach items="${requestScope.list1 }" var="next1">
						<option value="${next1.empNo }">${next1.departmentVO.deptName }
							${next1.positionVO.positionName } ${next1.empName }</option>
					</c:forEach>

				</select>
			</div>
		</td>
	</tr>
	<tr  id="ap2" class="ap2">
		<td width="30%">Next Approver(과장급) : </td>
	<td colspan="3">
			<div id="next">
				<select id="nextSign2" name="approver2">
					<option value="">No Approver</option>
					<c:forEach items="${requestScope.list2 }" var="next2">
						<option value="${next2.empNo }">${next2.departmentVO.deptName }
							${next2.positionVO.positionName } ${next2.empName }</option>
					</c:forEach>

				</select>
			</div>
		</td>
	</tr>
	<tr  id="ap3">
		<td width="30%">Next Approver(부장급) : </td>
	<td colspan="3">
			<div id="next">
				<select id="nextSign3" name="approver3">
						<option value="">No Approver</option>
					<c:forEach items="${requestScope.list3 }" var="next3">
						<option value="${next3.empNo }">${next3.departmentVO.deptName }
							${next3.positionVO.positionName } ${next3.empName }</option>
					</c:forEach>

				</select>
			</div>
		</td>
	</tr>
	
	<tr id="ap4">
		<td width="30%">Next Approver(사장급) : </td>
	<td colspan="3">
			<div id="next">
				<select id="nextSign4" name="approver4">
						<option value="">No Approver</option>
					<c:forEach items="${requestScope.list4 }" var="next4">
						<option value="${next4.empNo }">${next4.departmentVO.deptName }
							${next4.positionVO.positionName } ${next4.empName }</option>
					</c:forEach>

				</select>
			</div>
		</td>
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