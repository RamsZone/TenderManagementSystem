<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.NoticeDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.NoticeDtls"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Notice: Index</title>
<%@include file="all_component/allCss.jsp"%>



<style type="text/css">



.news-img {
	background: url(img/news1.jpg);
	height: 100vh;
	weidth: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

}
</style>
</head>



<body style="background-color: #f7f8fa">
	<%@include file="all_component/navbar.jsp"%>
	<br>
	<div class="container-fluid news-img">
		<h2 class="text-center text-success">
			<i class="fa-solid fa-hands-holding-circle"></i> News and Updates
		</h2>
	</div>


	
	
	<br>
	<hr>

	

	
	<table class="table table-striped table-white">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Notice</th>
				<th scope="col">Description</th>

			</tr>

		</thead>

		<tbody>
			<%
			NoticeDAOImpl noticedao = new NoticeDAOImpl(DBConnect.getConn());
			List<NoticeDtls> noticelist = noticedao.getAllNotices();
			for (NoticeDtls t : noticelist) {
			%>

			<tr>
				<td><%=t.getNid()%></td>
				<td><%=t.getNtitle()%></td>
				<td><%=t.getnDesc()%></td>
			</tr>

			<%
			}
			%>


		</tbody>
	</table>

	<hr>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>