<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	$(document).ready(function(){	
			$("#monthBtn").click(function(){	
		       location.href="${initParam.root}sch_month.do";
		    });//click
		     
			$("#monthWriteBtn").click(function(){	
			   location.href="${initParam.root}sch_monthWriteForm.do";
			});//click
	});	
</script>
<section id="main-content">
          <section class="wrapper">
<div class="marginMailWrite">
<div class="content-panel">
<div align="center"><h3>&nbsp;<i class="fa fa-angle-right"></i> Registration Success !</h3><hr></div><br>
 <div align="center"><input type="button" value="Month" id="monthBtn" class="btn btn-info">
 <input type="button" value="Month Write" id="monthWriteBtn" class="btn btn-success"></div><br><br>
</div></div></section></section>