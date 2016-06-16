<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

메인

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
		<c:forEach items="${requestScope.mainList.list}" var="dvo">
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
	<c:when test="${mainList.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}doc_mainList.do?page=${mainList.pagingBean.startPageOfPageGroup-1}">이전</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${mainList.pagingBean.startPageOfPageGroup}" end="${mainList.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}doc_mainList.do?page=${pagelist}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${mainList.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}doc_mainList.do?page=${mainList.pagingBean.endPageOfPageGroup+1}">다음</a>
		</c:when>
	</c:choose>
	<br><br>	















