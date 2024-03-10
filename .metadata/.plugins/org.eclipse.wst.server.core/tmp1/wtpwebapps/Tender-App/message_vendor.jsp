<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.ForumDAO"%>
<%@ page import="com.DAO.ForumDAOImpl"%>
<%@ page import="com.entity.Forum_Order"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Tenderdtls"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.TenderDAOImpl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor: Forum</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.bg-custom {
	background-color: #3949ab;
}

.navbar .nav-item:hover .nav-link {
	background-color: white;
	color: #3949ab;
	border-radius: 15px;
}
</style>




</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<h3 class="text-center">Have any queries ?</h3>






	<div class="container">
		<div class="row justify-content-center p-2">
			<div class="col-md-10">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Drop here!</h3>
						<form action="forum" method="post">
							<!-- <input type="hidden" value="${userobj.id}" name="id">
							 -->
							<div class="form-row">
								<div class="form-group col-md-6">
<%
User me = (User) session.getAttribute("userobj");
String idParam = request.getParameter("id");
int id = 0; // Default value or any appropriate default value
if (idParam != null && !idParam.isEmpty()) {
    id = Integer.parseInt(idParam);
}
ForumDAOImpl dao = new ForumDAOImpl(DBConnect.getConn());
Forum_Order f = dao.getTenderById(id);
%>

									<input type="" value="<%=f.getId()%> " name="id">


								</div>
								<input type="hidden" value="<%=f.getVfemail()%>" name="vfemail">


  

  

								<div class="form-group col-md-6">
									<label for="inputPassword4">Question Title:</label> <input
										type="text" class="form-control" id="inputPassword4"
										name="ftitle" required>
								</div>
								<div class="form-group col-md-12">
									<label for="inputPassword4">Question:</label>
									<textarea class="form-control" rows="4" id="inputPassword4"
										name="fquestion" required> </textarea>
								</div>
								<div class="form-group col-md-12">
									<button class="btn btn-warning">Submit</button>
									<a href="index.jsp" class="btn btn-primary">Back to Home</a>
								</div>

							</div>

						</form>


					</div>
				</div>


			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container" style="max-width: 600px;">
		<div class="form-group col-md-12 text-center">
			<p>View your existing forum!</p>
			<a href="forum_stat.jsp" class="btn btn-success">Go to Forum</a>
		</div>
	</div>


	<div style="margin-top: 390px;">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>