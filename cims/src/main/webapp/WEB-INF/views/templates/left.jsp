<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">

			<p class="centered">
				<a href="profile.html"><img src="assets/img/ui-sam.jpg"
					class="img-circle" width="60"></a>
			</p>
			<h5 class="centered">${evo.empName}</h5>


			<li class="mt"><c:choose>
					<c:when test="${left==1}">
						<a class="active" href="${initParam.root}home.do"><i
							class="fa fa-dashboard"></i> <span>MainPage</span> </a>
					</c:when>
					<c:otherwise>
						<a href="${initParam.root}home.do"><i class="fa fa-dashboard"></i>
							<span>MainPage</span> </a>
					</c:otherwise>
				</c:choose></li>

			<li class="sub-menu">
			<c:choose>
					<c:when test="${left==2}">
					<a class="active" href="${initParam.root}notice_notice.do?pageNo=1"> 
					<i class="fa fa-dashboard"></i> <span>Notice Board</span></a>
					</c:when>
					<c:otherwise>
					<a href="${initParam.root}notice_notice.do?pageNo=1"> 
					<i class="fa fa-dashboard"></i> <span>Notice Board</span></a>
					</c:otherwise>
				</c:choose></li>

			<li class="sub-menu">
			<c:choose>
			<c:when test="${left==3}">
				<a class = "active" href="javascript:;"> 
					<i class="fa fa-desktop"></i>
					<span>Schedule</span>
				</a>
					<ul class="sub">
						<li class="active"><a href="${initParam.root}sch_home.do">Today</a></li>
						<li><a href="${initParam.root}sch_week.do">Weekly</a></li>
						<li><a href="${initParam.root}sch_month.do">Monthly</a></li>
					</ul>
				</c:when>
				
				<c:when test="${left==4}">
					<a class = "active" href="javascript:;"> 
					<i class="fa fa-desktop"></i>
					<span>Schedule</span>
				</a>
					<ul class="sub">
						<li><a href="${initParam.root}sch_home.do">Today</a></li>
						<li class="active"><a href="${initParam.root}sch_week.do">Weekly</a></li>
						<li><a href="${initParam.root}sch_month.do">Monthly</a></li>
					</ul>	
				</c:when>
				
				<c:when test="${left==5}">
					<a class = "active" href="javascript:;"> 
					<i class="fa fa-desktop"></i>
					<span>Schedule</span>
				</a>
					<ul class="sub">
						<li><a href="${initParam.root}sch_home.do">Today</a></li>
						<li><a href="${initParam.root}sch_week.do">Weekly</a></li>
						<li class="active"><a href="${initParam.root}sch_month.do">Monthly</a></li>
					</ul>	
				</c:when>	
				<c:otherwise>
				<a href="javascript:;"> 
					<i class="fa fa-desktop"></i> 
					<span>Schedule</span>
				</a>
					<ul class="sub">
						<li ><a href="${initParam.root}sch_home.do">Today</a></li>
						<li><a href="${initParam.root}sch_week.do">Weekly</a></li>
						<li><a href="${initParam.root}sch_month.do">Monthly</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			</li>

			<li class="sub-menu">
				<c:choose>
					<c:when test="${left==6}">
					<a class = "active"  href="javascript:;"> <i class="fa fa-cogs"></i> <span>Board</span></a>
				<ul class="sub">
					<li class = "active" ><a href="${initParam.root}free_boardList.do?pageNo=1">FreeBoard</a></li>
					<li><a href="${initParam.root}rec_boardList.do?pageNo=1">Recommendations</a></li>
				</ul>
					</c:when>
					<c:when test="${left==7}">
					<a class = "active"  href="javascript:;"> <i class="fa fa-cogs"></i> <span>Board</span></a>
				<ul class="sub">
					<li><a href="${initParam.root}free_boardList.do?pageNo=1">FreeBoard</a></li>
					<li class = "active" ><a href="${initParam.root}rec_boardList.do?pageNo=1">Recommendations</a></li>
				</ul>
					</c:when>
					<c:otherwise>
						<a href="javascript:;"> <i class="fa fa-cogs"></i> <span>Board</span></a>
				<ul class="sub">
					<li><a href="${initParam.root}free_boardList.do?pageNo=1">FreeBoard</a></li>
					<li><a href="${initParam.root}rec_boardList.do?pageNo=1">Recommendations</a></li>
				</ul>
					</c:otherwise>
				</c:choose>
				</li>
				
				
			<li class="sub-menu">
			<c:choose>
				<c:when test="${left==8 || left ==9|| left ==10 ||left ==11}">
					<a class="active" href="javascript:;"> 
					<i class="fa fa-book"></i> <span>Document</span></a>
				</c:when>
				<c:otherwise>
					<a href="javascript:;"> 
					<i class="fa fa-book"></i> <span>Document</span></a>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${left==8}">
				<ul class="sub">
					<li class="active"><a href="${initParam.root}doc_writeForm.do">Write </a></li>
					<li><a href="${initParam.root}doc_waitingMain.do?page=1 ">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Retrun</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
				</ul>
				</c:when>
				<c:when test="${left==9}">
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write </a></li>
					<li class="active"><a href="${initParam.root}doc_waitingMain.do?page=1 ">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Retrun</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
				</ul>
				</c:when>
				<c:when test="${left==10}">
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write </a></li>
					<li><a href="${initParam.root}doc_waitingMain.do?page=1 ">Waiting</a></li>
					<li class="active"><a href="${initParam.root}doc_returnMain.do?page=1">Retrun</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
				</ul>
				</c:when>
				<c:when test="${left==11}">
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write </a></li>
					<li><a href="${initParam.root}doc_waitingMain.do?page=1 ">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Retrun</a></li>
					<li class="active"><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
				</ul>
				</c:when>
				<c:otherwise>
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write </a></li>
					<li><a href="${initParam.root}doc_waitingMain.do?page=1 ">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Retrun</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
				</ul>
				</c:otherwise>
			</c:choose>
				</li>
				
			
			<li class="sub-menu">
			
			<c:choose>
			<c:when test="${left==12 || left==13 || left==14 || left==15}">
			<a class="active" href="javascript:;"> <i class="fa fa-th"></i> <span>Mail</span></a>
			</c:when>
			<c:otherwise>
			<a href="javascript:;"> <i class="fa fa-th"></i> <span>Mail</span></a>
			</c:otherwise>
			</c:choose>
			
				<c:choose>
				<c:when test="${left==12 }">
				<ul class="sub">
					<li class="active"><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">받은메일함</a></li>
					<li><a href="${initParam.root}mail_getSendList.do?pageNo=1">보낸메일함</a></li>
					<li><a href="${initParam.root}mail_getCheckList.do?pageNo=1">수신확인</a></li>
				</ul>
				</c:when>
				<c:when test="${left==13 }">
				<ul class="sub">
					<li><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li class="active"><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">받은메일함</a></li>
					<li><a href="${initParam.root}mail_getSendList.do?pageNo=1">보낸메일함</a></li>
					<li><a href="${initParam.root}mail_getCheckList.do?pageNo=1">수신확인</a></li>
				</ul>
				</c:when>
				<c:when test="${left==14 }">
				<ul class="sub">
					<li><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">받은메일함</a></li>
					<li class="active"><a href="${initParam.root}mail_getSendList.do?pageNo=1">보낸메일함</a></li>
					<li><a href="${initParam.root}mail_getCheckList.do?pageNo=1">수신확인</a></li>
				</ul>
				</c:when>
				<c:when test="${left==15 }">
				<ul class="sub">
					<li><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">받은메일함</a></li>
					<li><a href="${initParam.root}mail_getSendList.do?pageNo=1">보낸메일함</a></li>
					<li class="active"><a href="${initParam.root}mail_getCheckList.do?pageNo=1">수신확인</a></li>
				</ul>
				</c:when>
				<c:otherwise>
				<ul class="sub">
					<li><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">받은메일함</a></li>
					<li><a href="${initParam.root}mail_getSendList.do?pageNo=1">보낸메일함</a></li>
					<li><a href="${initParam.root}mail_getCheckList.do?pageNo=1">수신확인</a></li>
				</ul>
				</c:otherwise>
				</c:choose>	
				</li>
				<!-- 끝 -->
				
			<!-- Employee시작 -->
			<li class="sub-menu">
			
			<c:choose>
			<c:when test="${left==16 || left==17 || left==18}">
			<a class="active" href="javascript:;"> <i class="fa fa-th"></i> <span>Employee</span></a>
			</c:when>
			<c:otherwise>
			<a href="javascript:;"> <i class="fa fa-th"></i> <span>Employee</span></a>
			</c:otherwise>
			</c:choose>
				
				<c:choose>
			<c:when test="${left==16}">
				<ul class="sub">
					<li class="active"><a href="${initParam.root}emp_updateform.do">Update</a></li>
              	 	<li><a href="${initParam.root}emp_deleteform.do">Admin Update</a></li>
             	  	<li><a href="${initParam.root}emp_registerform.do">Register</a></li>
				</ul>
				</c:when>
				<c:when test="${left==17}">
				<ul class="sub">
					<li><a href="${initParam.root}emp_updateform.do">Update</a></li>
              	 	<li class="active"><a href="${initParam.root}emp_deleteform.do">Admin Update</a></li>
             	  	<li><a href="${initParam.root}emp_registerform.do">Register</a></li>
				</ul>
				</c:when>
				<c:when test="${left==18}">
				<ul class="sub">
					<li><a href="${initParam.root}emp_updateform.do">Update</a></li>
              	 	<li><a href="${initParam.root}emp_deleteform.do">Admin Update</a></li>
             	  	<li  class="active"><a href="${initParam.root}emp_registerform.do">Register</a></li>
             	  </ul>
				</c:when>
				<c:otherwise>
				<ul class="sub">
					<li><a href="${initParam.root}emp_updateform.do">Update</a></li>
              	 	<li><a href="${initParam.root}emp_deleteform.do">Admin Update</a></li>
             	  	<li ><a href="${initParam.root}emp_registerform.do">Register</a></li>
				</ul>
				</c:otherwise>
				</c:choose>
				</li>
				
            
		         <li class="sub-menu"><a href="${initParam.root}lock_lock_screen.do"> <i
               class="fa fa-desktop"></i> <span>Lock</span>
            </a>
         		</li>

		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
<!--sidebar end-->

<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-1.8.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
	src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="assets/js/common-scripts.js"></script>

<script type="text/javascript"
	src="assets/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="assets/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="assets/js/sparkline-chart.js"></script>
<script src="assets/js/zabuto_calendar.js"></script>

<!--  위에 뜨는 div -->
<!-- 	<script type="text/javascript">
        $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Welcome to Dashgum!',
            // (string | mandatory) the text inside the notification
            text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="http://blacktie.co" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
            // (string | optional) the image to display on the left
            image: 'assets/img/ui-sam.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
        });
	</script>
 -->
<script type="application/javascript">
	
	
	
	
	
	
	
	
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    







</script>