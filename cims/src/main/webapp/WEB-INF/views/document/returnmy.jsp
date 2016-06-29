<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="main-content">
          <section class="wrapper">
<h3><i class="fa fa-angle-right"></i> Returned Docunemt Written By Me</h3><hr><br>
       <div class="marginMain">
<script type="text/javascript">
	$(document).ready(function(){
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
		
		$("#returnMySearchBtn").click(function(){	
	    	var data=$("#returnMySearchText").val();
	       location.href="${initParam.root}doc_returnMySearch.do?page=1&data="+data;
	     });//click
	});	
</script>
<!-- 내가쓴것중 반려된 -->
<button class="btn btn-primary" id="myDocBtn">
<i class="fa fa-user" ></i>
</button>      
<!-- 내가결재했는데 반려된 공문 -->
<button class="btn btn-warning" id="mySignBtn">
<i class="fa fa-check"></i>
</button> 
<!-- 내가반려한 공문 -->
<button class="btn btn-danger" id="myReturnBtn">
<i class="fa fa-times" ></i>
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
		<c:forEach items="${requestScope.returnMy.list}" var="dvo">
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
	<input type="button" id="returnMainBtn" class="btn btn-primary" value="main page">
</div>
<div align="center">
	<input type="text"  id="returnMySearchText" class="form-control" placeholder="Enter your search word" style="width: 400px">
	<button class="btn btn-primary" id="returnMySearchBtn" value="Search" style="width: 50px; height: 32px">
	<i class="fa fa-search"></i></button>
</div>
<br>	
	<c:choose >
	<c:when test="${returnMy.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}doc_returnMy.do?page=${returnMyList.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">이전</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${returnMy.pagingBean.startPageOfPageGroup}" end="${returnMy.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}doc_returnMy.do?page=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${returnMy.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}doc_returnMy.do?page=${returnMy.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">다음</a>
		</c:when>
	</c:choose>
	<br><br>	
</div></div>
</section></section>














