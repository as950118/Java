<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href ="css/bootstrap.css">
<link rel="stylesheet" href ="css/custom.css">
<link rel="stylesheet" href ="css/default.css">
<link rel="stylesheet" href ="css/tables.css">
<link rel="stylesheet" href ="css/layout.css">
<link rel="stylesheet" href ="css/featured_slide.css">
<link rel="stylesheet" href ="css/form.css">
<link rel="stylesheet" href ="css/navi.css">
<title>SCREEN DOOR</title>
</head>
<script>
$('#myCarousel').carousel();
var winWidth = $(window).innerWidth();
$(window).resize(function () {

    if ($(window).innerWidth() < winWidth) {
        $('.carousel-inner>.item>img').css({
            'min-width': winWidth, 'width': winWidth
        });
    }
    else {
        winWidth = $(window).innerWidth();
        $('.carousel-inner>.item>img').css({
            'min-width': '', 'width': ''
        });
    }
});
</script>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<nav class="navbar" style="background:black;overflow:visible;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class ="icon-bar"></span>
					<span class ="icon-bar"></span>
					<span class ="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="font-family:TESLA;color:#F8F8FF;" href="main.jsp">SCREENDOOR</a>
			</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp" accesskey="1" style="font-family:Gotham Light;font-size:12px;color:#F8F8FF;">MAIN</a></li>
				<li><a href="bbs.jsp" style="font-family:Gotham Light;font-size:12px;color:#F8F8FF;">ABOUT</a></li>
				<li><a href="bbs.jsp" style="font-family:Gotham Light;font-size:12px;color:#F8F8FF;">NOTIFY</a></li>
			</ul>
			<%
				if(userID ==null){
				
			%>
			
			<ul class = "nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="font-family:Gotham Light;color:#F8F8FF;">SIGN IN<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li ><a href="login.jsp" style="font-family:Gotham Light">LOGIN</a></li>
						<li ><a href="join.jsp" style="font-family:Gotham Light">JOIN</a></li>
					</ul>
				</li>
			</ul>
			<%
				}else{
			%>
			<ul class = "nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="font-family:Gotham Light;color:#F8F8FF;">MANAGE<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li ><a href="logoutAction.jsp" style="font-family:Gotham Light">LOGOUT</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
		</div>
	</nav>
	<!-- container  -->
	<div id="container">
    	<div id="content">
      		<h1 style="color:#000000;">About SCREENDOOR</h1>
      		<br>
      		<img class="imgr" src="image/slab_CEO.jpg" width="150" height="150"/>
      		<br>
      		<p style="font-family:Nanum Gothic;color:#000000;font-size:10pt;"><b>&nbsp;&nbsp;S-LAB</b>은 전기차를 타기 위해서 타협할 필요가 없다는 것을 보여주고, 
      		동아리 소개 문구 및 사진은 동아리 로고, 동아리 로고 다운로드 링크 걸기
      		  </p>
      		  <br>
      		  <b style="font-size:13pt;font-family:Gotham Light;color:#000000;float:right;">SCREENDOR  회장</b>
      		  <br>
      		  <br>
      		  <b style="font-size:13pt;font-family:Nanum Gothic;color:#000000;float:right;">정 헌 진</b>
      		  <span class ="icon-bar"></span>
		</div>
		
	    <div class="clear"></div>
	  </div>

	<nav class="navbar" style="background:#F8F8FF;overflow:visible;">
    		<p class="jumbo" style="color:black;">© 2017 SCREENDOOR. All Rights Reserved</p>
	</nav>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>