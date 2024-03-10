<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>User:Home</h1>

	<C:if test="${not empty userobj}">
		<h5 class="text=center">Name: ${userobj.name}</h5>
		<h5 class="text=center">Email: ${userobj.email}</h5>
		
	</C:if>
</body>
</html>