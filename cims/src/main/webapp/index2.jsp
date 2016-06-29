<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

 <body>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">
	  	
	  
		      <form class="form-login">
		        <h2 class="form-login-heading">Login now</h2>
		        <div class="login-wrap">
		            <input type="text" class="form-control" placeholder="User ID" autofocus id = "empNo">
		            <br>
		            <input type="password" class="form-control" placeholder="Password" id = "password">
		            <label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>
		
		                </span>
		            </label>
		            <button class="btn btn-theme btn-block" id="button" type="submit"><i class="fa fa-lock"></i> LOGIN</button>
		            <hr>	           
		        </div>		
		      </form>	  	
		      		          <!-- Modal -->
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Forgot Password ?</h4>
		                      </div>
		                      <div class="modal-body" align="center">
		                          <p>흥택찡한테 연락주세요 010-5114-0581</p>
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-default" type="button">OK</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/company3.jpg", {speed: 500});
    </script>

  <script src="resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#button").click(function(){ 
		var empNo = $("#empNo").val();
		var password = $("#password").val();
		if(empNo==""){
			alert("사원번호를 입력하세요");
			return false;
		}if(password==""){
			alert("패스워드를 입력하세요.");
			return false;
		}
		$.ajax({
			type:"POST",
			url:"homeCheck.do",				
			data:"empNo="+empNo+"&password="+password,   
			success:function(result){
				if(result=='success'){
					location.href = "${initParam.root}home.do";
				}else{
					alert("아이디/비밀번호를 확인하세요");
				}
			}// success
		  });//ajax 
	});
});	
</script>
  </body>
</html>