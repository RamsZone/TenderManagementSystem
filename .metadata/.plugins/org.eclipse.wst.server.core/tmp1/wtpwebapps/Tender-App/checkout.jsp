<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.CartDAO"%>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor: cart module</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f8fa">
	<%@include file="all_component/navbar.jsp"%>


	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center"  role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container">
		<div class="row justify-content-center p-2">
			<div class="col-md-10">



				<div class="card bg-white">
					<h3 class="text-center text-success">Your selected bid</h3>
					<div class="card-body">

						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Tender Name</th>
									<th scope="col">Type</th>
									<th scope="col">Location</th>
									<th scope="col">Price</th>
									<th scope="col">Deadline</th>
									<th scope="col">Description</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User me = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getTenderbyUser(me.getId());
								for (Cart c : cart) {
								%>

								<tr>
									<td><%=c.getCname()%></a></td>
									<td><%=c.getCtype()%></td>
									<td><%=c.getClocation()%></td>
									<td><%=c.getCprice()%></td>
									<td><%=c.getCdeadline()%></td>
									<td><%=c.getCdesc()%></td>
									<td><a
										href="remove_utender?tid=<%=c.getTid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-danger btn-sm">Remove</a></td>

								</tr>


								<%
								}
								%>



							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>



	</div>
	<div class="container">
		<div class="row justify-content-center p-2">
			<div class="col-md-10">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your bid</h3>
						<form action="order" method="post">
							<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="paymentMode">Tender</label> <select
										class="form-control" id="paymentMode" name="tname">
										<option value="noselect" selected hidden>Select an option</option>
										<%
										CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
										List<Cart> cart2 = dao2.getTenderbyUser(me.getId());
										for (Cart c : cart) {
										%>
										<option value="<%=c.getCname()%>" price="<%=c.getCprice()%>">--<%=c.getCname()%>--
										</option>
										<%
										}
										%>
									</select>
								</div>

								<div class="form-group col-md-6">
									<label for="inputEmail4">Vendor Name</label> <input type="text"
										class="form-control" id="inputEmail4"
										value="<%=me.getName()%>" readonly="readonly" name="vname">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Vendor CRN</label> <input type="text"
										class="form-control" id="inputEmail4"
										value="<%=me.getCrnno()%>" readonly="readonly" name="crnno">
								</div>
								
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4"
										value="<%=me.getEmail()%>" readonly="readonly" name="email">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone No.</label> <input type="tel"
										class="form-control" id="inputEmail4"
										value="<%=me.getPhno()%>" readonly="readonly" name="phno">


								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Price</label> <input type="number"
										class="form-control" id="priceq" name="price" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Deadline</label> <input type="text"
										class="form-control" id="inputEmail4" name="deadline" required>
								</div>
								<div class="form-group col-md-12">
									<label for="inputPassword4">Message:</label>
									<textarea class="form-control" rows="4" id="inputPassword4"
										name="message" required> </textarea>
								</div>
								<div class="form-group col-md-12">
									<button class="btn btn-warning">Bid now</button>
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
	<br>
	<br>
	<br>
	<br>
	<br>














	<%@include file="all_component/footer.jsp"%>
	<script>
document.getElementById("paymentMode").addEventListener("change", function() { //changes in dropdown
    var selectedOption = this.options[this.selectedIndex]; //selecvted option retrivval
    var selectedPrice = selectedOption.getAttribute("price"); //price value of selected option
    document.getElementById("priceq").setAttribute("min", selectedPrice);
    document.getElementById("priceq").min = selectedPrice; // Set the input value to the selected price
});
</script>
	
</body>
</html>