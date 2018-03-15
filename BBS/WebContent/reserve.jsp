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
<title>Screen Door</title>
</head>
<script>
function validate(evt) {
	  var theEvent = evt || window.event;
	  var key = theEvent.keyCode || theEvent.which;
	  key = String.fromCharCode( key );
	  var regex = /[0-9]|\./;
	  if( !regex.test(key) ) {
	    theEvent.returnValue = false;
	    if(theEvent.preventDefault) theEvent.preventDefault();
	  }
	}
</script>
<body>
<%
	String userID= null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			}
		if(userID==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("history.back()");
			script.println("</script>");
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
				<li class="active"><a href="main.jsp" style="font-family:Gotham Light;color:#F8F8FF;">MAIN</a></li>
				<li><a href="about.jsp" style="font-family:Gotham Light;color:#F8F8FF;">ABOUT</a></li>
				<li><a href="bbs.jsp" style="font-family:Gotham Light;color:#F8F8FF;">NOTIFY</a></li>
			</ul>
			<!--  -->
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
		</div>
	</div>
	</nav>
	<div class="container" style="padding-top:30px;">
		<div id="content">
		<div class="col-xs-6">
		<h1 style="font-size:30px;">KNUT Security&Development Group</h1></br>
		<!--<h2>SCREEN DOOR<h2>-->
		<img width="100%" src="./image/join_img.jpg">
		</div>
		</div>
		<div class="col-xs-5"></div>
		<div class="col-xs-5">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="reserveAction.jsp">
					<h3 style="text-align: center;">SIGN UP</h3>
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text" class="form-control" placeholder="이름(kr)" name="rideNamekr" maxlength="20">
					</div>
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-font"></i></span>
						<input type="text" class="form-control" placeholder="이름(en)" name="rideNameen" maxlength="20">
					</div>
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
						<input type="text" onkeypress='validate(event)' class="form-control" placeholder="전화번호" name="rideNumber" maxlength="11">
					</div>
					<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
						<input type="email" class="form-control" placeholder="이메일" name="rideEmail" maxlength="20">
					</div>
					<div class="form-group">
					  <label for="sel1">모델명:</label>
					  <select class="form-control" name="rideCountry">
					    <option>Model A</option>
					    <option>Model S</option>
					    <option>Model X</option>
					  </select>
					</div>
					<div class="form-group">
					  <label for="sel1">국적:</label>
					  <select class="form-control" name="rideCountry">
					    <option>Korea,Republic of</option>
					    <option>United States</option>
					    <option>China</option>
					    <option>Japan</option>
					  </select>
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-default active">
								<input type="radio" name="rideGender" autocomplete="off" value="남자" class="form-control" checked="checked">남자
							</label>
							<label class="btn btn-default">
								<input type="radio" name="rideGender" autocomplete="off" value="여자" class="form-control">여자
							</label>
						</div>
					</div>
					<input type="submit" class="btn btn-default form-control" value="Reserve">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>