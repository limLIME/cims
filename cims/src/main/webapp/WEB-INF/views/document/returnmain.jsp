<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

내가 관련된 반려문서 전부

반려 메인

<script type="text/javascript">
	$(document).ready(function(){
		$("#myDocBtn").click(function(){
			alert("myDocBtn");
		});
		$("#mySignBtn").click(function(){
			alert("mySignBtn");
		});
		$("#myReturnBtn").click(function(){
			alert("myReturnBtn");
		});
	});	
</script>

<input type="button" id="myDocBtn" value="내가 작성한 공문">
<input type="button" id="mySignBtn" value="내가 결재한 공문">
<input type="button" id="myReturnBtn" value="내가 반려한 공문">

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
		<c:forEach items="${requestScope.returnMain.list}" var="dvo">
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
<br></br>	
	<c:choose >
	<c:when test="${returnMain.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}doc_returnMain.do?page=${returnMyList.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">이전</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${returnMain.pagingBean.startPageOfPageGroup}" end="${returnMain.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}doc_returnMain.do?page=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${returnMain.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}doc_returnMain.do?page=${returnMain.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">다음</a>
		</c:when>
	</c:choose>
	<br><br>	
















