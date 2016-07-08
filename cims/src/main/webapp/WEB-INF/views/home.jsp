<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$(".mail").click(function name() {
			location.href="${initParam.root}mail_getReceiveList.do?pageNo=1";
		})
		$(".document").click(function name() {
			location.href="${initParam.root}doc_waitingMain.do?page=1";
		})
		$(".schedule").click(function name() {
				location.href="${initParam.root}sch_home.do";
		})
		$(".notice").click(function name() {
				location.href="${initParam.root}notice_notice.do?pageNo=1";
		})
		$(".board").click(function name() {
				location.href="${initParam.root}free_boardList.do?pageNo=1";
		})
		$(".evaluation").click(function name() {
				location.href="${initParam.root}evaluation_todayEvaluationPage.do";
		})
		
	})
</script>
<section id="main-content">
	<section class="wrapper">

		<div class="row">
			<div class="col-lg-9 main-chart">
				<div class="row mt">
					<!-- SERVER STATUS PANELS -->

					<div class="col-md-4 mb mail">
						<div class="white-panel pn">
							<div class="white-header">
								<h5>Mail</h5>
							</div>
							<div class="row">
								<div class="col-sm-6 col-xs-6 goleft" style="font-size: 2em">
									<p>
										<i class="fa fa-envelope" style="font-size: 1em"></i>${mainList[0]}
									</p>
								</div>
								<div class="col-sm-6 col-xs-6"></div>
							</div>
							<div class="centered">
								<img src="assets/img/mail-icon.png" width="130">
							</div>
						</div>
					</div>
					<!-- /col-md-4 -->


					<div class="col-md-4 mb">
						<div class="white-panel pn document">
							<div class="white-header">
								<h5>Document</h5>
							</div>
							<div class="row">
								<div class="col-sm-6 col-xs-6 goleft" style="font-size: 2em">
									<p>
										<i class="fa fa-file" style="font-size: 1em"></i> ${mainList[2]}
									</p>
								</div>
								<div class="col-sm-6 col-xs-6"></div>
							</div>
							<div class="centered">
								<img src="assets/img/document-icon.png" width="130">
							</div>
						</div>
					</div>
					<!-- /col-md-4 -->

					<div class="col-md-4 mb">
						<div class="white-panel pn schedule">
							<div class="white-header">
								<h5>Schedule</h5>
							</div>
							<div class="row">
								<div class="col-sm-6 col-xs-6 goleft" style="font-size: 2em">
									<p>
										<i class="fa fa-calendar" style="font-size: 1em"></i> ${mainList[1]}
									</p>
								</div>
								<div class="col-sm-6 col-xs-6"></div>
							</div>
							<div class="centered">
								<img src="assets/img/schedule-icon.png" width="130">
							</div>
						</div>
					</div>
					<!-- /col-md-4 -->

					<div class="col-md-4 mb">
						<div class="white-panel pn notice">
							<div class="white-header">
								<h5>Notice</h5>
							</div>
							<div class="row">
								<div class="col-sm-6 col-xs-6 goleft" style="font-size: 2em">
									<p>
										<i class="fa fa-bullhorn" style="font-size: 1em"></i> ${mainList[3]}
									</p>
								</div>
								<div class="col-sm-6 col-xs-6"></div>
							</div>
							<div class="centered">
								<img src="assets/img/bullhorn-icon.png" width="130">
							</div>
						</div>
					</div>
					<!-- /col-md-4 -->

					<div class="col-md-4 mb">
						<div class="white-panel pn board">
							<div class="white-header">
								<h5>Board</h5>
							</div>
							<div class="row">
								<div class="col-sm-6 col-xs-6 goleft" style="font-size: 2em">
									<p>
										<i class="fa  fa-comments-o" style="font-size: 1em"></i> ${mainList[4]}
									</p>
								</div>
								<div class="col-sm-6 col-xs-6"></div>
							</div>
							<div class="centered">
								<img src="assets/img/board-icon.png" width="130">
							</div>
						</div>
					</div>
					<!-- /col-md-4 -->

					<div class="col-md-4 mb">
						<div class="white-panel pn evaluation" >
							<div class="white-header">
								<h5>Evaluation</h5>
							</div>
							<div class="row">
									<div class="col-sm-6 col-xs-6 goleft" style="font-size: 2em">
									<p>
										<i class="fa fa-asterisk" style="font-size: 1em"></i> 
									</p>
								</div>
								<div class="col-sm-6 col-xs-6"></div>
							</div>
							<div class="centered">
								<img src="assets/img/meeting-icon.png" width="130">
							</div>
						</div>
					</div>
					<!-- /col-md-4 -->

				</div>
				<!-- /row -->






			</div>
			<!-- /col-lg-9 END SECTION MIDDLE -->


			<!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->

			<div class="col-lg-3 ds">
				<!--COMPLETED ACTIONS DONUTS CHART-->
				<h3>Mail Box</h3>

				 				<!-- 반복문 -->
				<c:forEach items="${mlist}" var="i">
					<div class="desc">
						<div class="thumb">
							<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
						</div>
						<div class="details">
						<p>
							<muted>${i.mailDate}</muted>
							<br />${i.mailSender}에게 <a href="${initParam.root}mail_showMailContent.do?no=${i.mailNo}">메일</a>이 도착했습니다.<br />
						</p>
					</div>
				</div>
				</c:forEach>
