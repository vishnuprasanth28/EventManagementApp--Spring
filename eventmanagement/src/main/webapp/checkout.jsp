<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.eventmanagement.model.User"%>
<%@ page import="com.chainsys.eventmanagement.model.Event"%>
<%@ page import="com.chainsys.eventmanagement.model.Venue"%>
<%@ page import="com.chainsys.eventmanagement.model.Vendor"%>
<%@ page import="java.util.*"%>
<%

User user = (User) session.getAttribute("user");
boolean isLoggedIn = (user != null);
%>

<!DOCTYPE html>
<html lang=en>
<head>
<title>Checkout</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
  /* Custom styles for hover effects */
  .nav-item:hover .nav-link {
    color: #ffc107 !important; /* Change color on hover */
  }
  .nav-link.dropdown-toggle:hover::after {
    transform: rotate(180deg); /* Rotate dropdown arrow on hover */
  }
  .dropdown-item:hover {
    background-color: #343a40 !important; /* Change background color of dropdown items on hover */
  }
  .dropdown-item:hover .dropdown-item {
    color: #ffc107 !important; /* Change color of dropdown items on hover */
  }
  .btn-primary:hover {
    background-color: #ffc107 !important; /* Change background color of primary button on hover */
    border-color: #ffc107 !important; /* Change border color of primary button on hover */
  }
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="#"><img
				src="images/epic-events-high-resolution-logo.png" alt="Company Logo"
				style="height: 40px;"></a> <span class="navbar-text mr-auto">EPIC
				EVENTS</span>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="service.jsp">Services</a>
				</li>
				<% if (!isLoggedIn) { %>
				<!-- Show Sign Up and Sign In only if the user is not logged in -->
				<li class="nav-item"><a class="nav-link"
					href="registration.jsp">Sign Up</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"   onkeypress="handleKeyPress(event)"
       onkeydown="handleKeyDown(event)"> Sign In </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="signIn.jsp">Admin</a> <a
							class="dropdown-item" href="user.jsp">User</a>
					</div></li>
				<% } else { %>
				<!-- Show user's name if logged in -->
				<li class="nav-item"><span class="nav-link">Hii <%= user.getUserName() %></span>

				</li>
				<li class="nav-item">
					<form action="logout" method="post">
						<button type="submit" class="btn btn-primary">Logout</button>
					</form>
				</li>
				<% } %>
			</ul>
		</div>
	</nav>



	<div class="container">
		<% Event event = (Event) request.getAttribute("event"); %>

		<div>
			<h2>User Information</h2>

			<p>
				User Name:
				<%= user.getUserName() %></p>
		</div>
		<div>
			<h2>Event Information</h2>
			<p>
				Event Type:
				<%= event.getEventType()%></p>
			<p>
				Date:
				<%= event.getDateString() %></p>
		</div>
		<div>
			<h2>Selected Services</h2>
			
			<p>
				<i class="fa fa-rupee">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Photography Price</i>:
				<%= event.getPhotographyPrice() %></p>
		</div>
		<div>
			
			<p>
				<i class="fa fa-rupee">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Catering Price</i>:
				<%= event.getCateringPrice() %></p>
		</div>
		<div>
			<h2>Estimated Amount</h2>

			<p>
				<i class="fa fa-rupee">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total</i>:
				<%= event.getEstimatedPrice() %></p>
			<button onclick="window.print()"> Download Estimation </button>
			<br>
			<br>
			<form action="PaymentServlet" method="post">
			<input type="hidden" name="date" value="<%= event.getDateString()%>">
				<input type="hidden" name="event" value="<%= event.getEventType()%>">
				<input type="hidden" name="venueId" value="<%= event.getVenueId() %>">
				<input type="hidden" name="photographyVendorId" value="<%= event.getPhotoGraphyId() %>">
				<input type="hidden" name="cateringVendorId" value="<%= event.getCateringId() %>">
				<button type="submit" class="btn btn-primary">Pay Now</button>
			</form>
		</div>
	</div>
</body>
</html>
