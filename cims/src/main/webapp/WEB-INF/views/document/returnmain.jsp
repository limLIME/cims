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
			$("#returnMainBtn").click(function(){
			location.href="${initParam.root}doc_returnMain.do?page=1";
		});
		
		$("#returnMainSearchBtn").click(function(){	
	    	var data=$("#returnMainSearchText").val();
	       location.href="${initParam.root}doc_returnMainSearch.do?page=1&data="+data;
	     });//click 
	});	
</script>
<section id="main-content">
          <section class="wrapper">
 <h3><i class="fa fa-angle-right"></i> Returned Docunemt Main</h3><hr><br>
       <div class="marginMain">
<div class="content-panel" align="center">

<table class="table table-striped table-advance table-hover">
	<thead>
		<tr>
			<th>#No</th>
			<th>Title</th>
			<th>Writer</th>
			<th>TimePosted</th>
			<th>Document State</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.returnMain.list}" var="dvo">
			<tr>
				<td>${dvo.docNo}</td>
				<td><a href="${initParam.root }doc_showdocument2.do?docNo=${dvo.docNo}">${dvo.title}</a></td>
				<td>${dvo.employeeVO.empName }</td>
				<td>${dvo.timePosted}</td>
				<td style="font-weight: bold;">
				<c:choose>
				<c:when test="${dvo.state=='반려'}">
				<font color="red">${dvo.state}</font>
				</c:when>
				<c:when test="${dvo.state=='결재완료'}">
				<font color="#52E252">${dvo.state}</font>
				</c:when>
				<c:otherwise>
				<font color="blue" >${dvo.state}</font>
				</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</c:forEach>
	</tbody>	
</table>
<br>
<div align="right">
	<input type="button" id="returnMainBtn" class="btn btn-info" value="main page">&nbsp;&nbsp;&nbsp;
</div>

<div>	
	<c:choose >
	<c:when test="${returnMain.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}doc_returnMain.do?page=${returnMyList.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">◀</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${returnMain.pagingBean.startPageOfPageGroup}" end="${returnMain.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}doc_returnMain.do?page=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${returnMain.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}doc_returnMain.do?page=${returnMain.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">▶</a>
		</c:when>
	</c:choose>
</div>
	<br>	<br>
	<div align="center">
	<input type="text"  id="returnMainSearchText"  placeholder="Enter your search word" style="width: 200px">
	<button class="btn btn-primary" id="returnMainSearchBtn" value="Search" style="width: 50px; height: 25px">
	<i class="fa fa-search"></i></button>
</div>
	<br>	
</div>
</div>



</section></section>














