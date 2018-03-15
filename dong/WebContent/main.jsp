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
	<nav class="navbar navbar-fixed-top" style="background:black;overflow:visible;">
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
				<li class="active"><a href="main.jsp" accesskey="1" style="font-family:Gotham Light;color:#F8F8FF;">MAIN</a></li>
				<li><a href="about.jsp" style="font-family:Gotham Light;color:#F8F8FF;">ABOUT</a></li>
				<li><a href="bbs.jsp" style="font-family:Gotham Light;color:#F8F8FF;">NOTIFY</a></li>
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
				}else if(userID.equals("admin")){
			%>
			<nav class="navbar navbar-fixed-top" style="background:black;overflow:visible;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class ="icon-bar"></span>
					<span class ="icon-bar"></span>
					<span class ="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="font-family:TESLA;color:#F8F8FF;" href="main.jsp">S-LAB</a>
			</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp" accesskey="1" style="font-family:Gotham Light;color:#F8F8FF;">MAIN</a></li>
				<li><a href="about.jsp" style="font-family:Gotham Light;color:#F8F8FF;">ABOUT</a></li>
				<li><a href="bbs.jsp" style="font-family:Gotham Light;color:#F8F8FF;">BOARD</a></li>
				<li><a href="form.jsp" style="font-family:Gotham Light;color:#F8F8FF;">업로드</a></li>
			</ul>
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
<!-- <div align="center" class="container" style="padding-right: 0px;padding-left: 0px;margin-right: 0px;margin-left: 0px;">-->
		<div  id="myCarousel" class="carousel slide" style="width: 100%;max-width: 100%;">
			  <ol class="carousel-indicators">
			    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			    <li data-target="#myCarousel" data-slide-to="1"></li>
			    <li data-target="#myCarousel" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner" style=""role="listbox">
			    <div class="item active">
			      <img class="d-block img-fluid" src="image/banner-first.jpg" alt="First slide">
			    	<div class="carousel-caption d-none d-md-block">
    					<h1 style="font-family:Gotham Light;color:#F8F8FF;">Development</h1>
    					<p style="font-family:Gotham Light;color:#F8F8FF;">All new technology</p>
    				</div>
			    </div>
			    <div class="item">
			      <img class="d-block img-fluid" src="image/banner-second.jpg" alt="Second slide">
			      <div class="carousel-caption d-none d-md-block">
    					<h1 style="font-family:Gotham Light;color:#F8F8FF;">Hacking</h1>
    					<p style="font-family:Gotham Light;color:#F8F8FF;">Web, Android, System</p>
    				</div>
			    </div>
			    <div class="item">
			      <img class="d-block img-fluid" src="image/banner-third.jpg" alt="Third slide">
			      <div class="carousel-caption d-none d-md-block">
    					<h1 style="font-family:Gotham Light;color:#F8F8FF;" >SCREEN DOOR</h1>
    					<p style="font-family:Gotham Light;color:#F8F8FF;">KNUT</p>
    				</div>
			    </div>
			  </div>
			    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			    	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			  	</a>
			  	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			   		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			  	</a>
			</div>
		<!-- </div>-->
	<!-- container  -->
	<br>
	<div id="wrapper">
	<div id="three-column" class="container" align="center">
		<div class="title">
			<h2>공지사항</h2>
			<span class="byline">변경예정</span>
		</div>
		<div class="boxA">
			<span class="fa fa-cloud-download"></span>
			<h1>Model A</h1>
			<a href="reserve.jsp" class="button button-alt">Reserve</a>
		</div>
		<div class="boxB">
			<span class="fa fa-cogs"></span>
			<h1>Model S</h1>
			<a href="reserve.jsp" class="button button-alt">Reserve</a>
		</div>
		<div class="boxC">
			<span class="fa fa-wrench"></span>
			<h1>Model X</h1>
			<a href="reserve.jsp" class="button button-alt">Reserve</a>
		</div>
	</div>
	</div>
	<nav class="navbar" style="background:white;overflow:visible;">
    		<p class="jumbo" style="color:black;">© 2017 SCREENDOOR. All Rights Reserved</p>
	</nav>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>