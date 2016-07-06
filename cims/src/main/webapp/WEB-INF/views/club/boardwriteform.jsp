<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${initParam.root}assets/css/jquery-ui.css">
<%-- <link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/jquery-ui.min.css"> --%>
<script type="text/javascript"
	src="${initParam.root}assets/js/jquery-ui.js"></script>
<%-- <script type="text/javascript" src="${initParam.root}resources/js/jquery-ui.min.js"></script> --%>
<script type="text/javascript">
	$(document).ready(
					function() {
						$("#registerBtn").click(								
										function() {
											var dateType = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
											if ($("#clubBoardTitle").val() == "") {
												alert("제목을 입력하세요!");
											} else if ($("#date").val() == "") {
												alert("날짜를 선택하세요!");
											} else if (!dateType.test($("#date").val())) {
												alert("날짜 형식을 확인하세요. ( YY-MM-DD )");
											} else if ($("#clubBoardMaxPeople").val() == "") {
												alert("최대 인원을 입력해주세요!");
											} else if (!$.isNumeric($("#clubBoardMaxPeople").val())) {
												alert("최대 인원을 숫자만 입력하세요!");
											} else if ($("#clubBoardContent").val() == "") {
												alert("내용을 입력하세요!");
											} else {
												$("#clubBoardWriteForm").submit();
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

						$("#mainBtn").click(
							function() {
								location.href = "${initParam.root}club_boardList.do?page=1";
						});
					});
</script>
<section id="main-content">
	<section class="wrapper">
		<div class="marginDocWrite">
			<div class="content-panel">
				
					<form action="${initParam.root}club_boardWrite.do" method="post"
						id="clubBoardWriteForm">
						<table class="table">
							<thead>
								<tr>
									<td colspan="2"><h3>&nbsp;<i class="fa fa-angle-right"></i> Club Board Write</h3></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Title</td>
									<td colspan="3"><input type="text" name="clubBoardTitle" id="clubBoardTitle"></td>
								</tr>
								<tr>
									<td>ClubName</td>
									<td colspan="3"><select name="clubName">
											<c:forEach items="${requestScope.clubList}" var="list">
												<option value="${list.clubName}">${list.clubName}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td>D-Day</td>
									<td><input type="text" class="datepicker" id="date" name="clubBoardDate"></td>
									<td>Limited personnel &nbsp;<input type="text" name="clubBoardMaxPeople" placeholder="ex) 10" id="clubBoardMaxPeople"></td>
								</tr>
								<tr>
									<td>Content</td>
									<td colspan="4">
										<textarea cols="80" rows="15" name="clubBoardContent" id="clubBoardContent" class="form-control"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<div align="center">
							<input type="button" class="btn btn-primary" value="register" id="registerBtn">
							<input type="button" id="mainBtn" class="btn btn-success" value="main">
						</div>
					</form>
				
			</div>
		</div>
	</section>
</section>









