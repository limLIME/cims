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
		$("#myDocBtn").mouseover(function(){
			$("#myDocBtnSpan").html("내가 쓴것 중 반려된 공문");
		}).mouseout(function(){
			$("#myDocBtnSpan").html("");
		});
		$("#mySignBtn").mouseover(function(){
			$("#mySignBtnSpan").html("내가 결제 했는데 반려된 공문");
		}).mouseout(function(){
			$("#mySignBtnSpan").html("");
		});
		$("#myReturnBtn").mouseover(function(){
			$("#myReturnBtnSpan").html("내가 반려 한 공문");
		}).mouseout(function(){
			$("#myReturnBtnSpan").html("");
		});
		$("#myDocBtn").click(function(){
			location.href="${initParam.root}doc_returnMy.do?page=1";
		});
		$("#mySignBtn").click(function(){
			location.href="${initParam.root}doc_returnSign.do?page=1";
		});
		$("#myReturnBtn").click(function(){
			location.href="${initParam.root}doc_returnList.do?page=1";
		});
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
       <div align="left">&nbsp;&nbsp;&nbsp;
       <span id = "myDocBtnSpan" class="label label-default"></span>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id = "mySignBtnSpan"  class="label label-default"></span>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id = "myReturnBtnSpan"  class="label label-default"></span><br>
<!-- 내가 쓴것중 반려된 것" -->
&nbsp;&nbsp;<button class="btn btn-primary" id="myDocBtn">
<i class="fa fa-user" ></i>
</button>      
<!-- 내가결재했는데 반려된 공문 -->
<button class="btn btn-warning" id="mySignBtn">
<i class="fa fa-check" ></i>
</button> 
<!-- 내가반려한 공문 -->
<button class="btn btn-danger" id="myReturnBtn" >
<i class="fa fa-times" ></i>
</button> 
</div>
<br> 

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
		<c:forEach items="${requestScope.returnMainSearchList.list}" var="dvo">
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
	<input type="button" id="returnMainBtn" class="btn btn-info" value="main page">&nbsp;&nbsp;&nbsp;
</div>

<br>	
	<c:choose >
	<c:when test="${returnMainSearchList.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}doc_returnMainSearch.do?page=${returnMainSearchList.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">이전</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${returnMainSearchList.pagingBean.startPageOfPageGroup}" end="${returnMainSearchList.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}doc_returnMainSearch.do?page=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${returnMainSearchList.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}doc_returnMainSearch.do?page=${returnMainSearchList.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">다음</a>
		</c:when>
	</c:choose>
	<br>	<br>
	<div align="center">
	<input type="text"  id="returnMainSearchText" placeholder="Enter your search word" style="width: 200px">
	<button class="btn btn-primary" id="returnMainSearchBtn" value="Search" style="width: 50px; height: 25px">
	<i class="fa fa-search"></i></button>
</div>
	<br>	
</div>
</div>



</section></section>













