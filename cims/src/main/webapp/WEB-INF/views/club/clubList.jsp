<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function clubWrite() {
		location.href = "${initParam.root}club_writer.do";
	}
	function myClub(){
		location.href = "${initParam.root}club_myclub.do";
	}
</script>
<body>
	<section id="main-content">
		<section class="wrapper">
			<c:choose>
				<c:when test="${evo.positionVO.positionNo == 100 }">
			<div class="marginMain">
<table class="table">
<tr bgcolor="white">
<td colspan="3"><h3><i class="fa fa-angle-right"></i> Club List</h3></td>
</tr>
<tr bgcolor="white">
	<td width="40%">
		<table id="deptTable" class="table table-striped table-advance table-hover ">
			<thead>
			<tr>
			<th align="center" colspan="2"><h4>Created Club List</h4></th>
			</tr>
				<tr>
					<th><center>Club Name</center></th>
					<th><center>Club Master</center></th>
				</tr>			
			</thead>
			<tbody>
								<c:forEach items="${requestScope.list.list }" var="l">
									<tr>
										<td><a href="club_showContent.do?no=${l.clubNo}"><center>${l.clubName }</center></a></td>
										<td><center>${l.employeeVO.empName}</center></td>
									</tr>
								</c:forEach>
			</tbody>
		</table><!-- 부서 -->
<div align="center">
 									<c:if test="${list.pagingBean.previousPageGroup}">
											<a href="${initParam.root}club_List.do?pageNo=${list.pagingBean.startPageOfPageGroup-1}"><img
												src="${initParam.root }img/left_arrow_btn.gif"></a>
									</c:if> 
									<c:forEach begin="${list.pagingBean.startPageOfPageGroup}"
											end="${list.pagingBean.endPageOfPageGroup}" var="i">
											<c:choose>
												<c:when test="${list.pagingBean.nowPage==i}">
         										${i}
         										</c:when>
												<c:otherwise>
													<a href="${initParam.root}club_List.do?pageNo=${i}">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach> 
										<c:if test="${list.pagingBean.nextPageGroup}">
											<a
												href="${initParam.root}club_List.do?pageNo=${list.pagingBean.endPageOfPageGroup+1}"><img
												src="img/right_arrow_btn.gif"></a>
										</c:if>

</div>
	</td>
<td width="5%"><table><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr></table></td><%-- 공백 테이블 --%>
	<td>
	<table class="table table-striped table-advance table-hover scrolltbody">
         <thead>
							<tr>
								<th align="center" colspan="2"><h4>Waiting Club</h4></th>
							</tr>
			<tr>
              <th><center>Club Name</center></th>
              <th><center>Club Master</center></th>
			</tr>
         </thead>         
         <tbody>
            								<c:forEach items="${requestScope.list2 }" var="l">
									<tr>
										<td><a href="club_showContent.do?no=${l.clubNo}"><center>${l.clubName }</center></a></td>
										<td><center>${l.employeeVO.empName}</center></td>
									</tr>
								</c:forEach>
         </tbody>		
	</table><!-- 사원목록 -->
	</td>
</tr>
</table>
			</div>
			</div>
				</c:when>
				<c:otherwise>
			<div class="marginMain">
			<div class="content-panel" align="center">
				<table class="table">
						<thead>
							<tr>
								<th colspan="2"> <h3><i class="fa fa-angle-right"></i>&nbsp;Created Club List</h3></th>
							</tr>
						</thead>
						<tbody>
						<tr>
						<td>
					<table class="table table-striped table-advance table-hover">					
								<tr>
									<th width="25%">Club Name</th>
									<th width="10%">Club Master</th>
								</tr>
								<c:forEach items="${requestScope.list.list }" var="l">
									<tr>
										<td><a href="club_showContent.do?no=${l.clubNo}">${l.clubName }</a></td>
										<td>${l.employeeVO.empName}</td>
									</tr>
								</c:forEach>
								
							</table>
							</td>
							</tr>
							<tr>
							<td>
									<c:choose>
				<c:when test="${requestScope.check == 0 && evo.positionVO.positionNo != 100}">
				<div align="left">
					<input type="button" class="btn btn-info" value="Create Club" onclick="clubWrite()">
				</div>
				</c:when>
				<c:when test = "${requestScope.check == 1}">
				<div align="left">
				<input type="button" class="btn btn-success" value="My Club" onclick="myClub()">
				</div>
				</c:when>
			</c:choose>
								</td>
								</tr>

							</tbody>
							</table>
															
 									<c:if test="${list.pagingBean.previousPageGroup}">
											<a href="${initParam.root}club_List.do?pageNo=${list.pagingBean.startPageOfPageGroup-1}"><img
												src="${initParam.root }img/left_arrow_btn.gif"></a>
									</c:if> 
									<c:forEach begin="${list.pagingBean.startPageOfPageGroup}"
											end="${list.pagingBean.endPageOfPageGroup}" var="i">
											<c:choose>
												<c:when test="${list.pagingBean.nowPage==i}">
         										${i}
         										</c:when>
												<c:otherwise>
													<a href="${initParam.root}club_List.do?pageNo=${i}">${i}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach> 
										<c:if test="${list.pagingBean.nextPageGroup}">
											<a
												href="${initParam.root}club_List.do?pageNo=${list.pagingBean.endPageOfPageGroup+1}"><img
												src="img/right_arrow_btn.gif"></a>
										</c:if>
													
							</div>
							</div>
				</c:otherwise>
			</c:choose>
			
		</section>
	</section>
</body>