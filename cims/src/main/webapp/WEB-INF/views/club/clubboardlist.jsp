<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    
<script type="text/javascript">
	$(document).ready(function(){
		
/* 		$("#clubBoardListBtn").click(function(){
			location.href="${initParam.root}club_boardList.do?page=1";
		}); */
		
			$("#clubBoardWriteBtn").click(function(){	
		       location.href="${initParam.root}club_boardwriteform.do";
		     });//click
	});	
</script>
<section id="main-content">
<section class="wrapper">
<br><br><br><br><br>
<div class="marginMain">
<div class="content-panel" align="center">
<table class="table table-striped table-advance table-hover">
	<thead>
		<tr>
			<th><h3><i class="fa fa-angle-right"></i> Club Board List</h3></th>
		</tr>
	</thead>
	<tbody>
	<tr>
	<td>
		<table class="table table-striped table-advance table-hover">
	<thead>
		<tr>
			<th>Title</th>
			<th>Club Name</th>
			<th>D-Day</th>
			<th>Number of participants</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.clubBoardList.list}" var="list">
			<tr>
				<td><a href="${initParam.root }club_boardshowcontent.do?no=${list.clubBoardNo}">${list.clubBoardTitle}</a></td>
				<td>${list.clubVO.clubName}</td>
				<td>${list.clubBoardDate}</td>
				<td>${list.clubBoardMember} / ${list.clubBoardMaxPeople}</td>
			</tr>
		</c:forEach>
	</tbody>	
</table>
</td>
</tr>
</tbody>
</table>
<br>
<div align="left">
	<c:if test="${!requestScope.clist.isEmpty()}">
	&nbsp;&nbsp;<input type="button" id="clubBoardWriteBtn" class="btn btn-primary" value="write">
	</c:if>
	<%-- <c:choose>
	<c:when test="${requestScope.clist.isEmpty()}">
	 &nbsp;&nbsp;<input type="button" id="clubBoardListBtn" class="btn btn-primary" value="main page">
	</c:when>
	<c:otherwise>
	 <input type="button" id="clubBoardListBtn" class="btn btn-success" value="main">
	</c:otherwise>
	</c:choose> --%>
</div>
<br>
	<c:choose >
	<c:when test="${clubBoardList.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}club_boardList.do?page=${clubBoardList.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">이전</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${clubBoardList.pagingBean.startPageOfPageGroup}" end="${clubBoardList.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}club_boardList.do?page=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${clubBoardList.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}clubboardList.do?page=${clubBoardList.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">다음</a>
		</c:when>
	</c:choose>
	<br><br>	
	</div></div>
</section></section>