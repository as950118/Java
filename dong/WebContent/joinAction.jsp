<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현대 S-LAB</title>
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
		if(user.getUserID()== null || user.getUserPassword()== null || user.getUserName()== null ||
		user.getUserGender()== null || user.getUserEmail()== null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('해당 아이디는 이미 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			if (result==1){//excute된 갯수 리턴
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>