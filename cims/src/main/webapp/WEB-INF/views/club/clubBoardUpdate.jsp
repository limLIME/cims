<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${initParam.root}assets/css/jquery-ui.css">
   <%-- <link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/jquery-ui.min.css"> --%>
   <script type="text/javascript" src="${initParam.root}assets/js/jquery-ui.js"></script>
   <%-- <script type="text/javascript" src="${initParam.root}resources/js/jquery-ui.min.js"></script> --%>
<script type="text/javascript">
$(document).ready(function(){
	$("#updateBtn").click(function(){ 
		if($("#clubBoardTitle").val()==""){
			alert("제목을 입력하세요!");
		}else if($("#date").val()==""){
			alert("날짜를 선택하세요!");
		}else if($("#clubBoardMaxPeople").val()==""){
			alert("최대 인원을 입력해주세요!");
		}else if(!$.isNumeric($("#clubBoardMaxPeople").val())){
			alert("최대 인원을 숫자만 입력하세요!");
		}else if($("#clubBoardContent").val()==""){
			alert("내용을 입력하세요!");
		}else{
			$("#clubBoardUpdateForm").submit();
		}
	});
	
	
	$(".datepicker").datepicker(); 
	 var nowDate = new Date();
    $.datepicker.regional['ko'] = {
       closeText: 'close',
        prevText: '이전달',
        nextText: '다음달',
        currentText: 'today',
        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
                    '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        weekHeader: 'Wk',
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '',
        showOn: 'both',
        //buttonText: "달력",
        //buttonImage:'${initParam.root}resources/image/calendar-1.jpg',
        buttonImageOnly: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
          yearRange: ':c+10',
          minDate: nowDate,
          showButtonPanel: false,
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    
	$("#mainBtn").click(function(){
		location.href="${initParam.root}club_boardList.do?page=1";
	});
 });
</script>
<section id="main-content">
<section class="wrapper">
<div class="marginDocWrite">
<div class="content-panel">
<h3>&nbsp;<i class="fa fa-angle-right"></i> Club Board Write</h3>
<center>
<form action="${initParam.root}club_boardUpdate.do?clubBoardNo=${cbvo.clubBoardNo}" method="post" id="clubBoardUpdateForm">
	<table class="table">
		<tbody>
			<tr>
				<td>Title</td><td colspan="3"><input type="text" name="clubBoardTitle" id="clubBoardTitle" value="${cbvo.clubBoardTitle}"></td>
			</tr>
			<tr>
			  <td>ClubName</td><td colspan="3">
					<input type="text" value="${cbvo.clubVO.clubName }" name="clubName" readonly="readonly">
            </td>			
			</tr>
			<tr>
				<td>D-Day</td><td><input type="text" class="datepicker" id="date" name="clubBoardDate" value = "${cbvo.clubBoardDate }"></td>
				<td>Limited personnel &nbsp;<input type="text" name="clubBoardMaxPeople" placeholder="${cbvo.clubBoardMaxPeople }" id="clubBoardMaxPeople"></td>
			</tr>
			<tr>
				<td>Content</td>
				<td colspan="4"><textarea cols="80" rows="15" name="clubBoardContent" id="clubBoardContent" >${cbvo.clubBoardContent }</textarea></td>
			</tr>	
		</tbody>	
	</table>
	<div>
			<input type="button" class="btn btn-primary" value="update" id="updateBtn">
			<input type="button" id="mainBtn"  class="btn btn-success" value="main">
	</div>
</form>
</center></div></div></section></section>









