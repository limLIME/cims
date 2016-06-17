<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <jsp:useBean id="now" class="java.util.Date" />
  <fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />
  <body>  
  <section id="main-content">
  <section class="wrapper">
<h3>건의사항</h3>
<table border="1">
   <tr>
      <th width = "15%">NO</th><th width = "25%">제목</th><th width = "15%">이름</th><th width = "15%">작성일</th>
   </tr>
   <c:forEach items="${requestScope.list.list }" var="l">
      <tr>
         <td>${l.recNo }
         	       <c:if test="${today == l.recDate }">
				new
			</c:if>
         </td>
         
         <td><a href = "rec_showContent.do?no=${l.recNo}">${l.recTitle }</a></td><td>${l.employeeVO.empName}</td><td>${l.recDate }</td>
      </tr>
   </c:forEach>
</table>
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
<br><br><br><br><br>
<a href = "${initParam.root }rec_writer.do">글쓰기</a>
</section>
</section>
</body>
