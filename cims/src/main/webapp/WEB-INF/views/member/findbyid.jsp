<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){	
	$("#findForm").submit(function(){			
		if($("#id").val()==""){
			alert("아이디를 입력하세요");			
			return false;
		}		
	});
});
</script>
<form action="findMemberById.do" id="findForm">
아이디 <input type="text" name="id" id="id">
<input type="submit" value="검색">
</form>