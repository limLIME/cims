<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var monSize;
		
		$("#weeklyDiv").on("click", ".insertButton", function() {
			 alert($(".mondayClass").html());
		})
		
		$("#weeklyDiv").on("click", ".updeleteButton", function() {
			/* alert($("#weekTable").html());
			alert($(".mondayClass").html());
			 */
			var monValue="<td></td><td></td><td>";
			var buttonChange="<button type='button' class='btn btn-primary submitButton'>완료</button>";
			$("#chButton").html(buttonChange);
			
			//월요일 몇번도는지 확인
			var count=0;
			
			$.ajax({
				type:"get",
				data : "empNo=${evo.empNo}", 
				url:"sch_weeklyList.do",
				dataType:"json",
				success:function(jsonData){
					 for(var i=0; i<jsonData.length; i++){
						 if(jsonData[i].day=="월요일"){
							 	monValue +="<input type='hidden' name='hidden' value='"+ jsonData[i].schNo +"'>"
							 	monValue +="<input type='text' value=" + jsonData[i].schContent + " class='conVal'>";
								monValue += "</td>";
								$(".mondayClass").parent().children().eq(count+1).html(monValue);
								count++;
								monValue="<td></td><td></td><td>";
								monSize = i;
						 }
					} //for문 끝
					/* $(".monNmae").html() */
					alert($(".monName").parent().html("<td></td><td class='monName' style='font-size: 1.2em'>#Monday </td><td><button type='button' class='btn btn-primary btn-sm insertButton'  style='float: right;'>+</button></td>"))
					
				}//sucess끝
			})//ajax 
		})//업데이트 버튼 끝
		
		
		//썸잇버튼 시작
		$("#weeklyDiv").on("click", ".submitButton", function() {
			/* alert($("#weekTable").html());
			alert($(".mondayClass").html());
			 */
			var monValue="<td></td><td></td><td>";
			/* alert($("#input[name=conVal]").val()); */
			
			/* alert($(".mondayClass").children().eq(2).children().val()); */
			/*이승찬이 뽑아준것*/
			
			/* var monList = new Array(monSize+1); 
			for(var i = 0; i<monList.length; i++)
				monList[i] = $(".mondayClass").parent().children().eq(i+1).children().eq(2).children().val();
			 */
			 
			/* for(var i=0; i<monSize+1; i++)
				alert(monList[i]);
			 */
			
			 //먼데이 배열
			var monNo = [];
			var monCon = [];
			 
			//for 문에서 i역활과 같고 e는 this로 대신 쓸수 있음
			$('#weeklyDiv').find("input:hidden").each(function(i, e){
				/* alert($(this).parent().find(".conVal").val());
				alert($(this).parent().find("input:hidden").val()); */
			 	monNo.push($(this).parent().find("input:hidden").val());
				monCon.push($(this).parent().find(".conVal").val());
		 	});
			 
			alert(monCon);
			alert(monNo); 
			
			var count=0;
			
			var allData = { "monNo": monNo, "monCon": monCon, "evoNo": ${evo.empNo} }; 
			var monValue="<td></td><td></td><td>";
			var monSize =0;
		 	$.ajax({
				type:"get",
				data : allData, 
				url:"sch_weeklyUpdateList.do",
				dataType:"json",
				success:function(jsonData){
					 for(var i=0; i<jsonData.length; i++){
						 if(jsonData[i].day=="월요일"){
							monValue +="<input type='hidden' name='hidden' value='"+ jsonData[i].schNo +"'>";
							monValue +=jsonData[i].schContent;
							monValue +="</td>";
							$(".mondayClass").parent().children().eq(count+1).html(monValue);
							count++;
							monValue="<td></td><td></td><td>";
							monSize = i;
						 }
					} //for문 끝
				}//sucess끝
			})//ajax  
		}) //썸잇 버튼 끝
		
	})
</script>
</head>
<body>

	<section id="main-content"> <section class="wrapper">
	<div class="marginMain">
		<div class="content-panel">
			<h3>
				&nbsp;<i class="fa fa-angle-right"></i> Weekly Schedule
			</h3>
			<hr>
			<div id="weeklyDiv">
				<center>
					<table class="table table-striped table-advance table-hover"
						id="weekTable">
						<thead style="font-size: 1.2em;">
							<tr>
								<th width="1%"></th>
								<th width="20%">#Day</th>
								<th>Contents</th>
							</tr>
						</thead>


						<tbody>

							<tr>
								<td></td>
								<td class="monName" style="font-size: 1.2em">#Monday </td>
								<td></td>
							</tr>

							<c:forEach items="${wlist}" var="i" varStatus="index">
								<c:if test="${i.day eq '월요일'}">
									<tr class="mondayClass">
										<td></td>
										<td><input type="hidden" name="hidden"
											value="${index.index}"></td>
										<td>${i.schContent }</td>
									</tr>
								</c:if>
							</c:forEach>

							<tr>
								<td></td>
								<td>#Tuesday</td>
								<td></td>
							</tr>


							<c:forEach items="${wlist}" var="i">
								<c:if test="${i.day eq '화요일'}">
									<tr>
										<td></td>
										<td></td>
										<td>${i.schContent }</td>
									</tr>
								</c:if>
							</c:forEach>

							<tr>
								<td></td>
								<td>#Wednesday</td>
								<td></td>

								<c:forEach items="${wlist}" var="i">
									<c:if test="${i.day eq '수요일'}">
										<tr>
											<td></td>
											<td></td>
											<td>${i.schContent }</td>
										</tr>
									</c:if>
								</c:forEach>
							<tr>
								<td></td>
								<td>#Thursday</td>
								<td></td>
							</tr>

							<c:forEach items="${wlist}" var="i">
								<c:if test="${i.day eq '목요일'}">
									<tr>
										<td></td>
										<td></td>
										<td>${i.schContent }</td>
									</tr>
								</c:if>
							</c:forEach>


							<tr>
								<td></td>
								<td>#Friday</td>
								<td></td>
							</tr>

							<c:forEach items="${wlist}" var="i">
								<c:if test="${i.day eq '금요일'}">
									<tr>
										<td></td>
										<td></td>
										<td>${i.schContent }</td>
									</tr>
								</c:if>
							</c:forEach>


							<tr>
								<td></td>
								<td>#Saturday</td>
								<td></td>
							</tr>

							<c:forEach items="${wlist}" var="i">
								<c:if test="${i.day eq '토요일'}">
									<tr>
										<td></td>
										<td></td>
										<td>${i.schContent }</td>
									</tr>
								</c:if>
							</c:forEach>

						</tbody>
					</table>

					<br>
					<div id=chButton>
						<button type='button' class='btn btn-primary updeleteButton'>추가/수정</button>
					</div>
				</center>
			</div>
		</div>
	</div>
	</section></section>

</body>
</html>