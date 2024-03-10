<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.ForumDAO"%>
<%@ page import="com.DAO.ForumDAOImpl"%>
<%@ page import="com.entity.Forum_Order"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Forum view</title>
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
    <h3 class="text-center">List of all Questions</h3>
    <table class="table table-striped table-dark">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Forum ID</th>
<!--                 <th scope="col">Tender Name</th> -->
                <th scope="col">Vendor Name</th>
                <th scope="col">Vendor CRN</th>
                <th scope="col">Question Description</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                User me = (User) session.getAttribute("userobj");
                ForumDAOImpl dao = new ForumDAOImpl(DBConnect.getConn());
                List<Forum_Order> blist = dao.getAllOrder();
                // Create a map to store the most recent question ID for each vendor
                Map<String, Integer> recentQuestionIds = new HashMap<>();
                for (Forum_Order f: blist) {
                    String vendorName = f.getVfname();
                    int questionId = f.getId();
                    // Check if the vendor already has a most recent question ID
                    if (!recentQuestionIds.containsKey(vendorName)) {
                        recentQuestionIds.put(vendorName, questionId);
                    } else {
                        // Update the most recent question ID if the current question is more recent
                        if (questionId > recentQuestionIds.get(vendorName)) {
                            recentQuestionIds.put(vendorName, questionId);
                        }
                    }
                }
                
                for (Forum_Order f: blist) {
                    String vendorName = f.getVfname();
                    int questionId = f.getId();
                    int recentQuestionId = recentQuestionIds.get(vendorName);
            %>
            
            <tr>
                <td><%=f.getForumid()%></td>
                <%-- <td><a href="#" class="btn btn-sm btn-primary"><%=f.getTname()%></a></td> --%>
                <td><%=f.getVfname()%></td>
                <td><%=f.getVfcrnno()%></td>
                <td><%=f.getFquestion()%></td>
                <td>
                    <%
                    if ("Pending".equals(f.getStatus())) {
                    %>
                    <a href="#" class="btn btn-sm btn-warning"><i class="fa-solid fa-clock"></i> Pending</a>
                    <%
                    } else {
                    %>
                    <%= f.getStatus() %>
                    <%
                    }
                    %>
                </td>
                <td>
                    <% 
                        if ("Pending".equals(f.getStatus()) && questionId == recentQuestionId) {
                    %>
                    <a href="comment_forum.jsp?id=<%=f.getId() %>" class="btn btn-sm btn-success"><i class="fa-solid fa-message"></i> Reply</a>
                    <% } else { %>
                    <a href="#" class="btn btn-sm btn-success disabled"><i class="fa-solid fa-message"></i> Reply</a>
                    <% } %>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <div style="margin-top: 420px;">
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
