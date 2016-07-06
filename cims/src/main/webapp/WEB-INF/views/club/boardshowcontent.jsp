<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript" >
		$(document).ready(function(){
			$("#joinBtn").click(function(){
				location.href="${initParam.root}club_boardJoin.do?no="+${requestScope.detail.clubBoardNo};
			});
			$("#joinCancelBtn").click(function(){
				location.href="${initParam.root}club_boardJoinCancel.do?no="+${requestScope.detail.clubBoardNo};
			});
			$("#backBtn").click(function(){
				location.href="${initParam.root}club_boardList.do?page=1";
			});
			$("#updateBtn").click(function(){
				location.href="${initParam.root}club_boardUpdateForm.do?boardNo="+${requestScope.detail.clubBoardNo};
			});
			$("#deleteBtn").click(function(){
				if(confirm("이 게시글을 삭제하시겠습니까?")){				
					location.href="${initParam.root}club_boardDelete.do?boardNo="+${requestScope.detail.clubBoardNo};
				};
			});
		});
	</script>
<section id="main-content">
<section class="wrapper">
		<div class="marginMain">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
<table class="table">
<tr bgcolor="white">
<td colspan="3"><h3><i class="fa fa-angle-right"></i>Show content</h3></td>
</tr>
<tr bgcolor="white">
	<td width="20%">
			<table class="table">
				<tbody>
					<tr>
						<td colspan="2">Title : ${requestScope.detail.clubBoardTitle}</td>
					</tr>
					<tr>
						<td colspan="2">ClubName : ${requestScope.detail.clubVO.clubName}</td>				
					</tr>
					<tr>
						<td>D-Day : ${requestScope.detail.clubBoardDate}</td>
					</tr>
					<tr>
						<td>
							Limited personnel : ${requestScope.detail.clubBoardMaxPeople}
						</td>
					</tr>
					<tr>
						<td colspan="2">Content</td>
					</tr>
					<tr>
						<td ><textarea cols="80" rows="15" name="clubBoardContent" readonly="readonly">${requestScope.detail.clubBoardContent}</textarea></td>
					</tr>
					<tr>
						<td><center>
						
						<c:choose>
							<c:when test="${requestScope.appcheck == 0}">
								<c:if test="${ detail.clubBoardMaxPeople != appCount}">
								<input type="button" value="Join" id="joinBtn" class="btn btn-info">&nbsp;&nbsp;
								</c:if>
								<input type="button" id="backBtn" value="List" class="btn btn-success">&nbsp;&nbsp;
								<c:if test="${requestScope.writerCheck == 1}">
									<input type="button" value="update" id="updateBtn" class="btn btn-primary">&nbsp;&nbsp;
									<input type="button" value="delete" id="deleteBtn" class="btn btn-danger">&nbsp;&nbsp;
								</c:if>
							</c:when>
							<c:when test="${requestScope.appcheck == 1}">
								<input type="button" value="Join Cancel" id="joinCancelBtn" class="btn btn-warning">&nbsp;&nbsp;
								<input type="button" id="backBtn" value="List" class="btn btn-success">&nbsp;&nbsp;
								<c:if test="${requestScope.writerCheck == 1}">
									<input type="button" value="update" id="updateBtn" class="btn btn-primary">&nbsp;&nbsp;
									<input type="button" value="delete" id="deleteBtn" class="btn btn-danger">&nbsp;&nbsp;
								</c:if>
							</c:when>			
						</c:choose>
						
							
						</center></td>
					</tr>			
				</tbody>	
			</table>
	</td>
<td width="5%"><table><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr></table></td><%-- 공백 테이블 --%>
	<td width="20%">
			<table class="table">
				<thead>
					<tr>
						<th colspan="2">
							Number of participants ( ${requestScope.appCount} / ${requestScope.detail.clubBoardMaxPeople} )
						</th>
					</tr>
					<tr>
						<th> 
							<center>Dept Name</center>
						</th>
						<th>
							<center>Employee Name</center>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.appList}" var="list">
					<tr>
						<td><center>${list.departmentVO.deptName}</center></td>
						<td><center>${list.empName}</center></td>
					</tr>
					</c:forEach>
				</tbody>				
			</table>
	</td>
</tr>
</table>				
</div>
</div>
</div>
</div>
</section></section>