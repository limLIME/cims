<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function(){
	 $("#write_form").submit(function(){ 
       if($("#boardTitle").val()==""){
          alert("제목을 입력하세요!");
          return false;
       }
       if($("#boardContent").val()==""){
          alert("본문을 입력하세요!");
          return false;
       }
	 });
 });   
	function cancleUpdate() {
		if (confirm("취소하시겠습니까?")) {
			location.href = "${initParam.root}free_boardList.do?pageNo=1";
		}
	}
</script>
<section id="main-content">
	<section class="wrapper">
		<div class="marginMain2">
			<div class="content-panel">
				<h3>
					&nbsp;<i class="fa fa-angle-right">&nbsp;</i>Update
				</h3>
			
				<form
					action="${initParam.root}free_update_result.do?boardNo=${vo.boardNo}"
					method="post" id="write_form" enctype="multipart/form-data">
					<table class="table table-hover" style="width: 100%" >
						<tbody>
							<tr>
								<td  colspan="2">No :  ${vo.boardNo}</td>
							</tr>
							<tr >
								<td  style="width: 7%">Title :</td>
								<td style="width: 93%"> <input type="text" name="boardTitle" id = "boardTitle"
									value="${vo.boardTitle}"  class = "form-control" ></td>
							</tr>
							<tr>
								<td  colspan="2" style="width: 100%">Writer : ${evo.departmentVO.deptName } ${evo.positionVO.positionName } ${evo.empName } ( ${evo.empNo } )</td>
							</tr>
							<tr>
								<td  colspan="2" align="left" style="width: 100%">&nbsp;&nbsp; <textarea
									id="boardContent"	cols="60" rows="15" name="boardContent" class="form-control">${vo.boardContent} </textarea>
								</td>
							</tr>
							<c:choose>
								<c:when test="${'1' ne requestScope.vo.boardPath}">
									<tr>
										<td colspan="2">AttachedFile :
											${requestScope.vo.boardPath }<br><br> <input type="file" name="uploadFile"></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2">AttachedFile : does not exist <br><br><input type="file" name="uploadFile"></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div align="center">
						<input type="submit" value="Update" class="btn btn-info">
						<input type="button" value="Cancel" class="btn btn-warning"
							onclick="cancleUpdate()">
					</div>
					<br>
				</form>
			</div>
		</div>
	</section>
</section>