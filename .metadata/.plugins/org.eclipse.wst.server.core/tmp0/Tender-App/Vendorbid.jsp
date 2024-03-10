<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Tenderdtls"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor: Bid Page</title>
<%@ include file="all_component/allCss.jsp" %>
<style>
    .form-rounded {
        border-radius: 10px;
        padding: 20px;
        background-color: #f8f9fa;
        width: 50%;
        margin: 0 auto;
    }
    
    .form-group {
        margin-bottom: 20px;
    }
    
    .form-group label {
        font-weight: bold;
    }
    
    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ced4da;
    }
    
    .form-group textarea {
        height: 100px;
    }
    
    .btn-submit {
        background-color: #dc3545;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    
    .btn-submit:hover {
        background-color: #c82333;
    }
</style>
</head>
<body>
    <%@ include file="all_component/navbar.jsp" %>
    <h3 class="text-center">Here, You can bid now</h3>
    <h4 class="text-center">Check Properly before bidding</h4>
    <% User me = (User) session.getAttribute("userobj"); %>

    <div class="form-rounded">
        <form action="Bid" method="post">
            <div class="form-group">
            
			
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" min="0" required>
            </div>
            <div class="form-group">
                <label for="deadline">Deadline:</label>
                <input type="date" id="deadline" name="deadline" required>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            <a href="Bid" type="submit" class="btn btn-submit btn-danger">Bid Now</a>
            
        </form>
    </div>

    <div style="margin-top: 20px;">
        <%@ include file="all_component/footer.jsp" %>
    </div>
</body>
</html>
