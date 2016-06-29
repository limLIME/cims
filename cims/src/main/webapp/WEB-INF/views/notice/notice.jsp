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

function noticeWrite(){
	location.href="${initParam.root}notice_write.do";
}

$(document).ready(function(){
$("#searchButton").click(function(){   
	 var search=$("#search").val();
	 var searchVar=$("#searchVar").val();
	 
	 location.href="noticeSearchList.do?search="+search+"&searchVar="+searchVar+"&pageNo=1";
	});
});
</script>

</head>
<body>
  <section id="main-content">
  <section class="wrapper">
   <h3>&nbsp;<i class="fa fa-angle-right">&nbsp;</i>Notice</h3>
  <hr>
  <div class="marginMain">
	<%-- <jsp:include page=""></jsp:include> --%>
	<table class="table table-striped table-advance table-hover">
		<thead>
		<tr>
			<th class="no">#NO</th>
			<th class="title">Title</th>
			<th class="name">Writer</th>
			<th class="date">Date</th>
			</tr>
		</thead>
		<tbody>			
		<c:forEach var="lvo" items="${requestScope.lvo.list}">				
			<tr>
			    <td>${lvo.noticeNo }</td>				
				<td>
				<c:choose>
				<c:when test="${sessionScope.evo!=null}">
				<a href="${initParam.root}notice_showContent.do?no=${lvo.noticeNo }">
				${lvo.noticeTitle}</a>
				 &nbsp;<c:if test="${today == lvo.noticeDate}"><img src="${initParam.root}assets/img/newMark.jpg"></c:if>
				</c:when>
				<c:otherwise>
				${lvo.noticeTitle}
				 &nbsp;<c:if test="${today == lvo.noticeDate}"><img src="${initParam.root}assets/img/newMark.jpg"></c:if>
				</c:otherwise>
				</c:choose>
				</td>
				<td>관리자</td>
				<td>${lvo.noticeDate}</td>
			</tr>	
			</c:forEach>
		</tbody>					
	</table>
	<div align="right">
	<c:if test="${sessionScope.evo.positionVO.positionNo=='100'}">
	<input type="button" class="btn btn-info" value="Write" onclick="noticeWrite()">
	</c:if>
	</div>
<p class="paging" align="center">
	<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
	<c:set var="pb" value="${requestScope.lvo.pagingBean2}"></c:set>
	
	<c:choose>
	<c:when test="${sessionScope.map.searchVar == null}">
	
	<c:if test="${pb.previousPageGroup}">
	<a href="notice_notice.do?pageNo=${pb.startPageOfPageGroup-1}">
	<!-- <img src="img/left_arrow_btn.gif"> -->
	◀&nbsp; </a>	
	</c:if>


	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<a href="notice_notice.do?pageNo=${i}">${i}</a> 
	</c:when>
	<c:otherwise>
	${i}
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>	 


	<c:if test="${pb.nextPageGroup}">
	<a href="notice_notice.do?pageNo=${pb.endPageOfPageGroup+1}">
	▶<!-- <img src="img/right_arrow_btn.gif"> --></a>
	</c:if>
	</c:when>
	<c:otherwise>
	
		 <c:if test="${pb.previousPageGroup}">
               <a href="${initParam.root}noticeSearchList.do?pageNo=${pb.startPageOfPageGroup-1}&search=${sessionScope.map.search}&searchVar=${sessionScope.map.searchVar}">◀</a>  
            </c:if>
   
            <c:forEach begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}" var="i">
                <c:choose>
                   <c:when test="${pb.nowPage==i}">
                     ${i}
                  </c:when>
                  <c:otherwise>
                     <a href="${initParam.root}noticeSearchList.do?pageNo=${i}&search=${sessionScope.map.search}&searchVar=${sessionScope.map.searchVar}">${i}</a>
                  </c:otherwise>
               </c:choose>
         </c:forEach>

            <c:if test="${pb.nextPageGroup}">
                  <a href="${initParam.root}noticeSearchList.do?pageNo=${pb.startPageOfPageGroup+1}&search=${sessionScope.map.search}&searchVar=${sessionScope.map.searchVar}">▶</a>
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








