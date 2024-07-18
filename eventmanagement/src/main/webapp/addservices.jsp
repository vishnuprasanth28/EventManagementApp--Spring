<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Base64" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.chainsys.eventmanagement.model.Vendor" %>

<%@ page import="com.chainsys.eventmanagement.model.Venue" %>
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
<title>Additional Services</title>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
            width: 300px;
        }
        
        .box{
        display: flex;
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
    <a class="navbar-brand" href="index.jsp"><img src="images/epic-events-high-resolution-logo.png" alt="Company Logo" style="height: 40px;"></a>
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
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  onkeypress="handleKeyPress(event)"
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






<form action="checkout" method="post">
 <input type="hidden" name="venue" value="<%= request.getAttribute("venueId") %>">
 <input type="hidden" name="venuePrice" value="<%= request.getAttribute("venuePrice") %>">
    <input type="hidden" name="date" value="<%= request.getParameter("date") %>">
    <input type="hidden" name="eventType" value="<%= request.getAttribute("event") %>">
	  <input type="hidden" name="action" value="checkout">
<h1>Photography</h1>
<div class="box">


<%
    try {
    	ArrayList<Vendor> availablePhotographer = (ArrayList<Vendor>)request.getAttribute("photography");
        for (Vendor photographer : availablePhotographer) {
        	  String base64Image = Base64.getEncoder().encodeToString(photographer.getImage());
        	  
%>
            <div class="card">
            
                <img src="data:image/jpeg;base64,<%=base64Image%>" alt="profile ">
                <h2><i class="fas fa-camera"></i>&nbsp;&nbsp;&nbsp;<%= photographer.getVendorName()%></h2>
                <p>Contact Phone : <%=photographer.getContact()%></p>
                <p>Price starts from : <%=photographer.getPrice()%></p>
                
               <input type="radio" name="selectedPhotographers" value="<%= photographer.getVendorId() %>">
               <input type="hidden" name="pricePhoto_<%= photographer.getVendorId() %>" value="<%= photographer.getPrice() %>">
                
            </div>
       
<%
        }
    } catch (Exception e) {
        out.println("Error retrieving venues: " + e.getMessage());
    }
%>
</div>
<h1>Wine and Dine</h1>
<div class="box">


<%
    try {
    	ArrayList<Vendor> availableCatering = (ArrayList<Vendor>)request.getAttribute("catering");
        for (Vendor catering : availableCatering) {
        	  String base64Image = Base64.getEncoder().encodeToString(catering.getImage());
%>
            <div class="card">
            
                <img src="data:image/jpeg;base64,<%=base64Image%>" alt="profile ">
                <h2><i class="fas fa-utensils"></i>&nbsp;&nbsp;&nbsp;<%=catering.getVendorName()%></h2>
                <p>Contact Phone : <%=catering.getContact()%></p>
                <p>Price starts from  : <%=catering.getPrice()%></p>
               
             			
                      <input type="radio" name="selectedCaterings" value="<%= catering.getVendorId() %>">
                	<input type="hidden" name="priceCatering_<%= catering.getVendorId() %>" value="<%= catering.getPrice() %>">
            </div>
<%
        }
    } catch (Exception e) {
        out.println("Error retrieving venues: " + e.getMessage());
    }
%>
</div>


   
    <input type="submit" class="btn btn-primary" value="Continue">
</form>
</body>
</html>