<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <section id="main-content">
          <section class="wrapper">

<div class="marginMain4">
<div class="content-panel">
<h3>&nbsp;<i class="fa fa-angle-right"></i> Confirmation Of Receipt</h3>
<center>
 
<table class="table table-striped table-advance table-hover">
		<thead align="center">
		<tr>
			<th class="no">#NO</th>
			<th class="title">Title</th>
			<th class="name">Sender</th>
			<th class="name">Receiver</th>
			<th class="date">Date</th>
			<th class="name">Confirm</th>
			</tr>
		</thead>
		<tbody>			
		<c:if test="${requestScope.lvo.list.size()==0}">
		<tr><td colspan="6"><center>Not Exist Message</center></td></tr>
		</c:if>
		<c:forEach var="mailVO" items="${requestScope.lvo.list}">				
			<tr>
			    <td>${mailVO.mailNo }</td>				
				<td>
				<c:choose>
				<c:when test="${sessionScope.evo!=null}">
				<a href="${initParam.root}mail_showMailContent2.do?no=${mailVO.mailNo }">
				${mailVO.mailTitle}</a>
				</c:when>
				<c:otherwise>
				${mailVO.mailTitle}
				</c:otherwise>
				</c:choose>
				</td>
				<td>${mailVO.mailSender}</td>
				<td>${mailVO.mailReceiver}</td>
				<td>${mailVO.mailDate}</td>
				<c:choose>
				<c:when test="${mailVO.mailConfirm==0}"><td>읽지않음</td></c:when>
				<c:otherwise><td>읽음</td></c:otherwise>

				</c:choose>
				
		
			</tr>	
			</c:forEach>
			
		</tbody>				
	</table>	
		<br><br>	
<c:choose >
	<c:when test="${lvo.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}mail_getCheckList.do?pageNo=${lvo.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">◀</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${lvo.pagingBean.startPageOfPageGroup}" end="${lvo.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}mail_getCheckList.do?pageNo=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${lvo.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}mail_getCheckList.do?pageNo=${lvo.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">▶</a>
		</c:when>
	</c:choose>
</center><br>
</div>
</div>
</section>
</section>








