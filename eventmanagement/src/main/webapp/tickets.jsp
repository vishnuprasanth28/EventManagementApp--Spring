<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
  text-align: center;
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
  font-size: 2.5rem;
  font-weight: 400;
  transform: rotate(-90deg);
}

.center h2 {
  background: #000;
  color: gold;
  padding: 0 10px;
  font-size: 2.15rem;
  white-space: nowrap;
}

.center h3 {
  font-size: 2.15rem;
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
<div class="coupon">
  <div class="left">
    <div>Enjoy Your Show</div>
  </div>
  <div class="center">
    <div>
      <h2></h2>
      <h3>Show Name</h3>
      <small>Valid until May, 2023</small>
    </div>
  </div>
  
  <div class="right">
    <div>87878521112</div>
  </div>
  
</div>

</body>
</html>