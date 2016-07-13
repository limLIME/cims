<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">

			<p class="centered">
				<a href="${initParam.root}emp_updateform.do">
				<img src="upload/sign/${evo.empPath }"class="img-circle"  height="100" width="100"></a>
			</p>
			<c:choose>
			<c:when test="${evo.positionVO.positionNo==100}">
			<h5 class="centered">${evo.empName}</h5>
			</c:when>
			<c:otherwise>
			<h5 class="centered">${evo.departmentVO.deptName}  ${evo.positionVO.positionName}  ${evo.empName}</h5>
			</c:otherwise>
			</c:choose>
			

<!-- home 시작 -->
			<li class="mt"><c:choose>
					<c:when test="${left==1}">
						<a class="active" href="${initParam.root}home.do?pageNo=1"><i
							class="fa fa-home"></i> <span>Home</span> </a>
					</c:when>
					<c:otherwise>
						<a href="${initParam.root}home.do?pageNo=1"><i class="fa fa-home"></i>
							<span>Home</span> </a>
					</c:otherwise>
				</c:choose></li>
<!-- home 끝-->
<!-- 공지사항 시작 -->
			<li class="sub-menu">
			<c:choose>
					<c:when test="${left==2}">
					<a class="active" href="${initParam.root}notice_notice.do?pageNo=1"> 
					<i class="fa fa-bullhorn"></i> <span>Notice</span></a>
					</c:when>
					<c:otherwise>
					<a href="${initParam.root}notice_notice.do?pageNo=1"> 
					<i class="fa fa-bullhorn"></i> <span>Notice</span></a>
					</c:otherwise>
				</c:choose></li>
<!-- 공지사항 끝 -->

	<!-- 전자메일 시작 -->
			<li class="sub-menu">
			
			<c:choose>
			<c:when test="${left==3 || left==4 || left==5 || left==6}">
			<a class="active" href="javascript:;"> <i class="fa fa-envelope-o"></i> <span>Mail</span></a>
			</c:when>
			<c:otherwise>
			<a href="javascript:;"> <i class="fa fa-envelope-o"></i> <span>Mail</span></a>
			</c:otherwise>
			</c:choose>
			
				<c:choose>
				<c:when test="${left==3 }">
				<ul class="sub">
					<li class="active"><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">Receive MailBox</a></li>
					<li><a href="${initParam.root}mail_getSendList.do?pageNo=1">Send MailBox</a></li>
					<li><a href="${initParam.root}mail_getCheckList.do?pageNo=1">Reception Status</a></li>
				</ul>
				</c:when>
				<c:when test="${left==4 }">
				<ul class="sub">
					<li><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li class="active"><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">Receive MailBox</a></li>
					<li><a href="${initParam.root}mail_getSendList.do?pageNo=1">Send MailBox</a></li>
					<li><a href="${initParam.root}mail_getCheckList.do?pageNo=1">Reception Status</a></li>
				</ul>
				</c:when>
				<c:when test="${left==5 }">
				<ul class="sub">
					<li><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">Receive MailBox</a></li>
					<li class="active"><a href="${initParam.root}mail_getSendList.do?pageNo=1">Send MailBox</a></li>
					<li><a href="${initParam.root}mail_getCheckList.do?pageNo=1">Reception Status</a></li>
				</ul>
				</c:when>
				<c:when test="${left==6 }">
				<ul class="sub">
					<li><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">Receive MailBox</a></li>
					<li><a href="${initParam.root}mail_getSendList.do?pageNo=1">Send MailBox</a></li>
					<li class="active"><a href="${initParam.root}mail_getCheckList.do?pageNo=1">Reception Status</a></li>
				</ul>
				</c:when>
				<c:otherwise>
				<ul class="sub">
					<li><a href="${initParam.root}mail_sendForm.do">Mail Write</a></li>
					<li><a href="${initParam.root}mail_getReceiveList.do?pageNo=1">Receive MailBox</a></li>
					<li><a href="${initParam.root}mail_getSendList.do?pageNo=1">Send MailBox</a></li>
					<li><a href="${initParam.root}mail_getCheckList.do?pageNo=1">Reception Status</a></li>
				</ul>
				</c:otherwise>
				</c:choose>	
				</li>
	<!-- 전자메일끝 -->

