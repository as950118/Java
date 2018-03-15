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
<body>
<%
	String userID= null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			}
		if(userID!=null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			}
%>
	<nav class="navbar" style="background:black;">
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
				<li><a href="bbs.jsp" style="font-family:Gotham Light;color:#F8F8FF;">ABOUT</a></li>
				<li><a href="bbs.jsp" style="font-family:Gotham Light;color:#F8F8FF;">NOTIFY</a></li>
			</ul>
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
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px;">
			<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
						</div>
				<input type="submit" class="btn btn-info form-control" style="font-family:Gotham Light;" value="login">
			</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>