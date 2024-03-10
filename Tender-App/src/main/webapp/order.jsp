<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.TenderOrderDAO"%>
<%@ page import="com.DAO.TenderOrderImpl"%>
<%@ page import="com.entity.Tender_Order"%>
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
                <th scope="col">Order ID</th>
                <th scope="col">Tender Name</th>
                <th scope="col">Bid Amount</th>
                <th scope="col">Deadline</th>
                <th scope="col">My Message</th>
                <th scope="col">Status</th>
            </tr>
        </thead>
        <tbody>
            <%
            User me = (User) session.getAttribute("userobj");

            TenderOrderImpl dao = new TenderOrderImpl(DBConnect.getConn());
            List<Tender_Order> blist = dao.getTender(me.getEmail());
            for (Tender_Order c : blist) {
            %>

            <tr>
                <td><%= c.getOrderid() %></td>
                <td><%= c.getTendername() %></td>
                <td><%= c.getPrice() %></td>
                <td><%= c.getDeadline() %></td>
                <td><%= c.getMessage() %></td>
                <td>
                    <%
    if ("Pending".equals(c.getStatus())) {
%>
    <a href="#" class="btn btn-sm btn-warning"><i class="fa-solid fa-clock"></i> Pending</a>
<%
    } else {
%>
<%= c.getStatus() %></a>
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