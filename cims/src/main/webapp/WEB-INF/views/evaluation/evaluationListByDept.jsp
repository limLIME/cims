<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <jsp:useBean id="now" class="java.util.Date" />
  <fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글목록</title>
<script type="text/javascript">

function evaluationWrite(){
	location.href="${initParam.root}evaluation_write.do";
}

$(document).ready(function(){
$("#searchButton").click(function(){   
	 var search=$("#search").val();
	 var searchVar=$("#searchVar").val();
	 
	 location.href="${initParam.root}evaluationSearchList.do?search="+search+"&searchVar="+searchVar+"&pageNo=1";
	});
	
$("#selectDept").change(function(){
	var selectDept=$("#selectDept").val();
	if(selectDept==0)
		{
			location.href="${initParam.root}evaluation_evaluationListByDept.do?pageNo=1";
		}
	location.href="${initParam.root}evaluation_evaluationListSearchDept.do?pageNo=1&deptNo="+selectDept;
});
});


</script>

</head>
<body>
  <section id="main-content">
  <section class="wrapper">
   <h3>&nbsp;<i class="fa fa-angle-right">&nbsp;</i>Evaluation</h3>
  <hr>
  <div class="marginMain">
	<%-- <jsp:include page=""></jsp:include> --%>
	<table class="table table-striped table-advance table-hover">
		<thead>
		<tr>
			<th class="no">#NO</th>
			<th class="title">Title</th>
			<th class="name">Writer</th>
			<th class="dept">Department</th>
			<th class="date">Date</th>
		</tr>
		</thead>
		<tbody>			
		<c:forEach var="lvo" items="${requestScope.lvo.list}">		
			<tr>
			    <td>${lvo.evaluationNo}</td>				
				<td>
				<c:choose>
				<c:when test="${sessionScope.evo!=null}">
				<a href="${initParam.root}evaluation_showContent.do?no=${lvo.evaluationNo}">${lvo.evaluationTitle}</a>
				 &nbsp;<c:if test="${today == lvo.evaluationDate}"><img src="${initParam.root}assets/img/newMark.jpg"></c:if>
				</c:when>
				<c:otherwise>
				${lvo.evaluationTitle}
				 &nbsp;<c:if test="${today == lvo.evaluationDate}"><img src="${initParam.root}assets/img/newMark.jpg"></c:if>
				</c:otherwise>
				</c:choose>
				</td>
				<td>${lvo.employeeVO.empName }</td>
				<td>
				<c:choose>
				<c:when test="${lvo.departmentVO.deptNo=='1'}">인사과</c:when>
				<c:when test="${lvo.departmentVO.deptNo=='2'}">개발과</c:when>
				<c:when test="${lvo.departmentVO.deptNo=='3'}">영업과</c:when>
				<c:when test="${lvo.departmentVO.deptNo=='4'}">경리과</c:when>
				<c:when test="${lvo.departmentVO.deptNo=='5'}">지원과</c:when>
				</c:choose>
				</td>
				<td>${lvo.evaluationDate }</td>
			</tr>
			</c:forEach>
		</tbody>					
	</table>
<div align="right">
	<c:choose>
	<c:when test="${sessionScope.evo.positionVO.positionNo=='5'}">
	<select id = "selectDept">
	  <option value ="">--부서--</option>
      <option value ="1">인사과</option>
      <option value="2">개발과</option>
      <option value ="3">영업과</option>
      <option value ="4">경리과</option>
      <option value ="5">지원과</option> 
 </select>
	</c:when>
	</c:choose>
	</div>
<p class="paging" align="center">
	<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
	<c:set var="pb" value="${requestScope.lvo.pagingBean2}"></c:set>
	
	<c:choose>
	<c:when test="${sessionScope.map.searchVar == null}">
	
	<c:if test="${pb.previousPageGroup}">
	<a href="evaluation_evaluationList.do?pageNo=${pb.startPageOfPageGroup-1}">
	<!-- <img src="img/left_arrow_btn.gif"> -->
	◀&nbsp; </a>	
	</c:if>


	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<a href="evaluation_evaluationList.do?pageNo=${i}">${i}</a> 
	</c:when>
	<c:otherwise>
	${i}
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>	 


	<c:if test="${pb.nextPageGroup}">
	<a href="evaluation_evaluationList.do?pageNo=${pb.endPageOfPageGroup+1}">
	▶<!-- <img src="img/right_arrow_btn.gif"> --></a>
	</c:if>
	</c:when>
	<c:otherwise>
	
		 <c:if test="${pb.previousPageGroup}">
               <a href="${initParam.root}evaluationSearchList.do?pageNo=${pb.startPageOfPageGroup-1}&search=${sessionScope.map.search}&searchVar=${sessionScope.map.searchVar}">◀</a>  
            </c:if>
   
            <c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="i">
                <c:choose>
                   <c:when test="${pb.nowPage==i}">
                     ${i}
                  </c:when>
                  <c:otherwise>
                     <a href="${initParam.root}evaluationSearchList.do?pageNo=${i}&search=${sessionScope.map.search}&searchVar=${sessionScope.map.searchVar}">${i}</a>
                  </c:otherwise>
               </c:choose>
         </c:forEach>

            <c:if test="${pb.nextPageGroup}">
                  <a href="${initParam.root}evaluationSearchList.do?pageNo=${pb.startPageOfPageGroup+1}&search=${sessionScope.map.search}&searchVar=${sessionScope.map.searchVar}">▶</a>
            </c:if>
	
	</c:otherwise>
	
	</c:choose>
	</p>
	</div>
<div align="center">
<select id = "search">
      <option value="title">제목</option>
      <option value = "content">내용</option>
      <option value = "titleContent">제목+내용</option>
 </select>
 <input type = "text" id = "searchVar">
 <button class="btn btn-primary" id="searchButton" value="Search" style="width: 50px; height: 25px"><i class="fa fa-search"></i></button>
</div>
	</section>
	</section>
</body>
</html>