<!-- 스케쥴 시작 -->
			<li class="sub-menu">
			<c:choose>
			<c:when test="${left==12}">
				<a class = "active" href="javascript:;"> 
					<i class="fa fa-calendar"></i>
					<span>Schedule</span>
				</a>
					<ul class="sub">
						<li class="active"><a href="${initParam.root}sch_home.do">Today</a></li>
						<li><a href="${initParam.root}sch_month.do">Monthly</a></li>
					</ul>
				</c:when>
									
				<c:when test="${left==13}">
					<a class = "active" href="javascript:;"> 
					<i class="fa fa-calendar"></i>
					<span>Schedule</span>
				</a>
					<ul class="sub">
						<li><a href="${initParam.root}sch_home.do">Today</a></li>
						<li class="active"><a href="${initParam.root}sch_month.do">Monthly</a></li>
					</ul>	
				</c:when>	
				<c:otherwise>
				<a href="javascript:;"> 
					<i class="fa fa-calendar"></i> 
					<span>Schedule</span>
				</a>
					<ul class="sub">
						<li><a href="${initParam.root}sch_home.do">Today</a></li>
						<li><a href="${initParam.root}sch_month.do">Monthly</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			</li>
<!-- 스케쥴 끝-->

<!-- 전자결재 시작 -->				
			<li class="sub-menu">
			<c:choose>
				<c:when test="${left==19 || left ==20|| left ==21 ||left ==22 ||left==23||left==24||left==25 }">
					<a class="active" href="javascript:;"> 
					<i class="fa fa-file-o"></i> <span>Document</span></a>
				</c:when>
				<c:otherwise>
					<a href="javascript:;"> 
					<i class="fa fa-file-o"></i> <span>Document</span></a>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${left==19}">
				<ul class="sub">
					<li class="active"><a href="${initParam.root}doc_writeForm.do">Write Document</a></li>
					<li><a href="${initParam.root}doc_myDocument.do?page=1">My Document</a></li>
					<li><a href="${initParam.root}doc_waitingMySign.do?page=1">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Return</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
					<li><a href="${initParam.root}doc_waitingSubstitute.do?page=1">Substitute Sign</a></li>
					<li><a href="${initParam.root}doc_setSubstitute.do">Set Substitute</a></li>
				</ul>
				</c:when>
				<c:when test="${left==20}">
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write Document</a></li>
					<li class="active"><a href="${initParam.root}doc_myDocument.do?page=1">My Document</a></li>
					<li><a href="${initParam.root}doc_waitingMySign.do?page=1">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Return</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
					<li><a href="${initParam.root}doc_waitingSubstitute.do?page=1">Substitute Sign</a></li>
					<li><a href="${initParam.root}doc_setSubstitute.do">Set Substitute</a></li>
				</ul>
				</c:when>
				<c:when test="${left==21}">
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write Document</a></li>
					<li><a href="${initParam.root}doc_myDocument.do?page=1">My Document</a></li>
					<li class="active"><a href="${initParam.root}doc_waitingMySign.do?page=1">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Return</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
					<li><a href="${initParam.root}doc_waitingSubstitute.do?page=1">Substitute Sign</a></li>
					<li><a href="${initParam.root}doc_setSubstitute.do">Set Substitute</a></li>
				</ul>
				</c:when>
				<c:when test="${left==22}">
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write Document</a></li>
					<li><a href="${initParam.root}doc_myDocument.do?page=1">My Document</a></li>
					<li><a href="${initParam.root}doc_waitingMySign.do?page=1">Waiting</a></li>
					<li class="active"><a href="${initParam.root}doc_returnMain.do?page=1">Return</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
					<li><a href="${initParam.root}doc_waitingSubstitute.do?page=1">Substitute Sign</a></li>
					<li><a href="${initParam.root}doc_setSubstitute.do">Set Substitute</a></li>
				</ul>
				</c:when>
				<c:when test="${left==23}">
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write Document</a></li>
					<li><a href="${initParam.root}doc_myDocument.do?page=1">My Document</a></li>
					<li><a href="${initParam.root}doc_waitingMySign.do?page=1">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Return</a></li>
					<li class="active"><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
					<li><a href="${initParam.root}doc_waitingSubstitute.do?page=1">Substitute Sign</a></li>
					<li><a href="${initParam.root}doc_setSubstitute.do">Set Substitute</a></li>
				</ul>
				</c:when>
				<c:when test="${left==24}">
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write Document</a></li>
					<li><a href="${initParam.root}doc_myDocument.do?page=1">My Document</a></li>
					<li><a href="${initParam.root}doc_waitingMySign.do?page=1">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Return</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
					<li class="active"><a href="${initParam.root}doc_waitingSubstitute.do?page=1">Substitute Sign</a></li>
					<li><a href="${initParam.root}doc_setSubstitute.do">Set Substitute</a></li>
				</ul>
				</c:when>
				<c:when test="${left==25}">
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write Document</a></li>
					<li><a href="${initParam.root}doc_myDocument.do?page=1">My Document</a></li>
					<li><a href="${initParam.root}doc_waitingMySign.do?page=1">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Return</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
					<li><a href="${initParam.root}doc_waitingSubstitute.do?page=1">Substitute Sign</a></li>
					<li class="active"><a href="${initParam.root}doc_setSubstitute.do">Set Substitute</a></li>
				</ul>
				</c:when>
				<c:otherwise>
				<ul class="sub">
					<li><a href="${initParam.root}doc_writeForm.do">Write Document</a></li>
					<li><a href="${initParam.root}doc_myDocument.do?page=1">My Document</a></li>
					<li><a href="${initParam.root}doc_waitingMySign.do?page=1">Waiting</a></li>
					<li><a href="${initParam.root}doc_returnMain.do?page=1">Return</a></li>
					<li><a href="${initParam.root}doc_completeMain.do?page=1">Complete</a></li>
					<li><a href="${initParam.root}doc_waitingSubstitute.do?page=1">Substitute Sign</a></li>
					<li><a href="${initParam.root}doc_setSubstitute.do">Set Substitute</a></li>
				</ul>
				</c:otherwise>
				</c:choose>
				
				</li>
		<!-- 전자결재 끝-->	
		
			
				
	<!-- 결산 시작 -->
			<li class="sub-menu">
              <c:choose>
               <c:when test="${left==29}">
               <a class = "active"  href="javascript:;"> <i class="fa fa-asterisk"></i> <span>Evaluation</span></a>
            <ul class="sub">
               <c:choose>
               <c:when test="${evo.positionVO.positionNo==5}">
               <li class="active"><a href="${initParam.root}evaluation_evaluationListByDept.do?pageNo=1">Total Evaluation</a></li>
               </c:when>
               <c:otherwise>
               <li><a href="${initParam.root}evaluation_todayEvaluationPage.do">Today's Evaluation</a></li>
               <li><a href="${initParam.root}evaluation_evaluationList.do?pageNo=1">Evaluation Details</a></li>
               </c:otherwise>
               </c:choose>
            </ul>
               </c:when>
               
               <c:when test="${left==30}">
               <a class = "active"  href="javascript:;"> <i class="fa fa-asterisk"></i> <span>Evaluation</span></a>
            <ul class="sub">
               <c:choose>
               <c:when test="${evo.positionVO.positionNo==5}">
               <li><a href="${initParam.root}evaluation_evaluationListByDept.do?pageNo=1">Total Evaluation</a></li>
               </c:when>
               <c:otherwise>
               <li class = "active" ><a href="${initParam.root}evaluation_todayEvaluationPage.do">Today's Evaluation</a></li>
               <li><a href="${initParam.root}evaluation_evaluationList.do?pageNo=1">Evaluation Details</a></li>
               </c:otherwise>
               </c:choose>
            </ul>
               </c:when>
               
                <c:when test="${left==31}">
               <a class = "active"  href="javascript:;"> <i class="fa fa-asterisk"></i> <span>Evaluation</span></a>
            <ul class="sub">
               <c:choose>
               <c:when test="${evo.positionVO.positionNo==5}">
               <li><a href="${initParam.root}evaluation_evaluationListByDept.do?pageNo=1">Total Evaluation</a></li>
               </c:when>
               <c:otherwise>
               <li><a href="${initParam.root}evaluation_todayEvaluationPage.do">Today's Evaluation</a></li>
               <li class = "active"><a href="${initParam.root}evaluation_evaluationList.do?pageNo=1">Evaluation Details</a></li>
               </c:otherwise>
               </c:choose>
            </ul>
               </c:when>
               <c:otherwise>
                  <a href="javascript:;"> <i class="fa fa-asterisk"></i> <span>Evaluation</span></a>
            	<ul class="sub">
               <c:choose>
               <c:when test="${evo.positionVO.positionNo==5}">
               <li><a href="${initParam.root}evaluation_evaluationListByDept.do?pageNo=1">Integrated Evaluation Details</a></li>
               </c:when>
               <c:otherwise>
               <li><a href="${initParam.root}evaluation_todayEvaluationPage.do">Today's Evaluation</a></li>
               <li><a href="${initParam.root}evaluation_evaluationList.do?pageNo=1">Evaluation Details</a></li>
               </c:otherwise>
               </c:choose>
            </ul>
               </c:otherwise>
            </c:choose>
            </li>
			<!-- 결산 끝 -->
			
         		
