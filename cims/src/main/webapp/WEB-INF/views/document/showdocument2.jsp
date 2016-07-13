<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<section id="main-content">
          <section class="wrapper">
          <div class="showDocMargin" >
	
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
				<td width="70" align="center">${p}</td>
				</c:forEach>
				</tr>
				</thead>
				<tbody>			
					<tr height="70">
						
						<c:forEach items="${requestScope.signList}" var="s">
							<td align="center">
							<c:choose>
							<c:when test="${s == '0'}">
								&nbsp;
							</c:when>
							<c:otherwise>
							 <img src="${initParam.root }upload/sign/${s}" height="60" width="60">
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
	<td colspan="4">작&nbsp;&nbsp;성&nbsp;&nbsp;자&nbsp; :  ${requestScope.dvo.employeeVO.departmentVO.deptName} ${requestScope.dvo.employeeVO.positionVO.positionName} ${requestScope.dvo.employeeVO.empName } (${requestScope.dvo.employeeVO.empNo })</td>

	</tr><tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>


</table>
 </div>
 </div>
	</section></section>

