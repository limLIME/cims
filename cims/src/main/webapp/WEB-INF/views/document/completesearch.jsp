<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$(document).ready(function(){
		$("#myDocBtn").mouseover(function(){
			$("#myDocBtnSpan").html("내가 작성 한 공문 중 완료 된 것");
		}).mouseout(function(){
			$("#myDocBtnSpan").html("");
		});
		$("#mySignBtn").mouseover(function(){
			$("#mySignBtnSpan").html("내가 결제 한 공문 중 완료 된 것");
		}).mouseout(function(){
			$("#mySignBtnSpan").html("");
		});
		$("#myCompleteBtn").mouseover(function(){
			$("#myCompleteBtnSpan").html("내가 완료시킨 공문");
		}).mouseout(function(){
			$("#myCompleteBtnSpan").html("");
		});
		$("#myDocBtn").click(function(){
			location.href="${initParam.root}doc_completeMy.do?page=1";
		});
		$("#mySignBtn").click(function(){
			location.href="${initParam.root}doc_complete.do?page=1";
		});
		$("#myCompleteBtn").click(function(){
			location.href="${initParam.root}doc_completeSign.do?page=1";
		});
		
		$("#completeMainBtn").click(function(){
			location.href="${initParam.root}doc_completeMain.do?page=1";
		});
		
		$("#completeSearchBtn").click(function(){	
	    	var data=$("#completeSearchText").val();
	       location.href="${initParam.root}doc_completeSearch.do?page=1&data="+data;
	     });//click
	});	
</script>
<section id="main-content">
          <section class="wrapper">
<h3><i class="fa fa-angle-right"></i> Complete Document And I'm Signed</h3><hr><br>
<div class="marginMain">
<div class="content-panel" align="center">
<div align="left">&nbsp;&nbsp;&nbsp;
             <span id = "myDocBtnSpan" class="label label-default"></span>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id = "mySignBtnSpan"  class="label label-default"></span>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span id = "myCompleteBtnSpan"  class="label label-default"></span><br>
<!-- 내가 작성했고 완료된공문" -->
&nbsp;&nbsp;<button class="btn btn-primary" id="myDocBtn">
<i class="fa fa-user" ></i>
</button>      
<!-- 내가 결재한것중 완료된공문 -->
<button class="btn btn-warning" id="mySignBtn">
<i class="fa fa-check" ></i>
</button> 
<!-- 내가 완료시킨 공문 -->
<button class="btn btn-success" id="myCompleteBtn" >
<i class="fa fa-circle-o" ></i>
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
		<c:forEach items="${requestScope.completeSearchList.list}" var="dvo">
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
	<input type="button" id="completeMainBtn" class="btn btn-info" value="main page">&nbsp;&nbsp;&nbsp;
</div>

<br>
	<c:choose >
	<c:when test="${completeSearchList.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}doc_completeSearch.do?page=${completeSearchList.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">이전</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${completeSearchList.pagingBean.startPageOfPageGroup}" end="${completeSearchList.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}doc_completeSearch.do?page=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${completeSearchList.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}doc_completeSearch.do?page=${completeSearchList.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">다음</a>
		</c:when>
	</c:choose>
	<br>	<br>
	<div align="center">
	<input type="text"  id="completeSearchText" placeholder="Enter your search word" style="width: 200px">
	<button class="btn btn-primary" id="completeSearchBtn" value="Search" style="width: 50px; height: 25px">
	<i class="fa fa-search"></i></button>
</div>
	<br>	
	</div></div>
</section></section>