<!-- 
				First Action
				<div class="desc">
					<div class="thumb">
						<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
					</div>
					<div class="details">
						<p>
							<muted>2 Minutes Ago</muted>
							<br /> <a href="#">Allan</a> 님께서 <a href="#">메일</a>을 보내셨습니다.<br />
						</p>
					</div>
				</div>
 -->
			            <!-- USERS ONLINE SECTION -->
            <h3>TEAM MEMBERS</h3>
            <!-- First Member -->
            <c:forEach items="${lvo.list}" var="i">
            <div class="desc">
               <div class="thumb">
                  <img class="img-circle" src="" width="35px"
                     height="35px" align="">
               </div>
               <div class="details">
                  <p>
                     <a href="#">${i.empName }</a><br />
                     <muted><a href="#">
                     <c:choose>
                        <c:when test="${i.empState == 1 }">
                           (업무중)
                        </c:when>
                        <c:when test="${i.empState == 2 }">
                            (출장)
                        </c:when>
                        <c:when test="${i.empState == 3 }">
                            (휴가)
                        </c:when>
                        <c:when test="${i.empState == 4 }">
                           (자리비움)
                        </c:when>
                     </c:choose>
                     
                     </a>${i.empMemo}</muted>
                  </p>
               </div>
            </div>
            </c:forEach>
				
				      <!-- Fifth Member -->
            <div class="desc">
               <!-- <div class="thumb">
                  <img class="img-circle" src="assets/img/ui-sam.jpg" width="35px"
                     height="35px" align="">
               </div> -->
               
                  <p align="center" style="font-size: 1.5em;">
                     <!-- <a href="#">관리자</a> -->
                        <c:if test="${lvo.pagingBean.previousPageGroup}">
                        <a href="${initParam.root}home.do?pageNo=${lvo.pagingBean.startPageOfPageGroup-1}"><img src="${initParam.root }img/left_arrow_btn.gif"></a>  
                     </c:if>
   
                     <c:forEach begin="${lvo.pagingBean.startPageOfPageGroup}" end="${lvo.pagingBean.endPageOfPageGroup}" var="i">
                            <c:choose>
                               <c:when test="${lvo.pagingBean.nowPage==i}">
                                 ${i}
                              </c:when>
                              <c:otherwise>
                                 <a href="${initParam.root}home.do?pageNo=${i}">${i}</a>
                              </c:otherwise>
                           </c:choose>
                     </c:forEach>
                  
                        <c:if test="${lvo.pagingBean.nextPageGroup}">
                           <a href="${initParam.root}home.do?pageNo=${lvo.pagingBean.endPageOfPageGroup+1}"><img src="img/right_arrow_btn.gif"></a>
                        </c:if>
                     <br/>
                  </p>
               
            </div>

         </div>
         <!-- /col-lg-3 -->
      </div>
      <!--/row -->
   </section>
</section>
<!-- /MAIN CONTENT -->