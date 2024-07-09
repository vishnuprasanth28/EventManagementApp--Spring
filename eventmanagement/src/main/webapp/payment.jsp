<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=en>
<head>
    <meta charset="UTF-8">
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Page</h1>
        <div class="row">
            <div class="col-md-6">
                <h3>Select Payment Method</h3>
                <form id="paymentMethodForm">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="debitCardOption" value="debit" checked>
                        <label class="form-check-label" for="debitCardOption">
                            Debit Card
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="creditCardOption" value="credit">
                        <label class="form-check-label" for="creditCardOption">
                            Credit Card
                        </label>
                    </div>
                    <button type="button" class="btn btn-primary mt-3" onclick="submitPaymentMethod()">Next</button>
                </form>
            </div>
        </div>

        <div class="row mt-5" id="cardDetailsSection" style="display: none;">
            <div class="col-md-6">
                <h3 id="paymentMethodLabel">Debit Card Details</h3>
                <form id="paymentDetailsForm">
                    <div class="form-group">
                        <label for="cardNumber">Card Number</label>
                        <input type="text" class="form-control" id="cardNumber" name="cardNumber"  pattern="[0-9]{13,16}" required>
                    </div>
                    <div class="form-group">
                        <label for="expiryDate">Expiry Date</label>
                        <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY"  pattern="(0[1-9]|1[0-2])\/[0-9]{2}"required>
                    </div>
                    <div class="form-group">
                        <label for="cvv">CVV</label>
                        <input type="text" class="form-control" id="cvv" name="cvv" pattern="[0-9]{3,4}" required>
                    </div>
                        <div class="form-group">
    <label for="advance">Price</label>
    <input type="text" class="form-control" id="advance" name="advance" value="<%= request.getAttribute("price") %>" required>
</div>
                    <button type="button" class="btn btn-success" onclick="processPayment()">Pay Now</button>
                </form>
            </div>
        </div>

        <div class="row mt-5" id="paymentResultSection" style="display: none;">
            <div class="col-md-6">
                <div class="alert alert-success" role="alert">
                    Payment Successful!
                    
                    <a href="index.jsp">Back to home...</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function submitPaymentMethod() {
            var paymentMethod = $("input[name='paymentMethod']:checked").val();
            if (paymentMethod === 'debit') {
                $("#paymentMethodLabel").text("Debit Card Details");
            } else {
                $("#paymentMethodLabel").text("Credit Card Details");
            }
            $("#paymentMethodForm").hide();
            $("#cardDetailsSection").show();
        }

        function processPayment() {
            
            $("#cardDetailsSection").hide();
            $("#paymentResultSection").show();
        }
    </script>
</body>
</html>
