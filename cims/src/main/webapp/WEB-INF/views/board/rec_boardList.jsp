<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <jsp:useBean id="now" class="java.util.Date" />
  <fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />
       <script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#button").click(function(){ 
			var search = $("#search").val();
			var searchVar = $("#searchVar").val();
			
			location.href = "recBoardSearchList.do?search="+search+"&searchVar="+searchVar+"&pageNo=1";				
		});
});	
	function recWrite() {
		location.href = "${initParam.root }rec_writer.do";
	}
</script>
  <body>  
  <section id="main-content">
  <section class="wrapper">
 <h3>&nbsp;<i class="fa fa-angle-right">&nbsp;</i>Recommendation Board</h3>
<hr>
<div class = "marginMain">
<table class = "table table-striped table-advance table-hover">
   <tr>
      <th width = "15%">NO</th><th width = "25%">Title</th><th width = "15%">Writer</th><th width = "15%">Date</th>
   </tr>	
   <c:forEach items="${requestScope.list.list }" var="l">
      <tr>
         <td>${l.recNo }</td>
         <td><a href = "rec_showContent.do?no=${l.recNo}">${l.recTitle }</a>
               	       <c:if test="${today == l.recDate }">
					&nbsp;<img src="${initParam.root }/img/newMark.jpg">
			</c:if>
         </td><td>${l.employeeVO.empName}</td><td>${l.recDate }</td>
      </tr>
   </c:forEach>
</table>
<br><br>
<div align="right">
	   <input type="button" class="btn btn-info" value="Write" onclick="recWrite()">
</div>
<p class = "paging" align="center">

	<c:choose>
	<c:when test="${sessionScope.map.searchVar == null || sessionScope.map.searchVar == ''}">
	<c:if test="${list.pagingBean.previousPageGroup}">
         <a href="${initParam.root}rec_boardList.do?pageNo=${list.pagingBean.startPageOfPageGroup-1}"><img src="${initParam.root }img/left_arrow_btn.gif"></a>  
   </c:if>
   
   <c:forEach begin="${list.pagingBean.startPageOfPageGroup}" end="${list.pagingBean.endPageOfPageGroup}" var="i">
   		 <c:choose>
   		 	<c:when test="${list.pagingBean.nowPage==i}">
         		${i}
         	</c:when>
         	<c:otherwise>
         		<a href="${initParam.root}rec_boardList.do?pageNo=${i}">${i}</a>
         	</c:otherwise>
         </c:choose>
   </c:forEach>

      <c:if test="${list.pagingBean.nextPageGroup}">
         <a href="${initParam.root}rec_boardList.do?pageNo=${list.pagingBean.endPageOfPageGroup+1}"><img src="img/right_arrow_btn.gif"></a>
      </c:if>
      </c:when>
      
      
      <c:otherwise>
      	<c:if test="${list.pagingBean.previousPageGroup}">
         <a href="${initParam.root}recBoardSearchList.do?pageNo=${list.pagingBean.startPageOfPageGroup-1}&search=${sessionScope.map.search}&searchVar=${sessionScope.map.searchVar}"><img src="${initParam.root }img/left_arrow_btn.gif"></a>  
   </c:if>
   
   <c:forEach begin="${list.pagingBean.startPageOfPageGroup}" end="${list.pagingBean.endPageOfPageGroup}" var="i">
   		 <c:choose>
   		 	<c:when test="${list.pagingBean.nowPage==i}">
         		${i}
         	</c:when>
         	<c:otherwise>
         		<a href="${initParam.root}recBoardSearchList.do?pageNo=${i}&search=${sessionScope.map.search}&searchVar=${sessionScope.map.searchVar}">${i}</a>
         	</c:otherwise>
         </c:choose>
   </c:forEach>

      <c:if test="${list.pagingBean.nextPageGroup}">
         <a href="${initParam.root}recBoardSearchList.do?pageNo=${list.pagingBean.startPageOfPageGroup+1}&search=${sessionScope.map.search}&searchVar=${sessionScope.map.searchVar}"><img src="img/right_arrow_btn.gif"></a>
      </c:if>
      
      </c:otherwise>
      </c:choose>
      </p>
        <div align="center">
	    <select id = "search">
    	   <option value="title">제목</option>
		   <option value = "content">내용</option>
		   <option value = "titleContent">제목+내용</option>
    	</select>
    	<input type = "text" id = "searchVar">
	    <button class="btn btn-primary" id="button" value="Search" style="width: 50px; height: 25px">
	    <i class="fa fa-search"></i></button>
	</div>

      </div>
</section>
</section>
</body>
