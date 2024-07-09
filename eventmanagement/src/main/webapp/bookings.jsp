<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.util.*" %>
    <%@ page import="com.chainsys.eventmanagement.model.User" %>
    <%@ page import="com.chainsys.eventmanagement.model.Show" %>
    <%

User user = (User) session.getAttribute("user");
boolean isLoggedIn = (user != null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking </title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>


 h1 {
    text-align: center;
    margin-bottom: 50px;
}

.event-grid {
    display: flex;
    justify-content:space-evenly;
    flex-wrap: wrap;
   margin-top: 20px;
}

.event-card {
    position: relative;
    width: 30%;
    margin-bottom: 30px;
    overflow: hidden;
    transition: transform 0.3s ease;
     display: flex; 
        flex-direction: column;
}

.event-card:hover {
    transform: translateY(-10px);
}

.event-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.event-info {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    padding: 15px;
    background-color: rgba(0, 0, 0, 0.6);
    color: #fff;
    transition: transform 0.3s ease;
    transform: translateY(100%);
}

.event-card:hover .event-info {
    transform: translateY(0);
}

.event-info h3 {
    margin: 0;
    margin-bottom: 5px;
}

.event-info p {
    margin: 0;
    margin-bottom: 10px;
}

.book-ticket {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #ff6347;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.book-ticket:hover {
    background-color: #e65136;
}

    </style>
    
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="#"><img src="images/epic-events-high-resolution-logo.png" alt="Company Logo" style="height: 40px;"></a>
    <span class="navbar-text mr-auto">EPIC EVENTS</span>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="services.jsp">Services</a>
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
                        <a class="dropdown-item" href="admin.jsp">Admin</a>
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
	 <h1>Upcoming Events</h1>
    
        <div class="event-grid">
         
            <% List<Show> shows = (List<Show>) request.getAttribute("shows"); %>
            <% for (Show show : shows) {
            	String base64Image = Base64.getEncoder().encodeToString(show.getPosterImage());
            	%>
                <div class="event-card">
                   <img src="data:image/jpeg;base64,<%=base64Image%>" alt="poster">
                    <div class="event-info">
                        <h3><%= show.getName() %></h3>
                        <p>Location: <%= show.getLocation() %></p>
                        <p>Date: <%= show.getDate() %></p>
                        <p>Time: <%= show.getStartTime() %> - <%= show.getEndTime() %></p>
                          <button class="book-ticket" onclick="showTicketPopup('<%= show.getId() %>', <%= user.getUserId() %>, <%= show.getPrice() %>);"  >Book Tickets</button>
                    </div>
                </div>
            <% } %>
        </div>
 <div class="modal fade" id="ticketModal" tabindex="-1" role="dialog" aria-labelledby="ticketModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ticketModalLabel">Book Tickets</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="ticketForm" action="bookTickets" method="post">
                    <input type="hidden" id="showId" name="showId">
                    <input type="hidden" id="userId" name="userId" value="<%= user.getUserId() %>">
                    <div class="form-group">
                        <label for="numTickets">Number of Tickets</label>
                        <input type="number" class="form-control" id="numTickets" name="numTickets" min="1" max="5"
                               required oninput="calculateTotal()">
                    </div>
                    <div class="form-group">
                        <label for="showPrice">Show Price</label>
                        <input type="text" class="form-control" id="showPrice" name="showPrice" readonly>
                    </div>
                    <div class="form-group">
                        <label for="totalPrice">Total Price</label>
                        <input type="text" class="form-control" id="totalPrice" name="totalPrice" readonly>
                    </div>
                    <button type="submit" class="btn btn-primary">Confirm Booking</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    function showTicketPopup(showId, userId, showPrice) {
        document.getElementById('showId').value = showId;
        document.getElementById('userId').value = userId;
        
        document.getElementById('showPrice').value = showPrice;
       
        calculateTotal(); 
        $('#ticketModal').modal('show');
    }

    function calculateTotal() {
        var numTickets = document.getElementById('numTickets').value;
        var showPrice = document.getElementById('showPrice').value;
        var totalPrice = numTickets * parseFloat(showPrice);
        document.getElementById('totalPrice').value = totalPrice.toFixed(2);
    }
</script>
        
 
</body>
</html>