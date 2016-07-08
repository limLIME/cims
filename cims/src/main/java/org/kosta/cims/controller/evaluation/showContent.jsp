<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <script type="text/javascript">
    $(document).ready(function(){
    	$("#listImg").click(function(){    		
    		location.href="evaluation_evaluationList.do";
    	});
    	$("#updateBtn").click(function(){  
    		if(confirm("게시물을 수정하시겠습니까?"))
    		location.href="${initParam.root}evaluation_update.do?no=${requestScope.evalVo.evaluationNo}";
    	});
    });	
</script>


<section id="main-content">
<section class="wrapper">
 <div class="marginMain2">	
 <div class="content-panel">
  <h3>&nbsp;<i class="fa fa-angle-right"></i> Evaluation</h3>
	<table class="table table-hover">
	
	<tbody>
		<tr>
			<td>No : ${requestScope.evalVo.evaluationNo} </td>
		</tr>
		<tr>
			<td colspan="2">Title : ${requestScope.evalVo.evaluationTitle} </td>
			<td>Date : ${requestScope.evalVo.evaluationDate}</td>
		</tr>
		<tr>
			<td colspan="2">Writer :  ${requestScope.evalVo.employeeVO.empName}</td>
			<td>Department :
			<c:choose>
				<c:when test="${requestScope.evalVo.departmentVO.deptNo=='1'}">인사과</c:when>
				<c:when test="${requestScope.evalVo.departmentVO.deptNo=='2'}">개발과</c:when>
				<c:when test="${requestScope.evalVo.departmentVO.deptNo=='3'}">영업과</c:when>
				<c:when test="${requestScope.evalVo.departmentVO.deptNo=='4'}">경리과</c:when>
				<c:when test="${requestScope.evalVo.departmentVO.deptNo=='5'}">지원과</c:when>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<pre>${requestScope.evalVo.evaluationContent}</pre>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3">
			<c:if test="${sessionScope.evo.positionVO.positionNo=='4'}">				
			 	 <button type="button"  id="updateBtn" class="btn btn-info">Update</button>
			</c:if>
			 <br><br>			
			 </td>
		</tr>
		</tbody>
	</table>
	</div>
	</div>
	</section></section>
