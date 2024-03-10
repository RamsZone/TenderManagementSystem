<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.ForumDAO"%>
<%@ page import="com.DAO.ForumDAOImpl"%>
<%@ page import="com.entity.Forum_Order"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vendor: order view</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<h3 class="text-center">Your Order</h3>

    <table class="table table-striped table-dark">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Forum ID</th>
                <th scope="col">Tender Name</th>
                <th scope="col">Description</th>
                <th scope="col">Status</th>
            </tr>
        </thead>
        <tbody>
            <%
            User me = (User) session.getAttribute("userobj");

            ForumDAOImpl dao = new ForumDAOImpl(DBConnect.getConn());
            List<Forum_Order> blist = dao.getTender(me.getEmail());
            for (Forum_Order f : blist) {
            %>

            <tr>
                <td><%= f.getForumid() %></td>
                <td><%= f.getTname() %></td>
                <!--  -->
                <td><%= f.getFquestion() %></td>
                <td>
                    <%
    if ("Pending".equals(f.getStatus())) {
%>
    <a href="#" class="btn btn-sm btn-warning"><i class="fa-solid fa-clock"></i> Pending</a>
<%
    } else {
%>
<%= f.getStatus() %></a>
<%
    }
%>
                    
                </td>
            </tr>

            <%
            }
            %>
        </tbody>
    </table>








	<div style="margin-top: 420px;">
		<%@include file="all_component/footer.jsp"%></div>
</body>
</html>