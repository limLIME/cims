<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

$(document).ready(function() {

});
</script>
<form id="writeForm" action="${initParam.root }doc_write.do" enctype="multipart/form-data" method="post">
<table id="showDoc" border="1"  >
	<tr>
		<td colspan="1">공문제목</td>
		<td colspan="3"><input type="text" name="title" placeholder="공문 제목을 입력하세요"></td>
	</tr>
	<tr>
		<td colspan="1">결재대상지정</td>
		<td colspan="3">
			<div id="next">
				<select id="nextSign" name="approver">
					<c:forEach items="${requestScope.list }" var="next">
						<option value="${next.empNo }">${next.departmentVO.deptName }
							${next.positionVO.positionName } ${next.empName }</option>
					</c:forEach>

				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="4"><textarea name="content" rows="10" cols="50" placeholder="공문 내용을 입력하세요"></textarea></td>
	</tr>
	<tr>
		<td colspan="1">첨부</td>
		<td colspan="3">
		<input type="file" name="	multipartFile">
		</td>
	</tr>
	<tr>
	<td colspan="4" align="center">
	<input type="submit" value="작성완료"> 
	<input type="reset" value="작성취소">
	</td>
	</tr>
	
</table>

</form>