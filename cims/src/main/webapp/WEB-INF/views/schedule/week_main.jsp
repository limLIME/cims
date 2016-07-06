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
		
		//추가버튼 누를때 -> +뜸
		$("#weeklyDiv").on("click", ".insertButton", function() {
			var insert = "<button type='button' class='btn btn-primary btn-sm insertSubmit'  style='float: right;'>+</button>";
			$(".monName").next().html(insert);
			$(".tuesName").next().html(insert);
			$(".wedName").next().html(insert);
		})
		
		//+버튼 눌렀을때
		$("#weeklyDiv").on("click", ".insertSubmit", function() {
			var day= $(this).parent().parent().children().eq(1).html();
			if(day=="#Monday"){
				$(this).parent().parent().after("<tr><td><input type='hidden' value='monday'></td><td></td><td><input type='text'>&nbsp;&nbsp;<button type='button' class='btn btn-success btn-xs insertSubmit2'><i class='fa fa-check'></i></button></td></tr>");
			}
			else if(day=="#Tuesday"){
				$(this).parent().parent().after("<tr><td><input type='hidden' value='tuesday'></td><td></td><td><input type='text'>&nbsp;&nbsp;<button type='button' class='btn btn-success btn-xs insertSubmit2'><i class='fa fa-check'></i></button></td></tr>");
			}
			else if(day=="#Wednesday"){
				$(this).parent().parent().after("<tr><td><input type='hidden' value='wednesday'></td><td></td><td><input type='text'>&nbsp;&nbsp;<button type='button' class='btn btn-success btn-xs insertSubmit2'><i class='fa fa-check'></i></button></td></tr>");
			}
		})
		
		//v 버튼 눌렀을때
		$("#weeklyDiv").on("click", ".insertSubmit2", function() {
			var day = $(this).parent().parent().find("input:hidden").val();
			var con = $(this).parent().parent().find("input:text").val();
			location.href="${initParam.root}di.do?day="+day+"&con="+con;
		})
		
		
		//수정 버튼 눌렀을시
		$("#weeklyDiv").on("click", ".updeleteButton", function() {
			var monValue="<td></td><td></td><td>"; 	
			var tuesValue="<td></td><td></td><td>";
			var wedValue="<td></td><td></td><td>";
			
			//버튼 모양 변경
			var buttonChange="<button type='button' class='btn btn-primary submitButton'>완료</button>";
			$("#chButton").html(buttonChange);
			
			//요일별 몇번도는지 확인
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
						 }// 월요일 if문 끝
						 else if(jsonData[i].day=="화요일"){
							 tuesValue +="<input type='hidden' name='hidden' value='"+ jsonData[i].schNo +"'>";
							 tuesValue +="<input type='text' value=" + jsonData[i].schContent + " class='conVal'>";
							 tuesValue += "</td>";
							 $(".tuesdayClass").parent().children().eq(count+2).html(tuesValue);
							 count++;
							 tuesValue="<td></td><td></td><td>";
						 }
						 else if(jsonData[i].day=="수요일"){
							 wedValue ="<td></td><td></td><td>";
							 wedValue +="<input type='hidden' name='hidden' value='"+ jsonData[i].schNo +"'>"
							 wedValue +="<input type='text' value=" + jsonData[i].schContent + " class='conVal'>";
							 wedValue += "</td>";
							 $(".wednesdayClass").parent().children().eq(count+3).html(wedValue);
							 count++;
							 wedValue="<td></td><td></td><td>";
						 } 
					} //for문 끝
					/* $(".monNmae").html() */
					/* alert($(".monName").parent().html("<td></td><td class='monName' style='font-size: 1.2em'>#Monday </td><td><button type='button' class='btn btn-primary btn-sm insertButton'  style='float: right;'>+</button></td>")) */
					
				}//sucess끝
			})//ajax 
		})//업데이트 버튼 끝
		
		
		//수정 완료버튼 시작
		$("#weeklyDiv").on("click", ".submitButton", function() {
			/* alert($("#weekTable").html());
			alert($(".mondayClass").html());
			 */
			var monValue="<td></td><td></td><td>";
			var tuesValue="<td></td><td></td><td>";
			var wedValue="<td></td><td></td><td>";
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
			$('#weeklyDiv').find(".mondayClass").each(function(i, e){
			 	monNo.push($(this).find("input:hidden").val());
				monCon.push($(this).find(".conVal").val());
		 	});
			
			 //튜스데이 배열
			var tuesNo = [];
			var tuesCon = [];
			 
			//for 문에서 i역활과 같고 e는 this로 대신 쓸수 있음
			$('#weeklyDiv').find(".tuesdayClass").each(function(i, e){
				tuesNo.push($(this).find("input:hidden").val());
				tuesCon.push($(this).find(".conVal").val());
		 	});
			
			//수요일 배열
			var wedNo = [];
			var wedCon = [];
			 
			//for 문에서 i역활과 같고 e는 this로 대신 쓸수 있음
			$('#weeklyDiv').find(".wednesdayClass").each(function(i, e){
				wedNo.push($(this).find("input:hidden").val());
				wedCon.push($(this).find(".conVal").val());
		 	});
			
			var count=0;
			
			var allData = { "monNo": monNo, "monCon": monCon,"tuesNo" : tuesNo, "tuesCon": tuesCon,  "wedNo": wedNo, "wedCon":wedCon, "evoNo": ${evo.empNo} }; 
			var monValue="<td></td><td></td><td>";
			var tuesNo ="<td></td><td></td><td>";
			var monSize =0;
		 	$.ajax({
				type:"get",
				data : allData, 
				url:"sch_weeklyUpdateList.do",
				dataType:"json",
				context: this,
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
						 else if(jsonData[i].day=="화요일"){
								tuesValue +="<input type='hidden' name='hidden' value='"+ jsonData[i].schNo +"'>";
								tuesValue +=jsonData[i].schContent;
								tuesValue +="</td>";
								$(".tuesdayClass").parent().children().eq(count+2).html(tuesValue);
								count++;
								tuesValue="<td></td><td></td><td>";
								
						}else if(jsonData[i].day=="수요일"){
							wedValue +="<input type='hidden' name='hidden' value='"+ jsonData[i].schNo +"'>";
							wedValue +=jsonData[i].schContent;
							wedValue +="</td>";
							$(".wednesdayClass").parent().children().eq(count+3).html(wedValue);
							count++;
							wedValue="<td></td><td></td><td>";
						}//if문 끝
					} //for문 끝
					 var test = "<Button type='button' class='btn btn-primary updeleteButton'>수정</button>";
					$(this).parent().html(test); 
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
								<td class="monName" style="font-size: 1.2em">#Monday</td>
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
								<td class="tuesName">#Tuesday</td>
								<td></td>
							</tr>

							<c:forEach items="${wlist}" var="i" varStatus="index">
								<c:if test="${i.day eq '화요일'}">
									<tr class="tuesdayClass">
										<td></td>
										<td><input type="hidden" name="hidden"
											value="${index.index}"></td>
										<td>${i.schContent }</td>
									</tr>
								</c:if>
							</c:forEach>

							<tr>
								<td></td>
								<td class="wedName">#Wednesday</td>
								<td></td>

								<c:forEach items="${wlist}" var="i" varStatus="index">
									<c:if test="${i.day eq '수요일'}">
										<tr class="wednesdayClass">
											<td></td>
											<td><input type="hidden" name="hidden"
												value="${index.index}"></td>
											<td>${i.schContent }</td>
										</tr>
									</c:if>
								</c:forEach>
							<tr>
								<td></td>
								<td>#Thursday</td>
								<td></td>
							</tr>

							<c:forEach items="${wlist}" var="i" varStatus="index">
								<c:if test="${i.day eq '목요일'}">
									<tr class="thursdayClass">
										<td></td>
										<td><input type="hidden" name="hidden"
											value="${index.index}"></td>
										<td>${i.schContent }</td>
									</tr>
								</c:if>
							</c:forEach>

							<tr>
								<td></td>
								<td>#Friday</td>
								<td></td>
							</tr>

							<c:forEach items="${wlist}" var="i" varStatus="index">
								<c:if test="${i.day eq '금요일'}">
									<tr class="FridayClass">
										<td></td>
										<td><input type="hidden" name="hidden"
											value="${index.index}"></td>
										<td>${i.schContent }</td>
									</tr>
								</c:if>
							</c:forEach>


							<tr>
								<td></td>
								<td>#Saturday</td>
								<td></td>
							</tr>

							<c:forEach items="${wlist}" var="i" varStatus="index">
								<c:if test="${i.day eq '토요일'}">
									<tr class="saturdayClass">
										<td></td>
										<td><input type="hidden" name="hidden"
											value="${index.index}"></td>
										<td>${i.schContent }</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>

					<br>
					<div id=chButton>
						<button type='button' class='btn btn-primary updeleteButton'>수정</button>
						<button type='button' class='btn btn-primary insertButton'>추가</button>
					</div>
				</center>
			</div>
		</div>
	</div>
	</section></section>

</body>
</html>