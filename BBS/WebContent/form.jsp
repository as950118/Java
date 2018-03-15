<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>파일 업로드 폼</title>
</head>
 <h3>관리자 파일 업로드</h3>
 <p>관리자끼리 파일 보내기 귀찮을때 이걸사용.</p>
<body>
 
<form action="fileupload.jsp" method="POST" enctype="multipart/form-data">
<input type="file" name="test_file"><br>
<input type="submit" value="upload">
</form>
</body>
</html>