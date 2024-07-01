<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="com.chainsys.eventmanagement.model.User" %>
    <%

User user = (User) session.getAttribute("user");
boolean isLoggedIn = (user != null);
%>
<!DOCTYPE html>
<html lang=en>
<head>
<meta charset="ISO-8859-1">
<title>Epic Events</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

  <style>
    .carousel-item {
      height: 500px;
      position: relative;
    }
    .carousel-text {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      text-align: center;
      color: #fff;
    }
    .footer {
    background-color: #333;
    color: #fff;
    padding: 50px 0;
}

.footer-logo {
    height: 50px; 
}

.footer h5 {
    color: #ffc107; 
}

.footer p {
    margin-bottom: 5px;
}

.social-icons {
    list-style: none;
    padding: 0;
}

.social-icons li {
    display: inline-block;
    margin-right: 10px;
}

.social-icons li a {
    color: #fff;
    font-size: 24px;
    text-decoration: none;
    transition: color 0.3s;
}

.social-icons li a:hover {
    color: #ffc107; 
}

.footer-links {
    list-style: none;
    padding: 0;
}

.footer-links li {
    margin-bottom: 5px;
}

.footer-links li a {
    color: #fff;
    text-decoration: none;
    transition: color 0.3s;
}

.footer-links li a:hover {
    color: #ffc107; 
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
                      <form action="LogOutServlet" method="post">
                        <button type="submit" class="btn btn-primary">Logout</button>
                    </form>
                </li>
                <% } %>
            </ul>
  </div>
</nav>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/birthday.webp" class="d-block w-100" alt="...">
      <div class="carousel-text">
        <h1>Epic Events Services</h1>
        <p>We make your dream events a reality</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/food.webp" class="d-block w-100" alt="...">
      <div class="carousel-text">
        <h1>Venue Decoration</h1>
        <p>Elegance and style in every detail</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/anniversary.webp" class="d-block w-100" alt="...">
      <div class="carousel-text">
        <h1>Memorable Experiences</h1>
        <p>Create unforgettable moments with us</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"   onkeypress="handleKeyPress(event)"
       onkeydown="handleKeyDown(event)">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"   onkeypress="handleKeyPress(event)"
       onkeydown="handleKeyDown(event)">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <img src="images/epic-events-high-resolution-logo.png" alt="Footer Logo" class="footer-logo">
            </div>
            <div class="col-md-3">
                <h5>Contact Us</h5>
                <p>123 Street, Madurai</p>
                <p>Email: epicevent@gmail.com</p>
                <p>Phone: +91 9090878900</p>
            </div>
            <div class="col-md-3">
                <h5>Follow Us</h5>
                <ul class="social-icons">
                    <li><a href="#" class="fab fa-twitter"></a></li>
                    <li><a href="#" class="fab fa-instagram"></a></li>
                    <li><a href="#" class="fab fa-facebook"></a></li>
                  
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Links</h5>
                <ul class="footer-links">
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">Copyright Notice</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>