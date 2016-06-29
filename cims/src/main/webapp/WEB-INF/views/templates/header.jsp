<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <c:if test="${evo == null}">
    	<script>
    		alert("세션이 만료되었습니다. 다시 로그인 해주십시오");
    		location.href="${initParam.root}index2.jsp";
    	</script>
    </c:if>
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="${initParam.root}home.do" class="logo"><b>CLASS:sexy</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                
                
                <!--     settings start
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-tasks"></i>
                            <span class="badge bg-theme">4</span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">You have 4 pending tasks</p>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">DashGum Admin Panel</div>
                                        <div class="percent">40%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">Database Update</div>
                                        <div class="percent">60%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">Product Development</div>
                                        <div class="percent">80%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <div class="task-info">
                                        <div class="desc">Payments Sent</div>
                                        <div class="percent">70%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                            <span class="sr-only">70% Complete (Important)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="external">
                                <a href="#">See All Tasks</a>
                            </li>
                        </ul>
                    </li> -->
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    <!-- <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge bg-theme">5</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-zac.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Zac Snider</span>
                                    <span class="time">Just now</span>
                                    </span>
                                    <span class="message">
                                        Hi mate, how is everything?
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Divya Manian</span>
                                    <span class="time">40 mins.</span>
                                    </span>
                                    <span class="message">
                                     Hi, I need your help with this.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-danro.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Dan Rogers</span>
                                    <span class="time">2 hrs.</span>
                                    </span>
                                    <span class="message">
                                        Love your new Dashboard.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-sherman.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Dj Sherman</span>
                                    <span class="time">4 hrs.</span>
                                    </span>
                                    <span class="message">
                                        Please, answer asap.
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="index.html#">See all messages</a>
                            </li>
                        </ul>
                    </li>
                    inbox dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
                <div class="top-menu">
               <ul class="nav pull-right top-menu">
                    <li><a class="logout" href="${initParam.root }emp_logout.do">Logout</a></li>
               </ul>
            </div>
        </header>
        
        
<%--   <script type="text/javascript">
    $(document).ready(function() {
      if(${evo==null}){
         location.href="index.jsp";
      }
      
   });
    </script>
<Table>
	<tr>
		<td width="60%">
			<ul class="nav nav-tabs">
				<c:choose>
					<c:when test="${head==1}">
						<li class="active"><a href="${initParam.root}home.do"
							data-toggle="tab" aria-expanded="false">Home</a></li>
						<li class=""><a href="${initParam.root}doc_waitingMySign.do?page=1"
							data-toggle="tab" aria-expanded="false">결재</a></li>
						<li class=""><a href="${initParam.root}sch_home.do"
							data-toggle="tab" aria-expanded="false">일정관리</a></li>
						<li class=""><a href="${initParam.root}free_boardList.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">게시판</a></li>
						<li class=""><a href="${initParam.root}notice_notice.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">공지사항</a></li>
					</c:when>
					<c:when test="${head==2}">
						<li class=""><a href="${initParam.root}home.do"
							data-toggle="tab" aria-expanded="false">Home</a></li>
						<li class="active"><a href="${initParam.root}doc_waitingMySign.do?page=1"
							data-toggle="tab" aria-expanded="false">결재</a></li>
						<li class=""><a href="${initParam.root}sch_home.do"
							data-toggle="tab" aria-expanded="false">일정관리</a></li>
						<li class=""><a href="${initParam.root}free_boardList.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">게시판</a></li>
						<li class=""><a href="${initParam.root}notice_notice.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">공지사항</a></li>
					</c:when>
					<c:when test="${head==3}">
						<li class=""><a href="${initParam.root}home.do"
							data-toggle="tab" aria-expanded="false">Home</a></li>
						<li class=""><a href="${initParam.root}doc_waitingMySign.do?page=1"
							data-toggle="tab" aria-expanded="false">결재</a></li>
						<li class="active"><a href="${initParam.root}sch_home.do"
							data-toggle="tab" aria-expanded="false">일정관리</a></li>
						<li class=""><a href="${initParam.root}free_boardList.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">게시판</a></li>
						<li class=""><a href="${initParam.root}notice_notice.do?pageNo=1" data-toggle="tab"
							aria-expanded="false">공지사항</a></li>
					</c:when>
				</c:choose>
				<!-- <li class="disabled"><a>Disabled</a></li> -->
				<!-- 		드롭박스부분
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> Dropdown <span class="caret"></span>
					</a>
					
						<ul class="dropdown-menu">
							<li><a href="#dropdown1" data-toggle="tab">Action</a></li>
							<li class="divider"></li>
							<li><a href="#dropdown2" data-toggle="tab">Another
									action</a></li>
						</ul></li> -->
			</ul>
		</td>
		<td width="32%"
			background="${initParam.root}resources/css/home_back.png"></td>
		<td width="8%"
			background="${initParam.root}resources/css/home_back.png"><a
			href="update.do">${evo.empName}</a>님</td>
	</tr>
</Table> --%>
