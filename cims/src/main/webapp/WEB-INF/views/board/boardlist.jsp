<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <jsp:useBean id="now" class="java.util.Date" />
  <fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />  

<body>
<h3>오늘의 인기글</h3>
<table border = "1">
	<tr>
		<th width = "15%">인기순위</th><th width="15%">NO</th><th width = "35%">제목</th><th width = "15%">작성자</th><th width="15%">좋아요</th>
	</tr>
	<c:forEach items = "${requestScope.popular}" var = "p">
	<tr>
		<td>${p.ranking}</td><td>${p.boardNo}</td><td><a href = "free_showContent.do?no=${p.boardNo}">${p.boardTitle }</a></td><td>${p.employeeVO.empName }</td><td>${p.likeCnt }</td>
	</tr>
	</c:forEach>
</table>


 <h3>게시글</h3>
<table border="1">
   <tr>
      <th width = "15%">NO</th><th width = "25%">제목</th><th width = "15%">이름</th><th width = "15%">작성일</th><th width = "10%">좋아요</th>
   </tr>
   <c:forEach items="${requestScope.list.list }" var="l">
      <tr>
         <td>${l.boardNo }
         	  <c:if test="${today == l.boardDate }">
				new
			</c:if>
          </td>
         <td><a href = "free_showContent.do?no=${l.boardNo}">${l.boardTitle }</a></td><td>${l.employeeVO.empName}</td><td>${l.boardDate }</td><td>${l.likeCnt }</td>
      </tr>
   </c:forEach>
</table>
	<c:if test="${list.pagingBean.previousPageGroup}">
         <a href="${initParam.root}free_boardList.do?pageNo=${list.pagingBean.startPageOfPageGroup-1}"><img src="${initParam.root }img/left_arrow_btn.gif"></a>  
   </c:if>
   
   <c:forEach begin="${list.pagingBean.startPageOfPageGroup}" end="${list.pagingBean.endPageOfPageGroup}" var="i">
   		 <c:choose>
   		 	<c:when test="${list.pagingBean.nowPage==i}">
         		${i}
         	</c:when>
         	<c:otherwise>
         		<a href="${initParam.root}free_boardList.do?pageNo=${i}">${i}</a>
         	</c:otherwise>
         </c:choose>
   </c:forEach>

      <c:if test="${list.pagingBean.nextPageGroup}">
         <a href="${initParam.root}free_showList.do?pageNo=${list.pagingBean.endPageOfPageGroup+1}"><img src="img/right_arrow_btn.gif"></a>
      </c:if>
<br><br><br><br><br>
<a href = "${initParam.root }free_writer.do">글쓰기</a>
</body>