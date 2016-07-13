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
		$("#waitingSubstituteBtn").click(function(){
			location.href="${initParam.root}doc_waitingSubstitute.do?page=1";
		});
		
		$("#waitingSubstituteSearchBtn").click(function(){	
	    	var data=$("#waitingSubstituteSearchText").val();
	       location.href="${initParam.root}doc_waitingSubstituteSearch.do?page=1&data="+data;
	     });//click
	});	
</script>


<section id="main-content">
          <section class="wrapper">
<h3><i class="fa fa-angle-right"></i> Waiting Substitute Sign</h3><hr><br>
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
		<c:forEach items="${requestScope.waitingSubstitute}" var="dvo">
			<tr>
				<td>${dvo.docNo}</td>
				<td><a href="${initParam.root }doc_showdocument3.do?docNo=${dvo.docNo}">${dvo.title}</a></td>
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
	<input type="button" id="waitingSubstituteBtn" class="btn btn-info" value="main page">&nbsp;&nbsp;&nbsp;
</div>
<br>
	<div align="center">
	<input type="text"  id="waitingSubstituteSearchText"  placeholder="Enter your search word" style="width: 200px">
	<button class="btn btn-primary" id="waitingSubstituteSearchBtn" value="Search" style="width: 50px; height: 25px">
	<i class="fa fa-search"></i></button>
</div>
	<br>	
	</div></div>
	</section></section>
    