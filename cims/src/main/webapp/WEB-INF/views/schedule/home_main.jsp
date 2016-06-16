<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$(".insertButton").click(function(){
			var lastItemNo = $("#schTable tr").length-1;
			alert(lastItemNo);
			  var newTr = "<tr class='active' valign='middle'><Td class='resultView'>"+
			  		  "<input type='hidden' class='schNo' value='10'>"+
					  "내용"+
					  "<button type='button' class='btn btn-primary2 updateButton'>"+
					"수정</button>&nbsp;&nbsp;<button type='button' class='btn btn-primary2 deleteButton'>"+
					"삭제</button>&nbsp;&nbsp; " +"</td></tr>";			  
              $("#schTable").append(newTr);
		})
		
		$(".resultView").on("click", ".deleteButton", function () {
			var schNo = $(this).parent("td").find(".schNo").val();
			var flag = confirm("정말로 삭제하시겠습니까?");
			
			if(flag==true){
				$(this).parent().parent().html("");
				$.ajax({
					type:"get",
					data : "schNo=" + schNo+"&empNo=${evo.empNo}", 
					url:"sch_todayDelete.do"
				}) 
			}
		})
		
		$(".resultView").on("click", ".updateButton", function() {
			alert("1");
			var schNo = $(this).parent("td").find(".schNo").val();
			$(this).parent("td").html("<input type='text' class='schContent'>"+
			"<button type='button' class='btn btn-primary2 updateSubmit'>완료</button>"+
			"<input type='hidden' name='schNo' value='"+schNo+"'>"
			);
		})

		$(".resultView").on("click",".updateSubmit",function(){
				var schContent = $(this).prev().val();
				var schNo = $(this).next().val();
				
				  $.ajax({
						type:"get",
						data : "schNo=" + schNo+"&schContent="+schContent+"&empNo=${evo.empNo}", 
						url:"sch_todayUpdate.do",
						dataType:"json",
						context: this.parentNode.children,
						success:function(jsonData){
							var value = "<input type='hidden' class='schNo' value=" +jsonData.schNo +
							">" + jsonData.schContent + "<button type='button' class='btn btn-primary2 updateButton'>"+
							"수정</button>&nbsp;&nbsp;<button type='button' class='btn btn-primary2 deleteButton'>"+
							"삭제</button>&nbsp;&nbsp; ";
							$(this).parent().html(value);
						}
					}) 
			})
		
	});
</script>
</head>
<body>
	<br>
	<center>
		<a href="${initParam.root}sch_home.do" class="btn btn-info">오늘</a> &nbsp;&nbsp;&nbsp; <a href="#"
			class="btn btn-warning">주간</a> &nbsp;&nbsp;&nbsp; <a href="#"
			class="btn btn-success">월간</a> <br>
		<br>
		<form action="resultForm">
			<table class="table table-striped table-hover" id="schTable" width="20%">
				<thead>
				
					<Tr class="warning">
						<td>오늘의 일정
						<button type="button" class="btn btn-primary btn-sm insertButton" >+</button>
						</td>
					</Tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="i">
							<c:if test="${i.schContent!=null }">
						<tr class="active" valign="middle">
							<Td class="resultView">
							<input type="hidden" class="schNo" value="${i.schNo}">
								${i.schContent}
								<button type="button" class="btn btn-primary2 updateButton">수정</button>
								&nbsp;&nbsp;
								<button type="button" class="btn btn-primary2 deleteButton">삭제</button>
								&nbsp;&nbsp;								
							</Td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</center>
</body>
</html>