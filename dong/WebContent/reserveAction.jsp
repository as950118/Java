<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ride.RideDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ride" class="ride.Ride" scope="page"/>
<jsp:setProperty name="ride" property="rideNamekr"/>
<jsp:setProperty name="ride" property="rideNameen"/>
<jsp:setProperty name="ride" property="rideNumber"/>
<jsp:setProperty name="ride" property="rideEmail"/>
<jsp:setProperty name="ride" property="rideGender"/>
<jsp:setProperty name="ride" property="rideCountry"/>
<jsp:setProperty name="ride" property="rideModel"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Screen Door</title>
</head>
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
		else{
			if(ride.getRideNamekr()== null || ride.getRideNameen()== null || ride.getRideNumber()== null ||
					ride.getRideEmail()== null ||ride.getRideGender()== null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				RideDAO rideDAO = new RideDAO();
				int result = rideDAO.reserve(ride);
				if (result==-1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('예약에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else if (result==1){//excute된 갯수 리턴
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('예약 되었습니다.')");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>