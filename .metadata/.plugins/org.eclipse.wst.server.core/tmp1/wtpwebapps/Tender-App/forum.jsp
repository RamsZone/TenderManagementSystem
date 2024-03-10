<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.TenderDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Tenderdtls"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.TenderDAOImpl" %>
<%@ page import="com.DAO.ForumDAO"%>
<%@ page import="com.DAO.ForumDAOImpl"%>
<%@ page import="com.entity.Forum_Order"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor: Forum</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.bg-custom{
	background-color:#3949ab;
}

.navbar .nav-item:hover .nav-link {
	background-color: white;
	color: #3949ab;
	border-radius: 15px;
}
.container-box {
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 20px;
            max-height: 100vh;
            overflow: auto;
            height: auto;
           border-radius: 20px;
            
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
		<div class="alert alert-danger text-center"  role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
   
    
    
  
 	       <div class="container" style="margin-top: 50px; margin-bottom:0; padding-bottom:0;" >
  
       <!--  <div class="row">
            <div class="col-md-12">
                <div class="container-box"> -->
                  
                
<%
User me = (User) session.getAttribute("userobj");
ForumDAOImpl dao = new ForumDAOImpl(DBConnect.getConn());
List<Forum_Order> questions = dao.getTender(me.getEmail()); 
%>
<div class="container " >
    <h3>Chat Box</h3>
    <div class="row">
        <div class="col-md-12">
            <div class="container-box">
                <h3 class="text-center">Admin </h3>
             
                <hr>
                <% if (!questions.isEmpty()) { %>
                    <% for (Forum_Order f : questions) { %>
                        <div class="question">
                            <div class="row">
                                <div class="col-md-12" style="text-align: right;">
                                    <p style="background-color:#03fc1c; padding:5px 10px; border-radius:8px;   display: inline-block; max-width:50%;" > <%= f.getFquestion() %></p>
                                </div>
                            </div>
                             <% if (!"Pending".equals(f.getStatus())) { %>
                            <div class="row " style=" min-height: 40px; " >
                                <div class="col-md-12" style="text-align: left;">
                                    
                                    
                                   
                                       <p style="background-color: #03e3fc; padding:5px 10px; border-radius:8px;   display: inline-block;"> <%= f.getStatus() %></p>
                                   
                                </div>
                            </div>
                             <% } %>
                        </div>
                        <!-- Display other details if needed -->
                    <% } %>
                <% } else { %>
                    <p>No questions asked.</p>
                <% } %>
            </div>
        </div>
    </div>
</div>



</div><!-- </div></div></div> -->


	<div class="container" style="margin-top: 0; padding-top:0;">
		<!-- <div class="row justify-content-center p-2">
			<div class="col-md-12"> -->
			
				<!-- <div class="card"> -->
					<div class="card-body">
						<!-- <h3 class="text-center text-success">Drop here!</h3> -->
						<form action="forum" method="post">
							<input type="hidden" value="${userobj.id}" name="id">
							
							<div class="form-row">
								<%-- <div class="form-group col-md-6">
									<label for="paymentMode">Tender</label> <select
										class="form-control" id="paymentMode" name="tname" required>
										<option value="noselect" selected hidden>Select an option</option>
										<%
										User me1 = (User) session.getAttribute("userobj");
										TenderDAOImpl dao2 = new TenderDAOImpl(DBConnect.getConn());
										List<Tenderdtls> list2 = dao2.getTenderbydescorder();
										for (Tenderdtls t : list2) {
										%>
										<option value="<%=t.getTendername()%>">--<%=t.getTendername()%>--
										</option>
										<%
										}
										%>
									</select>
								</div> --%>
								<input type="hidden" value="<%=me.getName()%>" name="vfname">
							<input type="hidden" value="<%=me.getCrnno()%>" name="vfcrnno">
							<input type="hidden" value="<%=me.getEmail()%>" name="vfemail">
							<input type="hidden" value="<%=me.getPhno()%>" name="vfphno">
									

								

								<div class="form-group col-md-12">
									<label for="inputPassword4"></label>
									<textarea class="form-control" rows="4" id="inputPassword4"
										name="fquestion" required style="border-radius: 20px;"> </textarea>
								</div>
								<div class="form-group col-md-12">
									<button class="btn btn-warning">Send</button>
									<a href="index.jsp" class="btn btn-primary">Back to Home</a>
								</div>
								
							</div>
							
						</form>


					</div>
				</div>


	<!-- 		</div> -->
	<!-- 	</div>
	</div> -->
	
s
    
<br><br>
   <!--  <div class="container" style="max-width: 600px;">
    <div class="form-group col-md-12 text-center">
        <p>View your existing forum!</p>
        <a href="forum_stat.jsp" class="btn btn-success">Go to Forum</a>
    </div>
</div> -->
    

    <div style="margin-top: 390px;">
        <%@include file="all_component/footer.jsp"%>
    </div>
</body>

</html>