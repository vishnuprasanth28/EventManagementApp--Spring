<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="com.chainsys.eventmanagement.model.Venue"%>
<%@ page import="java.util.*"%>
<%@ page import="com.chainsys.eventmanagement.model.User"%>
<%

User user = (User) session.getAttribute("user");
boolean isLoggedIn = (user != null);


%>
<!DOCTYPE html>
<html lang=en>
<head>
<title>Venue Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.card {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	margin: 10px;
	width: 300px;
	float: left;
}

.card img {
	max-width: 100%;
	height: auto;
}

.card h2 {
	font-size: 18px;
	margin-top: 10px;
	margin-bottom: 5px;
}

.card p {
	margin: 5px 0;
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
					aria-expanded="false"
					  onkeypress="handleKeyPress(event)"
      				 onkeydown="handleKeyDown(event)">
					> Sign In </a>
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

	<h1>Venue Details</h1>

	<%
    try {
    	ArrayList<Venue> venues = (ArrayList<Venue>)request.getAttribute("venues");
    	
    	if (venues.isEmpty()) {
    		%>
	<div class="alert alert-warning" role="alert">No venues found.</div>
	<% }else {    
    		for (Venue venue : venues) {
        	  String base64Image = Base64.getEncoder().encodeToString(venue.getImage());
%>
	<div class="card">

		<img src="data:image/jpeg;base64,<%=base64Image%>" alt="Venue ">
		<h2><%=venue.getVenueName()%></h2>
		<p>
			  <i class="fa fa-map-marker">   Location &nbsp;&nbsp;&nbsp;&nbsp;</i> : &nbsp;&nbsp;&nbsp;
			<%=venue.getLocation()%></p>
		<p>
			<i class="fa fa-group"> Capacity &nbsp;&nbsp;</i> : &nbsp;&nbsp;&nbsp;
			<%=venue.getCapacity()%></p>
		<p>
			<i class="fa fa-phone"> Contact &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i> : &nbsp;&nbsp;&nbsp;
			<%=venue.getContactPhone()%></p>
		<p>
			<i class="fa fa-rupee"> Start's at &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i> : &nbsp;&nbsp;&nbsp;
			<%=venue.getPrice()%></p>
		<form action="addService" method="post">

			<input type="hidden" name="venueId" value="<%= venue.getVenueId() %>">
			<input type="hidden" name="venuePrice"
				value="<%= venue.getPrice() %>"> <input type="hidden"
				name="date" value="<%= request.getAttribute("date") %>"> <input
				type="hidden" name="eventType"
				value="<%= request.getAttribute("event") %>"> <input
				type="hidden" name="action" value="getService">
			<button type="submit" class="btn btn-primary">Select</button>
		</form>
	</div>
	<%}
        }
    } catch (Exception e) {
        out.println("Error retrieving venues: " + e.getMessage());
    }
%>

</body>
</html>
