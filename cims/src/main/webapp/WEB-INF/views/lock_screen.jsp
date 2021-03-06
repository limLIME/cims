<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">



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
<body onload="getTime()">

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  	<div class="container2">
	  	
	  		<div id="showtime"></div>
	  			<div class="col-lg-4 col-lg-offset-4" >
	  				<div class="lock-screen">
		  				<h2><a data-toggle="modal" href="#myModal"><i class="fa fa-lock"></i></a></h2>
		  				<p>UNLOCK</p>
		  				
				          <!-- Modal -->
				          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
				              <div class="modal-dialog">
				                  <div class="modal-content">
				                      <div class="modal-header">
				                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                          <h4 class="modal-title">Welcome Back</h4>
				                      </div>
				                      <div class="modal-body">
				                          <p class="centered"><img class="img-circle" width="100" height="100" src="upload/sign/${sessionScope.evo.empPath}"></p>
				                          ${sessionScope.evo.departmentVO.deptName } ${sessionScope.evo.positionVO.positionName} ${sessionScope.evo.empName}
				                          <input type="password" name="password" placeholder="Password" autocomplete="off" class="form-control placeholder-no-fix" id = "pass">				
				                      </div>
				                      <div class="modal-footer centered">
				                      	<button class="btn btn-theme03" type="button" id ="button">Login</button>
				                        <button data-dismiss="modal" class="btn btn-theme04" type="button">Cancel</button>
				                      </div>
				                  </div>
				              </div>
				          </div>
				          <!-- modal -->
		  				
		  				
	  				</div><! --/lock-screen -->
	  			</div><!-- /col-lg-4 -->
	  	
	  	</div><!-- /container -->

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/login-bg.jpg", {speed: 500});
    </script>
    


     <script type="text/javascript" src="assets/js//backfix.min.js"></script>
     <script type="text/javascript">
  	bajb_backdetect.OnBack = function(){
			alert("패스워드를 입력하세요!!");
		window.history.back=function(){
			document.location="${initParam.root}lock_lock_screen.do";
		}
	};
     </script>
     <script type="text/javascript">
     $(document).keydown(function(e){   
         if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA"){       
             if(e.keyCode === 8){   
             return false;
             }
         }
     });
    $(document).ready(function(){
    	$(".modal-footer").on("click", "#button",function(){
    		var pass = $("#pass").val();
    		$.ajax({
    			type:"POST",
    			url:"homeCheck.do",				
    			data:"empNo="+${evo.empNo}+"&password="+pass,   
    			success:function(result){ 					
    				if(result=='fail'){
    					alert("비밀번호를 확인하세요");
    				}else{
    					location.href = "${initParam.root}home.do?pageNo=1";
    				}
    			}// success
    		  });//ajax 
    	});
    });
    </script>
    <script>
        function getTime()
        {
            var today=new Date();
            var h=today.getHours();
            var m=today.getMinutes();
            var s=today.getSeconds();
            // add a zero in front of numbers<10
            m=checkTime(m);
            s=checkTime(s);
            document.getElementById('showtime').innerHTML=h+":"+m+":"+s;
            t=setTimeout(function(){getTime()},500);
        }

        function checkTime(i)
        {
            if (i<10)
            {
                i="0" + i;
            }
            return i;
        }
    </script>

  </body>
</html>