<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#myDocBtn").click(function(){
			location.href="${initParam.root}doc_completeMy.do?page=1";
		});
		$("#mySignBtn").click(function(){
			location.href="${initParam.root}doc_complete.do?page=1";
		});
		$("#myCompleteBtn").click(function(){
			location.href="${initParam.root}doc_completeSign.do?page=1";
		});
	});	
</script>
내가 결재한 문서 중  결재완료 문서<br>
<input type="button" id="myDocBtn" value="내가 작성했고 완료된공문">
<input type="button" id="mySignBtn" value="내가 결재한것중 완료된공문">
<input type="button" id="myCompleteBtn" value="내가 완료시킨 공문">
<script type="text/javascript">

</script>
<table border="1">
	<thead>
		<tr>
			<th>일련 번호</th>
			<th>공문 제목</th>
			<th>작성자</th>
			<th>작성 일자</th>
			<th>결재 상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.complete.list}" var="dvo">
			<tr>
				<td>${dvo.docNo}</td>
				<td><a href="${initParam.root }doc_showdocument.do?docNo=${dvo.docNo}">${dvo.title}</a></td>
				<td>${dvo.employeeVO.empName }</td>
				<td>${dvo.timePosted}</td>
				<td>${dvo.state}</td>
			</tr>
		</c:forEach>
	</tbody>	
</table>
<br><br>
	<c:choose >
	<c:when test="${complete.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}doc_completeList.do?page=${complete.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">이전</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${complete.pagingBean.startPageOfPageGroup}" end="${complete.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}doc_completeList.do?page=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${complete.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}doc_completeList.do?page=${complete.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">다음</a>
		</c:when>
	</c:choose>
	<br><br>	
