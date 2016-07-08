<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <section id="main-content">
          <section class="wrapper">

<div class="marginMain4">
<div class="content-panel">
<h3>&nbsp;<i class="fa fa-angle-right"></i> Send Mail</h3>
<center>
 
<table class="table table-striped table-advance table-hover" >
		<thead>
		<tr>
			<th class="no">#NO</th>
			<th class="title" >Title</th>
			<th class="name">Sender</th>
			<th class="name">Receiver</th>
			<th class="date">Date</th>
			</tr>
		</thead>
		<tbody>			
		<c:if test="${requestScope.lvo.list.size()==0}">
		<tr><td colspan="5"><center>Not Exist Mail</center></td></tr>
		</c:if>
		<c:forEach var="mailVO" items="${requestScope.lvo.list}">				
			<tr>
			    <td>${mailVO.mailNo }</td>				
		
				
		
				<td>
				<a href="${initParam.root}mail_showMailContent.do?no=${mailVO.mailNo }">
				${mailVO.mailTitle}</a>
				</td>
				<td>${mailVO.mailSender}</td>
				<td>${mailVO.mailReceiver}</td>
				<td>${mailVO.mailDate}</td>
			</tr>	
			</c:forEach>
			
		</tbody>					
	</table>
	<c:if test="${sessionScope.mvo!=null}">
	<a href="${initParam.root}mail_sendForm.do"><img  src="${initParam.root}img/write_btn.jpg" border="0"></a>
	</c:if>
	<br><br>	
<c:choose >
	<c:when test="${lvo.pagingBean.previousPageGroup==true}">
	<a href="${initParam.root}mail_getSendList.do?pageNo=${lvo.pagingBean.startPageOfPageGroup-1}&empNo=${sessionScope.evo.empNo}">◀</a>
	</c:when>
	</c:choose>
	<c:forEach begin="${lvo.pagingBean.startPageOfPageGroup}" end="${lvo.pagingBean.endPageOfPageGroup}" var="pagelist" >	
			<a href="${initParam.root}mail_getSendList.do?pageNo=${pagelist}&empNo=${sessionScope.evo.empNo}">${pagelist} </a>
	</c:forEach>
	<c:choose>
		<c:when test="${lvo.pagingBean.nextPageGroup==true}">
		<a href="${initParam.root}mail_getSendList.do?pageNo=${lvo.pagingBean.endPageOfPageGroup+1}&empNo=${sessionScope.evo.empNo}">▶</a>
		</c:when>
	</c:choose>
	<br><br>
</center></div></div></section></section>








