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
<title>Admin: Bids view</title>
<%@include file="allCss.jsp"%>
<style>
  .separator {
    border-bottom: 1px solid #ccc; /* Adjust the color and thickness as needed */
  }
  .group-gap {
    height: 20px; /* Adjust the height of the gap as needed */
  }
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center"  role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<h3 class="text-center">List of all bids</h3>


	<table class="table table-striped table-dark">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">Tendor Name</th>
				<th scope="col">Vendor Name</th>
				<th scope="col">Vendor CRN</th>
				<th scope="col">Bid Amount</th>
				<th scope="col">Deadline</th>
				<th scope="col">Description</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>

			</tr>
		</thead>
		<tbody>
			<%
								User me = (User) session.getAttribute("userobj");
	

								TenderOrderImpl dao = new TenderOrderImpl(DBConnect.getConn());
								List<Tender_Order> blist = dao.getAllOrder();
								for (Tender_Order c: blist) {
								%>
								
			

			<tr>
			 
				<td><%=c.getOrderid()%></td>
				<td>
    <a href="View_tender_info.jsp?tenderName=<%=c.getTendername()%>" class="btn btn-sm btn-primary"><%=c.getTendername()%></a>
</td>
				
				<td><%=c.getVendorname()%></td>
				<td><%=c.getCrnno()%></td>
				<td><%=c.getPrice()%></td>
				<td><%=c.getDeadline()%></td>
				<td><%=c.getMessage()%></td>
				
				  <td>
				  
				  
                    <%
                    if ("Pending".equals(c.getStatus())) {
                    %>
                    <a href="#" class="btn btn-sm btn-warning"><i class="fa-solid fa-clock"></i> Pending</a>
                    <%
                    } else {
                    %>
                    <%= c.getStatus() %>
                    <%
                    }
                    %>
                </td>
                
                <td>
                <% 
                    if ("Pending".equals(c.getStatus())) {%>

                    	<a href="comment.jsp?id=<%=c.getId() %>" class="btn btn-sm btn-success"><i class="fa-solid fa-message"></i> Comment</a>
                        

   <%} else {%>
	   <a href="#" class="btn btn-sm btn-success disabled"><i class="fa-solid fa-message"></i> Comment</a>
    	
    <% }

                %>
              
   
                </td>




			</tr>
			

			<%
			}
			%>

		</tbody>
	</table>







	<div style="margin-top: 420px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>