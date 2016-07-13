<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
$(document).ready(function() {
	$("#main").click(function() {
		location.href="${initParam.root}home.do?pageNo=1";
	});
});

</script>

	<section id="main-content"> 
	<section class="wrapper">
	<div class="marginMain">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<h3>
						<i class="fa fa-angle-right"></i> Update My Information
					</h3>
					<hr>
					<center>
					<h3>Update Success</h3>
					<input  type="button" class="btn btn-success" id="main" value="Go Main">
					</center>
				</div>
			</div>
		</div>
	</div>
	</section>
	</section>