<!-- 보드  시작 -->
			<li class="sub-menu">
				<c:choose>
					<c:when test="${left==36}">
					<a class = "active"  href="javascript:;"> <i class="fa  fa-comments-o"></i> <span>Board</span></a>
				<ul class="sub">
					<li class = "active" ><a href="${initParam.root}free_boardList.do?pageNo=1">FreeBoard</a></li>
					<li><a href="${initParam.root}rec_boardList.do?pageNo=1">Recommendations</a></li>
				</ul>
					</c:when>
					<c:when test="${left==37}">
					<a class = "active"  href="javascript:;"> <i class="fa  fa-comments-o"></i> <span>Board</span></a>
				<ul class="sub">
					<li><a href="${initParam.root}free_boardList.do?pageNo=1">FreeBoard</a></li>
					<li class = "active" ><a href="${initParam.root}rec_boardList.do?pageNo=1">Recommendations</a></li>
				</ul>
					</c:when>
					<c:otherwise>
						<a href="javascript:;"> <i class="fa  fa-comments-o"></i> <span>Board</span></a>
				<ul class="sub">
					<li><a href="${initParam.root}free_boardList.do?pageNo=1">FreeBoard</a></li>
					<li><a href="${initParam.root}rec_boardList.do?pageNo=1">Recommendations</a></li>
				</ul>
					</c:otherwise>
				</c:choose>
				</li>
