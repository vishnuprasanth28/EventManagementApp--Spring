<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="com.chainsys.eventmanagement.model.User" %>
    <%

User user = (User) session.getAttribute("user");
boolean isLoggedIn = (user != null);
%>
<!DOCTYPE html>
<html lang=en>
<head>
    <meta charset="UTF-8">
    <title>Event Booking</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#"><img src="images/epic-events-high-resolution-logo.png" alt="Company Logo" style="height: 40px;"></a>
    <span class="navbar-text mr-auto">EPIC EVENTS</span>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="service.jsp">Services</a>
      </li>
       <% if (!isLoggedIn) { %>
                <!-- Show Sign Up and Sign In only if the user is not logged in -->
                <li class="nav-item">
                    <a class="nav-link" href="registration.jsp">Sign Up</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"   onkeypress="handleKeyPress(event)"
       onkeydown="handleKeyDown(event)">
                    Sign In
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="signIn.jsp">Admin</a>
                        <a class="dropdown-item" href="user.jsp">User</a>
                    </div>
                </li>
                <% } else { %>
                <!-- Show user's name if logged in -->
                <li class="nav-item">
                    <span class="nav-link">Hii <%= user.getUserName() %></span>
                    
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

<div class="container mt-5">
    <h2>Book Your Event</h2>
    <form action="getVenue" method="post" onsubmit="return validateForm()" id="eventBookingForm">
        <div class="form-group">
            <label for="eventDate">Event Date:</label>
            <input type="date" class="form-control" id="eventDate" name="eventDate"   max="2024-12-30" required>
        </div>
        <div class="form-group">
            <label for="visitorsCount">Number of Visitors:</label>
            <input type="number" class="form-control" id="visitorsCount" name="visitorsCount" required>
        </div>
         <div class="form-group">
            <label for="location">location:</label>
            <input type="text" class="form-control" id="location" name="location"  pattern="[A-Za-z ]+"  required>
        </div>
        <input type="hidden" name="eventType" value="<%= request.getParameter("event") %>">
        <input type="hidden" name="action" value="getVenue">
        <button type="submit" class="btn btn-primary">Book Event</button>
    </form>
</div>

<div class="container mt-5">
    <h2>Our Customer Reviews</h2>
    <%-- Display comments from satisfied customers --%>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Krishna</h5>
            <p class="card-text">"We had an amazing experience with Epic Events. Everything was well-organized and exceeded our expectations."</p>
        </div>
    </div>
    <div class="card mt-3">
        <div class="card-body">
            <h5 class="card-title">Gokul</h5>
            <p class="card-text">"Epic Events made our special day even more memorable. The attention to detail was exceptional."</p>
        </div>
    </div>
    
</div>

<script>
    function validateForm() {
        var eventDateInput = document.getElementById("eventDate");
        var eventDate = eventDateInput.value;
        var visitorsCount = document.getElementById("visitorsCount").value;
        var locationInput = document.getElementById("location");
        var location = locationInput.value.trim(); 

        
        var currentDate = new Date();
        var selectedDate = new Date(eventDate);

        if (selectedDate < currentDate) {
            alert("Event date must be from today onwards.");
            eventDateInput.focus(); 
            return false;
        }

       
        if (!/^[A-Za-z ]+$/.test(location)) {
            alert("Location should contain only alphabetic characters.");
            locationInput.focus(); 
            return false;
        }

        return true;
    }
</script>
</body>
</html>
