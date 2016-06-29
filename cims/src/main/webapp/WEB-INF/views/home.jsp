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
								<div class="col-sm-6 col-xs-6 goleft">
									<p>
										<i class="fa fa-envelope"></i> 122
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
								<div class="col-sm-6 col-xs-6 goleft">
									<p>
										<i class="fa fa-file"></i> 122
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
								<div class="col-sm-6 col-xs-6 goleft">
									<p>
										<i class="fa fa-calendar"></i> 122
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
								<div class="col-sm-6 col-xs-6 goleft">
									<p>
										<i class="fa fa-bullhorn"></i> 122
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
								<div class="col-sm-6 col-xs-6 goleft">
									<p>
										<i class="fa fa-bullhorn"></i> 122
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
						<div class="white-panel pn">
							<div class="white-header">
								<h5>Evaluation</h5>
							</div>
							<div class="row">
								<div class="col-sm-6 col-xs-6 goleft">
									<p>
										<i class="fa fa-bullhorn"></i> 122
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

				<%-- 				<!-- 반복문 -->
				<c:forEach items="" var="">
					<div class="desc">
						<div class="thumb">
							<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
						</div>
						<div class="details">
						<p>
							<muted>${시간전 }</muted>
							<br />${보낸이}에게 <a href="${initParam.root}mail_showMailContent.do?no=42">메일</a>이 도착했습니다.<br />
						</p>
					</div>
				</div>
				</c:forEach>
 --%>

				<!-- First Action -->
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

				<!-- Second Action -->
				<div class="desc">
					<div class="thumb">
						<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
					</div>
					<div class="details">
						<p>
							<muted>3 Hours Ago</muted>
							<br /> <a href="#">박병우</a>님께서 <a href="#">메일</a>을 보내셨습니다.<br />
						</p>
					</div>
				</div>
				<!-- Third Action -->
				<div class="desc">
					<div class="thumb">
						<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
					</div>
					<div class="details">
						<p>
							<muted>7 Hours Ago</muted>
							<br /> <a href="#">이상우</a>님께서 <a href="#">메일</a>을 보내셨습니다.<br />
						</p>
					</div>
				</div>
				<!-- Fourth Action -->
				<div class="desc">
					<div class="thumb">
						<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
					</div>
					<div class="details">
						<p>
							<muted>11 Hours Ago</muted>
							<br /> <a href="#">이상우</a>님께서 <a href="#">메일</a>을 보내셨습니다.<br />
						</p>
					</div>
				</div>
				<!-- Fifth Action -->
				<div class="desc">
					<div class="thumb">
						<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
					</div>
					<div class="details">
						<p>
							<muted>18 Hours Ago</muted>
							<br /> <a href="#">김원두</a>님께서 <a href="#">메일</a>을 보내셨습니다.<br />
						</p>
					</div>
				</div>

				<!-- USERS ONLINE SECTION -->
				<h3>TEAM MEMBERS</h3>
				<!-- First Member -->
				<div class="desc">
					<div class="thumb">
						<img class="img-circle" src="assets/img/ui-zac.jpg" width="35px"
							height="35px" align="">
					</div>
					<div class="details">
						<p>
							<a href="#">병우 박</a><br />
							<muted><a href="#">출근중</a> 출근하기 싫다</muted>
						</p>
					</div>
				</div>
				<!-- Second Member -->
				<div class="desc">
					<div class="thumb">
						<img class="img-circle" src="assets/img/ui-sherman.jpg"
							width="35px" height="35px" align="">
					</div>
					<div class="details">
						<p>
							<a href="#">원두 킴</a><br />
							<muted><a href="#">출근중</a> I am Busy</muted>
						</p>
					</div>
				</div>
				<!-- Third Member -->
				<div class="desc">
					<div class="thumb">
						<img class="img-circle" src="assets/img/jasal.jpg" width="35px"
							height="35px" align="">
					</div>
					<div class="details">
						<p>
							<a href="#">흥택 임</a><br />
							<muted><a href="#">외근중</a> 자살각...</muted>
						</p>
					</div>
				</div>
				<!-- Fourth Member -->
				<div class="desc">
					<div class="thumb">
						<img class="img-circle" src="assets/img/allan.jpg" width="35px"
							height="35px" align="">
					</div>
					<div class="details">
						<p>
							<a href="#">Allan Min</a><br />
							<muted><a href="#">식사중</a> 님들 롤하쉴?</muted>
						</p>
					</div>
				</div>
				<!-- Fifth Member -->
				<div class="desc">
					<div class="thumb">
						<img class="img-circle" src="assets/img/ui-sam.jpg" width="35px"
							height="35px" align="">
					</div>
					<div class="details">
						<p>
							<a href="#">관리자</a><br />
							<muted>Admin</muted>
						</p>
					</div>
				</div>

			</div>
			<!-- /col-lg-3 -->
		</div>
		<!--/row -->
	</section>
</section>
<!-- /MAIN CONTENT -->