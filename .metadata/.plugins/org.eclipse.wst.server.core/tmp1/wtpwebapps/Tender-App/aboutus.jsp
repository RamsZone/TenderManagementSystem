<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.DAO.NoticeDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Tenderdtls"%>
<%@ page import="com.entity.NoticeDtls"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ABOUT US: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url(img/Tender-01.png);
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.news-img {
	background: url(img/news.jpeg);
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f7f8fa;
}
</style>
</head>
<body style="background-color: #f7f8fa">
	<%@include file="all_component/navbar.jsp"%>
	<br>
	<div class="container-fluid back-img">
		<h2 class="text-center text-success">
			<i class="fa-solid fa-hands-holding-circle"></i> Tender Management
			System
		</h2>
	</div>
	
					<div>
						<h2>Welcome to Our Tender Management System</h2>
						<p>Our Tender Management System is a comprehensive platform
							designed to simplify the tendering process for both companies and
							vendors. Whether you're a company seeking goods or services or a
							vendor looking to bid on opportunities, our system provides the
							tools and features you need to streamline the entire process.</p>
						<h3>For Companies</h3>
						<p>Company administrators have full control over the tendering
							process. They can create new tenders, edit existing ones, and
							delete outdated ones. Our intuitive interface makes it easy to
							specify requirements, set deadlines, and provide detailed
							descriptions of the goods or services required.</p>
						<p>Once tenders are published, companies can review bids
							submitted by vendors. Our system provides advanced filtering and
							sorting options to help companies evaluate bids based on various
							criteria such as price, quality, and vendor reputation.</p>
						<p>Company administrators can also communicate with vendors
							directly through our platform, providing clarification on tender
							requirements or requesting additional information as needed.</p>
						<h3>For Vendors</h3>
						<p>Vendors can register on our platform to gain access to a
							wide range of tender opportunities. Our system allows vendors to
							search for tenders based on their area of expertise, location, or
							other relevant criteria.</p>
						<p>Once registered, vendors can submit bids for available
							tenders directly through our platform. Our user-friendly
							interface makes it easy to upload proposal documents, specify
							pricing details, and communicate with company administrators.</p>
						<p>Vendors can track the status of their bids in real-time and
							receive notifications when their bids are accepted or rejected.
							This transparency helps vendors manage their resources more
							effectively and focus their efforts on opportunities with the
							highest likelihood of success.</p>
						<h3>Our Mission</h3>
						<p>Our mission is to revolutionize the tendering process by
							providing an efficient, transparent, and user-friendly platform
							for companies and vendors alike. We believe that by simplifying
							the tendering process, we can help organizations save time,
							reduce costs, and make better-informed decisions.</p>
						<p>Thank you for choosing our Tender Management System. We
							look forward to serving you and helping you achieve your
							tendering goals.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
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
