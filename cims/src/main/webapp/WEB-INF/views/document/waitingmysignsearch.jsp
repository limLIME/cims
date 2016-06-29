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
    
<section id="main-content">
          <section class="wrapper">
<h3>&nbsp;<i class="fa fa-angle-right"></i> Waiting My Sign</h3><hr><br>

<script type="text/javascript">
	$(document).ready(function(){
		$("#myDocBtn").click(function(){
			location.href="${initParam.root}doc_waitingMy.do?page=1";
		});
		$("#mySignBtn").click(function(){
			location.href="${initParam.root}doc_waiting.do?page=1";
		});
		$("#waitingMySignBtn").click(function(){
			location.href="${initParam.root}doc_waitingMySign.do?page=1";
		});
		
		$("#waitingMainBtn").click(function(){
			location.href="${initParam.root}doc_waitingMain.do?page=1";
		});
		
		$("#waitingMySignSearchBtn").click(function(){	
	    	var data=$("#waitingMySignSearchText").val();
	       location.href="${initParam.root}doc_waitingMySignSearch.do?page=1&data="+data;
	     });//click
	});
</script>
      <div class="marginMain">
<!-- 내가 쓴것중 아직결제중 -->
<button class="btn btn-primary" id="myDocBtn">
<i class="fa fa-user" ></i>
</button>      
<!-- 내가결재했는데 아직 결재중 -->
<button class="btn btn-warning" id="mySignBtn">
<i class="fa fa-check" ></i>
</button> 
<!-- 내가 결재해야할 목록 -->
<button class="btn btn-success" id="waitingMySignBtn" >
<i class="fa fa-spinner" ></i>
</button> 

<br><br>  

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
		<c:forEach items="${requestScope.waitingMySignSearchList.list}" var="dvo">
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
<br>
<div align="right">
	<input type="button" id="waitingMainBtn" class="btn btn-primary" value="main page">
</div>
<div align="center">
	<input type="text"  id="waitingMySignSearchText" class="form-control" placeholder="Enter your search word" style="width: 400px">
	<button class="btn btn-primary" id="waitingMySignSearchBtn" value="Search" style="width: 50px; height: 32px">
	<i class="fa fa-search"></i></button>
</div>
<br>
	<c:choose >
	<c:when test="${waitingMySignSearchList.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}doc_waitingMySignSearch.do?page=${waitingMySignSearchList.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">이전</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${waitingMySignSearchList.pagingBean.startPageOfPageGroup}" end="${waitingMySignSearchList.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}doc_waitingMySignSearch.do?page=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${waitingMySignSearchList.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}doc_waitingMySignSearch.do?page=${waitingMySignSearchList.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">다음</a>
		</c:when>
	</c:choose>
	<br><br>	
	</div></div>
	</section></section>
    