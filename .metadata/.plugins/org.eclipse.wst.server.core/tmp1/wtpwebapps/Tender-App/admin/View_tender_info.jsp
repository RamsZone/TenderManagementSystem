<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Tenderdtls"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin: Tender Details</title>
    <%@include file="allCss.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>
    
    <h3 class="text-center">Tender Details</h3>
    
    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp"/>
    </c:if>
    
    <c:if test="${not empty param.tenderName}">
        <% 
            String tenderName = request.getParameter("tenderName");
            TenderDAOImpl dao = new TenderDAOImpl(DBConnect.getConn());
            List<Tenderdtls> allTenders = dao.getAllTenders();
            Tenderdtls matchingTender = null;
            for (Tenderdtls tender : allTenders) {
                if (tender.getTendername().equals(tenderName)) {
                    matchingTender = tender;
                    break;
                }
            }
            if (matchingTender != null) {
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <table class="table table-bordered">
                        <tr>
                            <th>Name</th>
                            <td><%=matchingTender.getTendername()%></td>
                        </tr>
                        <tr>
                            <th>Type</th>
                            <td><%=matchingTender.getTendertype()%></td>
                        </tr>
                        <tr>
                            <th>Base Price</th>
                            <td><%=matchingTender.getBaseprice()%></td>
                        </tr>
                        <tr>
                            <th>Location</th>
                            <td><%=matchingTender.getLocation()%></td>
                        </tr>
                        <tr>
                            <th>Deadline</th>
                            <td><%=matchingTender.getDeadline()%></td>
                        </tr>
                        <tr>
                            <th>Description</th>
                            <td><%=matchingTender.getDescription()%></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <% 
            } else {
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="alert alert-danger" role="alert">Tender not found!</div>
                </div>
            </div>
        </div>
        <% } %>
    </c:if>
        <div class="text-center">
        <a href="bids.jsp" class="btn btn-primary">Back to List of all Bids</a>
    </div>
    
    <br>
    <br><br><br><br><br><br><br><br>
    <div style="margin-top: 20px;">
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
