<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<section id="main-content">
          <section class="wrapper">
          <div class="showDocMargin" >
	<script type="text/javascript" >
	$(document).ready(function(){
		$("#btnForm").hide();
		if(${sessionScope.flag==null}){
					
		}else{
			$("#btnForm").show();
		}
		
		$("#sign").click(function() {
			if(confirm("결재하시겠습니까?")){
				location.href="${initParam.root}doc_sign.do?docNo=${dvo.docNo}";
			}
			
		});
		$("#return").click(function() {
			if(confirm("반려하시겠습니까?")){
			location.href="${initParam.root}doc_return.do?docNo=${dvo.docNo }";
			}
		});
		
		
	});
	
	</script>
	
<div class="content-panel" align="center">
<table id="showDoc1" >
	<tr></tr>
	<tr align="right">
	<td colspan="4">
			<div id="signDiv">
				<table id="showDoc" border="1" >
				<thead>
				<tr>
				<c:forEach items="${requestScope.positionList}" var="p">
				<td width="50" align="center">${p}</td>
				</c:forEach>
				</tr>
				</thead>
				<tbody>			
					<tr height="50">
						
						<c:forEach items="${requestScope.signList}" var="s">
							<td>
							<c:choose>
							<c:when test="${s == '0'}">
								&nbsp;
							</c:when>
							<c:otherwise>
							 <img src="${initParam.root }upload/sign/${s}" height="30" width="30">
							</c:otherwise>
							</c:choose>
							</td>
						</c:forEach>
					</tbody>		
				</table> 
		</div>
		</td>
	</tr>
	<tr align="center">
		<td colspan="4"><h1>공&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</h1></td>
	</tr>
	<tr>
		<td colspan="4">결재번호 :  ${requestScope.dvo.docNo }</td>
	
		
	</tr><tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : ${requestScope.dvo.title }</td>
	
	</tr><tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4">공문내용 : ${requestScope.dvo.content }</td>
	</tr>
		<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4" >첨&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부 : 
		<c:choose>
		<c:when test="${requestScope.dvo.path=='1'}">
			No File
		</c:when>
		<c:otherwise>
		<a href="${initParam.root }fileDownload.do?fileName=${requestScope.dvo.path}" >${requestScope.dvo.path }</a>
		</c:otherwise>	
		</c:choose>
		</td>
	</tr><tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="4">작&nbsp;&nbsp;성&nbsp;&nbsp;일&nbsp; : ${requestScope.dvo.timePosted }</td>
	</tr><tr><td>&nbsp;</td></tr>
	<tr>
	<td colspan="4">작&nbsp;&nbsp;성&nbsp;&nbsp;자&nbsp; : ${requestScope.dvo.employeeVO.empName }</td>

	</tr><tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>


</table>
 </div>
 <br><br>
	<center>
		<form id="btnForm" >
				<input type="button" id="sign" class="btn btn-primary" value="결재">&nbsp;&nbsp;&nbsp;
				<input type="button" id="return" class="btn btn-danger" value="반려">	
		</form>
	</center>


	</div>
	</section></section>

