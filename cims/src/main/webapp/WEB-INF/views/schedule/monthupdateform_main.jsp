<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"href="${initParam.root}assets/css/jquery-ui.css">
<script type="text/javascript" src="${initParam.root}assets/js/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(
					function() {
						$("#registerBtn").click(
										function() {
											var dateType = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
											if ($("#schDay").val() == "") {
												alert("날짜를 선택하세요!");
											}else if (!dateType.test($("#schDay").val())) {
												alert("날짜 형식을 확인하세요. ( YY-MM-DD )");
											} else if ($("#schContent").val() == "") {
												alert("내용을 입력하세요!");
											} else {
												//$("#MonthWriteForm").submit();
											}
										});
						$(".datepicker").datepicker();
						var nowDate = new Date();
						$.datepicker.regional['ko'] = {
							closeText : 'close',
							prevText : '이전달',
							nextText : '다음달',
							currentText : 'today',
							monthNames : [ '년 1 월(JAN)', '년 2 월(FEB)',
									'년 3 월(MAR)', '년 4 월(APR)', '년 5 월(MAY)',
									'년 6 월(JUN)', '년 7 월(JUL)', '년 8 월(AUG)',
									'년 9 월(SEP)', '년 10 월(OCT)', '년 11 월(NOV)',
									'년 12 월(DEC)' ],
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
							dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							weekHeader : 'Wk',
							dateFormat : 'yy-mm-dd',
							firstDay : 0,
							isRTL : false,
							showMonthAfterYear : true,
							yearSuffix : '',
							showOn : 'both',
							//buttonText: "달력",
							//buttonImage:'${initParam.root}resources/image/calendar-1.jpg',
							buttonImageOnly : false,
							yearRange : ':c+10',
							minDate : nowDate,
							showButtonPanel : false,
							changeMonth : false,
							changeYear : false,
						};
						$.datepicker.setDefaults($.datepicker.regional['ko']);

						$("#cancelBtn").click(
								function() {
									location.href = "${initParam.root}sch_monthList.do?month="+${month};
							});
					});
</script>
<section id="main-content">
	<section class="wrapper">
		<div class="marginDocWrite">
			<div class="content-panel">
				
					<form action="${initParam.root}sch_monthUpdate.do?month=${month}" method="post" id="MonthWriteForm">
						<table class="table">
							<thead>
								<tr>
									<td><h3>&nbsp;<i class="fa fa-angle-right"></i> Month Update</h3></td>
								</tr>
							</thead>
							<tbody>							
									
								<tr>
									<td width="20%"><h4>Day</h4></td>
									<td>
									<input type="text" class="datepicker" id="schDay" name="schDay" value="${scvo.schDay}"></td>
								</tr>
								<tr>
									<td><h4>Content</h4></td>
									<td>
										<textarea cols="30" rows="5" name="schContent" id="schContent" class="form-control">${scvo.schContent}</textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<div align="center">
							<input type="submit" class="btn btn-primary" value="Update" id="updateBtn">
							<input type="button" id="cancelBtn" class="btn btn-warning" value="cancel">
						</div>
						<input type="hidden" value="${scvo.schNo}" name="schNo">
						<input type="hidden" value="${scvo.empNo}" name="empNo">
					</form>
			</div>
		</div>
	</section>
</section>