<!-- 보드끝 -->		
         		
         		
         	<!-- 조직도 시작 -->
         <li class="sub-menu">
			<c:choose>
					<c:when test="${left==43}">
					<a class="active" href="${initParam.root}emp_searchemp.do"> 
					<i class="fa fa-group"></i> <span>Organization Chart</span></a>
					</c:when>
					<c:otherwise>
					<a href="${initParam.root}emp_searchemp.do"> 
					<i class="fa fa-group"></i> <span>Organization Chart</span></a>
					</c:otherwise>
				</c:choose>
		 </li>
				
				
				
         	<!-- 조직도끝 -->
         	        		
         		
         		
         <!-- club의 시작 -->
         <li class="sub-menu">
         
         <c:choose>
         <c:when test="${left==44 || left==45 }">
         <a class="active" href="javascript:;"> <i class="fa fa-dribbble"></i> <span>Club</span></a>
         </c:when>
         <c:otherwise>
         <a href="javascript:;"> <i class="fa fa-dribbble"></i> <span>Club</span></a>
         </c:otherwise>
         </c:choose>
         <c:choose>
         <c:when test="${left==44}">
            <ul class="sub">
               <li class="active"><a href="${initParam.root}club_List.do?pageNo=1">ClubList</a></li>
               <li><a href="${initParam.root}club_boardList.do?page=1">Club Board</a></li>         
            </ul>
            </c:when>
            <c:when test="${left==45}">
            <ul class="sub">
               <li><a href="${initParam.root}club_List.do?pageNo=1">ClubList</a></li>
               <li class="active"><a href="${initParam.root}club_boardList.do?page=1">Club Board</a></li>         
            </ul>
            </c:when>
            <c:otherwise>
            <ul class="sub">
               <li><a href="${initParam.root}club_List.do?pageNo=1">ClubList</a></li>
               <li><a href="${initParam.root}club_boardList.do?page=1">Club Board</a></li>
            </ul>
            </c:otherwise>
            </c:choose>
            </li><!-- club끝 -->
            
            
                       		
         		
         <!-- Management시작 -->
         <c:if test="${evo.positionVO.positionNo==100 }">

			<li class="sub-menu">
			
			<c:choose>
			<c:when test="${left==51 || left==52 }">
			<a class="active" href="javascript:;"> <i class="fa fa-th"></i> <span>Management</span></a>
			</c:when>
			<c:otherwise>
			<a href="javascript:;"> <i class="fa fa-th"></i> <span>Management</span></a>
			</c:otherwise>
			</c:choose>
				
				<c:choose>
				<c:when test="${left==51}">
				<ul class="sub">
					
              	 	<li class="active"><a href="${initParam.root}emp_adminUpdateSearch.do">Admin Update</a></li>
             	  	<li><a href="${initParam.root}emp_registerform.do">Register</a></li>
				</ul>
				</c:when>
				<c:when test="${left==52}">
				<ul class="sub">
					
              	 	<li><a href="${initParam.root}emp_adminUpdateSearch.do">Admin Update</a></li>
             	  	<li  class="active"><a href="${initParam.root}emp_registerform.do">Register</a></li>
             	  </ul>
				</c:when>
				<c:otherwise>
				<ul class="sub">
              	 	<li><a href="${initParam.root}emp_adminUpdateSearch.do">Admin Update</a></li>
             	  	<li ><a href="${initParam.root}emp_registerform.do">Register</a></li>
				</ul>
				</c:otherwise>
				</c:choose>
				</li> 
				</c:if>
				  <!-- Mangement끝 -->
				  	<!-- 화면잠금 시작 -->
            
		    <li class="sub-menu">
		    <a href="${initParam.root}lock_lock_screen.do"> 
		   	 <i class="fa  fa-lock"></i> <span>Lock</span>
            </a>
         	</li><!-- 화면잠금끝 -->
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