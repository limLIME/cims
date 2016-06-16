<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title: </title>
<link rel="stylesheet" href="${initParam.root}css/board.css" type="text/css">
<script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#updateForm").submit(function(){ 
    		if($("#title").val()==""){
    			alert("제목을 입력하세요!");
    			return false;
    		}
    		if($("#content").val()==""){
    			alert("본문을 입력하세요!");
    			return false;
    		}
    	});
    	$("#resetBtn").click(function(){    		
    		$("#write_form")[0].reset();
    	});
    });	
</script>
</head>
<body>
<%-- <jsp:include page="/member/login.jsp"></jsp:include>	 --%>
<form method="post" id="updateForm" action="${initParam.root}notice_updateContent.do">
	<table class="content">
	<tr>
		<td>
			<table>
				<tr>
					<td>
					글번호: <input type=text name=noticeNo value=${nvo.noticeNo } readonly></input>
					| 타이틀:<input type=text id=title name=noticeTitle value=${nvo.noticeTitle }></input><br>		
					날짜:<input type=text id=title name=noticeDate value=${nvo.noticeDate }></input>				
					</td>
				<tr>
					<td>						
	<textarea rows="15" cols="75" id="content" name="noticeContent">${nvo.noticeContent }</textarea>
					</td>
				</tr>
				<tr>
				<td valign="middle">						
					<input type="submit" value="수정하기" class="action"></input>			
					</td>				
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>	
</body>
</html>














