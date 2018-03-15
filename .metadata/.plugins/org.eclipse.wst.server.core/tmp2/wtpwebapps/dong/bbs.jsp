<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Bbs.BbsDAO" %>
<%@ page import="Bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
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
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String)session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
	<div class="container" style="padding-top:30px;">
		<div class="row">
			<table class="table table-striped table-hover" style="text-align; center; border:1px solid #dddddd">
				<thead class="thead-inverse thead-borderd">
					<tr>
						<th style="background-color: #eeeeee; text-align:center;font-family:Gotham Light;">No</th>
						<th style="background-color: #eeeeee; text-align:center;font-family:Gotham Light;">Title</th>
						<th style="background-color: #eeeeee; text-align:center;font-family:Gotham Light;">Name</th>
						<th style="background-color: #eeeeee; text-align:center;font-family:Gotham Light;">Date</th>
					</tr>
				</thead>
				<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i = 0; i <list.size(); i++){
				%>
					<tr>
						<td style="text-align:center"><%=list.get(i).getBbsID()%></td>
						<td style="text-align:center"><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle() %></a></td>
						<td style="text-align:center"><%=list.get(i).getUserID() %></td>
						<td style="text-align:center"><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14,16)+"분" %></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-default btn-s btn-arraw-left" style="font-family:Gotham Light;">prev</a>
			<%
			} if(bbsDAO.nextPage(pageNumber)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-default btn-s btn-arraw-left" style="font-family:Gotham Light;">next</a>
			<%
			} 
			%>
			<a href="write.jsp" class="btn btn-default btn-s pull-right" style="font-family:Gotham Light;">write</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>