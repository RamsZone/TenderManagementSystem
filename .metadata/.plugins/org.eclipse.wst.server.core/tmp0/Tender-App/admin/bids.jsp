<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Bids view</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<h3 class="text-center"> List of all bids</h3>

<table class="table table-striped table-dark">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Tendor ID</th>
      <th scope="col">Vendor ID</th>
      <th scope="col">Bid Amount</th>
      <th scope="col">Description</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>Mark</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>tyui</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
      <td>Mark</td>
    </tr>
  </tbody>
</table>








<div style="margin-top: 420px;">
<%@include file="footer.jsp"%></div>
</body>
</html>