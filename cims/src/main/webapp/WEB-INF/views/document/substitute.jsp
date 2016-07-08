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
$(document).ready(function() {
	$("#noSubstitute").click(function() {
		location.href="${initParam.root}doc_updateSubstitute.do?SubNo="+null;
	});
	$(".sss").click(function() {
		var emp=$(this).text();
		location.href="${initParam.root}doc_updateSubstitute.do?subNo="+emp.substring(emp.indexOf("(")+1,emp.indexOf(")")).trim();
	});
	
	
});
</script>
    
    
<section id="main-content">
 <section class="wrapper">
 <div class="marginMain">

<div class="content-panel" align="center">
<h3 align="left">&nbsp;<i class="fa fa-angle-right"></i> Select Substitute</h3><hr>
<h4 align="left">&nbsp;<i class="fa fa-angle-right"></i> My Substitute</h4>

<div class="btn btn-success">
${sessionScope.evo.departmentVO.deptName }<br>
${sessionScope.evo.positionVO.positionName} ${sessionScope.evo.empName}<br>
( ${sessionScope.evo.empNo} )
</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<c:choose>
<c:when test="${requestScope.mysub==null}">
<div class="btn btn-warning" >
&nbsp;<br>
대행자 없음<br>
&nbsp;
</div>
</c:when>
<c:otherwise>
<div class="btn btn-primary"  >
${requestScope.mysub.departmentVO.deptName }<br>
${requestScope.mysub.positionVO.positionName} ${requestScope.mysub.empName}<br>
( ${requestScope.mysub.empNo} )
</div>
</c:otherwise>
</c:choose>



<hr>
<h4 align="left">&nbsp;<i class="fa fa-angle-right"></i> Substitute List</h4>
<div class="btn btn-warning" id="noSubstitute">
&nbsp;<br>
대행자 없음<br>
&nbsp;
</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<c:forEach items="${requestScope.sub}" var="subVO" varStatus="i">

<c:if test="${i.count%4==0 }"><br><br><br></c:if>
<div class="btn btn-primary sss" >
${subVO.departmentVO.deptName } <br>
${subVO.positionVO.positionName } ${subVO.empName }  <br>
( ${subVO.empNo } ) 
</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


</c:forEach>

<br><br>

	</div></div>
</section></section>