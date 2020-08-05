<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./css/bootstrap.css" rel="stylesheet">
<title>afdfs</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if( result == 1 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		} else if( result == 0 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('password is wrong')");
			script.println("history.back()"); //back to login.jsp
			script.println("</script>");
		} else if( result == -1 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('not exist userID')");
			script.println("history.back()"); //back to login.jsp
			script.println("</script>");
		} else if( result == -2 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('database is error')");
			script.println("history.back()"); //back to login.jsp
			script.println("</script>");
		}
	%>
</body>
</html>