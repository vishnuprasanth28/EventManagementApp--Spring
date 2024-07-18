<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.eventmanagement.model.Show" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Download Coupon as PDF</title>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.2/html2pdf.bundle.js"></script>
<style>
* {
  margin: 0;
  padding: 0;
}
body {
  background: lightblue;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}
.coupon {
  width: 400px;
  height: 200px;
  border-radius: 10px;
  overflow: hidden;
  margin: auto;
  filter: drop-shadow(0 3px 5px rgba(0, 0, 0, 0.5));
  display: flex;
  align-items: stretch;
  position: relative;
  text-transform: uppercase;
}
.coupon::before,
.coupon::after {
  content: "";
  position: absolute;
  top: 0;
  width: 50%;
  height: 100%;
  z-index: -1;
}
.coupon::before {
  left: 0;
  background-image: radial-gradient(
    circle at 0 50%,
    transparent 25px,
    gold 26px
  );
}
.coupon::after {
  right: 0;
  background-image: radial-gradient(
    circle at 100% 50%,
    transparent 25px,
    gold 26px
  );
}
.coupon > div {
  display: flex;
  align-items: center;
  justify-content: center;
}
.left {
  width: 20%;
  border-right: 2px dashed rgba(0, 0, 0, 0.13);
}
.left div {
  transform: rotate(-90deg);
  white-space: nowrap;
  font-weight: bold;
}
.center {
  flex-grow: 1;
  text-align: left;
}
.right {
  width: 120px;
  background-image: radial-gradient(
    circle at 100% 50%,
    transparent 25px,
    #fff 26px
  );
}
.right div {
  font-family: "Libre Barcode 128 Text", cursive;
  font-size: 1.5rem;
  font-weight: 400;
  transform: rotate(-90deg);
}
.center h6 {
  background: #000;
  color: gold;
  padding: 0 10px;
  font-size: 1rem;
  white-space: nowrap;
}
.center h3 {
  font-size: 1rem;
}
.center small {
  font-size: 0.625rem;
  font-weight: 600;
  letter-spacing: 2px;
}
@media screen and (max-width:500px){
  .coupon {
    display:grid;
    grid-template-columns:1fr;
  }
  .left div {
    transform: rotate(0deg);
  }
  .right div {
    transform: rotate(0deg);
  }
}
</style>
</head>
<body>
<div style="text-align: center; margin-top: 20px;">
    <a href="<%= request.getContextPath() %>/index.jsp" class="button">Back to Home</a>
</div>

<%
    // Assuming 'bookingDetails' attribute contains the Show object
    Show show = (Show) request.getAttribute("bookingDetails");
%>
<div style="text-align: center; margin-top: 20px;">
  <button id="download">Download ticket</button>
</div>
<div class="coupon" id="ticket">
  <div class="left">
    <div>Enjoy Your Show</div>
  </div>
  <div class="center">
    <div>
      <h6><%= show.getName() %></h6>
      <p>Persons: <%= show.getTicketsBooked() %></p>
      <small>Date: <%= show.getDate() %></small><br>
      <small>Start Time: <%= show.getStartTime() %></small><br>
      <small>End Time: <%= show.getEndTime() %></small>
    </div>
  </div>
  <div class="right">
    <div><%= show.getTicketId() %></div>
  </div>
</div>



<script>
window.onload = function() {
  document.getElementById("download").addEventListener("click", () => {
    const ticket = document.getElementById("ticket");
    
    var opt = {
      margin: 1,
      filename: 'coupon.pdf',
      image: { type: 'jpeg', quality: 0.98 },
      html2canvas: { scale: 2 },
      jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
    };
    
    html2pdf().from(ticket).set(opt).save();
  });
};
</script>

</body>
</html>
