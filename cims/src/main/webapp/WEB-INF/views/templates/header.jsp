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
	 <%
    // 쿠키값 가져오기
    Cookie[] cookies = request.getCookies() ;
    String cValue = null;
    boolean flag = false;
    if(cookies != null){
        for (Cookie cookie : cookies) {
            if("memberNo".equals(cookie.getName()) && "1".equals(cookie.getValue())){
                flag = true;
            }
        }
    }
    if(flag){
%>
   <script type="text/javascript">
   location.href = "${initParam.root}lock_lock_screen.do";
</script>
<%} %>
    
    
    	<script type="text/javascript">
    	$(document).ready(function() {
			if(${sessionScope.evo == null}){
				alert("세션이 만료되었습니다. 다시 로그인 해주십시오");
	    		location.href="${initParam.root}index2.jsp";
			}
			$(".mystate").change(function() {
				location.href="${initParam.root}emp_updateMyState.do?state="+$("#state").val();
			});
    		
    		
		});
    	
    	
    	</script>
   
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="toggle menu"></div>
              </div>
              
            <!--logo start-->
            <a href="${initParam.root}home.do?pageNo=1" class="logo"><b>CLASS:sexy</b></a>
      
       <div class="top-menu" >
               
           			
          		
            </div>
      		 <div class="top-menu">
               	<ul class="nav pull-right top-menu">
           			
               <li>
               <select class="mystate" id="state">
               			<c:choose>
               			<c:when test="${sessionScope.evo.empState==1 }"><option value="1">내상태:업무중</option></c:when>
               			<c:when test="${sessionScope.evo.empState==2 }"><option value="2">내상태:출장</option></c:when>
               			<c:when test="${sessionScope.evo.empState==3 }"><option value="3">내상태:휴가</option></c:when>
               			<c:when test="${sessionScope.evo.empState==4 }"><option value="4">내상태:자리비움</option></c:when>
               			<c:otherwise>
              			</c:otherwise>
               			</c:choose>
               			
               			
           				 <option value="1">업무중</option>
			         	<option value="2">출장</option>
			         	<option value="3">휴가</option>
			         	<option value="4">자리비움</option>
        			 </select>
               </li>
               <li><a class="logout" href="${initParam.root }emp_logout.do">Logout</a></li>
               </ul>
               
            </div>
        </header>
