<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
 
<%
    request.setCharacterEncoding("UTF-8");

    String path = request.getSession().getServletContext().getRealPath("/") + "files";
    int maxSize  = 1024*1024*10;

    try{
        MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8");
        out.println("파일 업로드 완료~!");
    } catch(Exception e) {
        e.printStackTrace();
    }
%>