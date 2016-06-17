<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<section id="main-content">
          <section class="wrapper">
	<script type="text/javascript" >
	$(document).ready(function(){
	var state="${dvo.state}";
	var position=${sessionScope.evo.positionVO.positionNo};
	
/* 
	 if(state!='결재중'|| position<3){
			$("#btnForm").hide();
		}  */
		
		
		$("#sign").click(function() {
			if(confirm("결재하시겠습니까?")){
				location.href="${initParam.root}doc_sign.do?docNo=${dvo.docNo}&approver="+$("#nextSign").val();
			}
			 alert($("#nextSign").val()); 
		});
		$("#return").click(function() {
			location.href="${initParam.root}doc_return.do?docNo=${dvo.docNo }";
		});
		
		
	});
	
	</script>
<link rel="stylesheet" type="text/css"
	href="${initParam.root}resources/css/boot.css">


<table id="showDoc" border="1">
	
	<tr align="right">
	<td colspan="4">
			<div id="signDiv">
				<table id="showDoc" border="1">
					<tr>
						<td>과장</td>
						<td>부장</td>
						<td>사장</td>
					</tr>
					<tr>
						<td>
					<c:choose>
					<c:when test="${dvo.sign1 == null}">
					&nbsp;
					</c:when>
					<c:otherwise>
					<img src="${initParam.root }upload/sign/${dvo.sign1 }" height="30" width="30">
					</c:otherwise>
					</c:choose>
						
						</td>
						<td>
						<c:choose>
					<c:when test="${dvo.sign2 == null}">
					&nbsp;
					</c:when>
					<c:otherwise>
					<img src="${initParam.root }upload/sign/${dvo.sign2 }"  height="30" width="30">
					</c:otherwise>
					</c:choose>
						</td>
						<td>
						<c:choose>
					<c:when test="${dvo.sign3 == null}">
					&nbsp;
					</c:when>
					<c:otherwise>
					<img src="${initParam.root }upload/sign/${dvo.sign3 }"  height="30" width="30">
					</c:otherwise>
					</c:choose>
						</td>
					</tr>
				</table>
		</div>
		</td>
	</tr>
	<tr align="center">
		<td colspan="4"><h2>공 문</h2></td>
	</tr>
	<tr>
		<td>결재번호 </td>
		<td colspan="3">${dvo.docNo }</td>
		
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">${dvo.title }</td>
	</tr>
	<tr>
		<td colspan="4">공문내용<br> ${dvo.content }</td>
	</tr>
	<tr>
		<td colspan="4" >첨부 : 
		
		<a href="${initParam.root }fileDownload.do?fileName=${dvo.path}" ><font color="blue">${dvo.path }</font></a>

		</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td colspan="3">${dvo.timePosted }</td>
	</tr>
	<tr>
	<td>작성자</td>
	<td colspan="3">${dvo.employeeVO.empName }</td>
	</tr>
	<tr>
	<td>다음결재자</td>
	<td colspan="3">
			<div id="next">
				<select id="nextSign">
				<c:if test="${requestScope.list!=null }">
				<c:forEach items="${requestScope.list }" var="next">
				<option value="${next.empNo }">${next.departmentVO.deptName } ${next.positionVO.positionName } ${next.empName }</option>
				</c:forEach>
				</c:if>
				</select>
			</div>
		</td>
	</tr>

 
			

</table>
	<form id="btnForm" >
		<input type="button" id="sign" value="결재"> 
	<input type="button" id="return" value="반려">	
	</form>

	</section></section>

