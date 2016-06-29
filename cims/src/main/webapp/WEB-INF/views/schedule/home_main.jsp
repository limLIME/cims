<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
		// +버튼 누르면 삽입
		$(".content-panel").on("click", ".insertButton", function(){
			//현재 tr 갯수(tr의 최종번호)
			var lastItemNo = $("#schTable tr").length-1;
			
			  var newTr = "<tr class='sch_active' valign='middle'><Td class='sch_resultView'  style='font-size: 1.2em'>"+
			  		  "<input type='hidden' class='schNo'>" + "<input type='text' class='schContent'>&nbsp;&nbsp;"
					  +"<button type='button' class='btn btn-success btn-xs insertSubmit'><i class='fa fa-check'></i></button>"			  	
						+"</td></tr>";			  
              $("#schTable").append(newTr);
			}
		)
		
		// +버튼 눌러서 삽입 이후 확인 버튼 누를시
		$(".content-panel").on("click",".insertSubmit",function(){/* 
			alert($(this).html());
			alert($(this).parent().html()); */
			var con = $(this).parent().find(".schContent").val();
			  $.ajax({
					type:"get",
					data : "schContent=" + con + "&empNo=${evo.empNo}", 
					url:"sch_todayInsert.do",
					dataType:"json",
					context: this.parentNode.children,
					success:function(jsonData){
						var value = "<input type='hidden' class='schNo' value='" +jsonData.schNo +"'>" 
						+ "<div class='sch_div'>"
						+ jsonData.schContent 
						+ "</div>" 
						+"<button class='btn btn-danger btn-xs deleteButton' style='float: right;''>" 
						+"<i class='fa fa-trash-o '></i></button>"+ "&nbsp;&nbsp;"+
						"<button class='btn btn-primary btn-xs updateButton' style='float: right; margin-right: 0.5%;'>"
						+"<i class='fa fa-pencil'></i></button>";
						$(this).parent().html(value); 
					}
			})
		})
		
		//삭제 버튼 누를시
		$(".content-panel").on("click", ".deleteButton", function () {
			var schNo = $(this).parent("td").find(".schNo").val();
			var flag = confirm("정말로 삭제하시겠습니까?");
			
			if(flag==true){
				$(this).parent().parent().html("");
				$.ajax({
					type:"get",
					data : "schNo=" + schNo+"&empNo=${evo.empNo}", 
					url:"sch_todayDelete.do"
				}) 
			}else{
				return false;
			}
		})
		
		//수정(업데이트) 버튼 누를시
		$(".content-panel").on("click", ".updateButton", function() {
			var schNo = $(this).parent("td").find(".schNo").val();
			var schCon = $(this).parent("td").find(".sch_div").html();
			$(this).parent("td").html("<input type='text' class='schContent' value='"+schCon +"'>"+
			"&nbsp;&nbsp;<button type='button' class='btn btn-success btn-xs updateSubmit'>"
			+"<i class='fa fa-check'></i></button>"+
			/* "<button type='button' class='btn btn-primary2 updateSubmit'>완료</button>"+ */
			"<input type='hidden' name='schNo' value='"+schNo+"'>"
			);
		})

		// 업데이트 이후 확인 버튼을 누를시
		$(".content-panel").on("click",".updateSubmit",function(){
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
							">" + "<div class='sch_div'>" + jsonData.schContent + "</div>" + 
                            "<button class='btn btn-danger btn-xs deleteButton' style='float: right;''><i class='fa fa-trash-o '></i></button>"+
							"&nbsp;&nbsp;"+
							"<button class='btn btn-primary btn-xs updateButton' style='float: right; margin-right: 0.5%;'><i class='fa fa-pencil'></i></button>";
							$(this).parent().html(value);
						}
					}) 
			})
		
	});
</script>
</head>
<body>
<section id="main-content">
<section class="wrapper">
	<div class="marginMain">
	<br>
			<div class="content-panel">
			<h3>&nbsp;<i class="fa fa-angle-right"></i> Today Schedule</h3>
	               <hr>
			<table class="table table-striped table-advance table-hover" id="schTable" width="20%">
				<thead style="font-size: 1.5em;">
					<Tr class="sch_warning">
						<th style=" white-space:nowrap;"><i class="fa fa-bullhorn"></i>Content<button type="button" class="btn btn-primary btn-sm insertButton"  style="float: right;">+</button></th>
					</Tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="i">
							<c:if test="${i.schContent!=null }">
						<tr class="sch_active" valign="middle">
							<Td class="sch_resultView" style="font-size: 1.2em">
							<input type="hidden" class="schNo" value="${i.schNo}">
								<div class="sch_div">${i.schContent}</div>
								<!-- <button type="button" class="btn btn-primary2 updateButton">수정</button>
								 -->
                                 <button class="btn btn-danger btn-xs deleteButton" style="float: right;"><i class="fa fa-trash-o "></i></button>
								 &nbsp;&nbsp;
								 <button class="btn btn-primary btn-xs updateButton" style="float: right; margin-right: 0.5%;"><i class="fa fa-pencil"></i></button>
								<!--  <button class="close " aria-hidden="true" data-dismiss="alert" type="button">×</button>
								<button type="button" class="btn btn-primary2 deleteButton">삭제</button> -->
								&nbsp;&nbsp;								
							</Td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			</div>
	</div>
	</section>
	</section>
</body>
</html>