<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<div class="container-fluid"
	style="height: 10px; background-color: #3949ab"></div>


<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-hands-holding-circle"></i></i> Tender
			</h3>
		</div>

	</div>
</div>





<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<style>
/* CSS to change link color */
a.mr-3 {
	color: red; /* Change the color to red */
}

/* CSS to change icon color */
.fa-solid.fa-list {
	color: white; /* Change the color to blue */
}
</style>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			

			<li class="nav-item active"><a class="nav-link "
				href="Viewall.jsp"><i class="fa-solid fa-hand-sparkles"></i>Tenders</a></li>

			</li>
			<li class="nav-item active"><a class="nav-link "
				href="checkout.jsp"><i class="fa-solid fa-gavel"></i>Review</a></li>
			<li class="nav-item active"><a class="nav-link "
				href="notice.jsp"><i class="fa-solid fa-newspaper"></i> Notice</a></li>
				
			<li class="nav-item active"><a class="nav-link "
				href="forum.jsp"><i class="fa-brands fa-rocketchat"></i>Chat</a></li>
				
			<li class="nav-item active"><a class="nav-link "
				href="contact.jsp"><i class="fa-solid fa-phone"></i> Contact
					Us</a></li>
					




		</ul>
		<form class="form-inline my-2 my-lg-0">
			<c:if test="${ not empty userobj}">
				<!-- dynamic nav bar ko lagi user login bhayesi hatxa -->
				<a href="order.jsp" class="mr-3 "><i
					class="fa-solid fa-list fa-lg"></i> Status</a>

				<div class="dropdown">
					<a class="btn btn-success my-2 my-sm-1 dropdown-toggle" href="#"
						role="button" id="profileDropdown" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
						class="fa-solid fa-user-plus"></i> ${userobj.name}
					</a>
					<div class="dropdown-menu" aria-labelledby="profileDropdown">
						<a class="dropdown-item" href="updateprofile.jsp">Update Profile</a>
					</div>
				</div>



				<a href="logout" class="btn btn-danger my-2 my-sm-1 ml-1"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>
			</c:if>
			<!-- yo chai user empty bhayo bhane dekhaune thau jasma login rw register aauxa -->
			<c:if test="${empty userobj }">


				<a href="login.jsp" class="btn btn-success my-2 my-sm-0"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>
				<a href="register.jsp" class="btn btn-primary my-2 my-sm-0 ml-1"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</c:if>

		</form>

	</div>
</nav>