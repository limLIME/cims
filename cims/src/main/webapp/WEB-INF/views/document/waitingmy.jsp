<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
내가쓴것 중 결재중인문서

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
		<c:forEach items="${requestScope.waitingMy.list}" var="dvo">
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
	<c:choose >
	<c:when test="${waitingMy.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}doc_waitingMy.do?page=${waitingMy.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">이전</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${waitingMy.pagingBean.startPageOfPageGroup}" end="${waitingMy.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}doc_waitingMy.do?page=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${waitingMy.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}doc_waitingMy.do?page=${waitingMy.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">다음</a>
		</c:when>
	</c:choose>
	<br><br>	
