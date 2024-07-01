<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Form</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;
  }
  
  .container {
    max-width: 500px;
    margin: 50px auto;
    background: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  }
  
  h2 {
    text-align: center;
    margin-bottom: 20px;
  }
  
  .form-group {
    margin-bottom: 20px;
  }
  
  label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
  }
  
  input[type="text"],
  input[type="email"],
  input[type="password"] {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    transition: border-color 0.3s;
  }
  
  input[type="text"]:focus,
  input[type="email"]:focus,
  input[type="password"]:focus {
    border-color: #007bff;
  }
  
  input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  
  input[type="submit"]:hover {
    background-color: #0056b3;
  }
  
  .error {
    color: red;
    font-size: 12px;
  }
  
  @media screen and (max-width: 600px) {
    .container {
      width: 90%;
    }
  }
</style>
</head>
<body>

<div class="container">
  <h2>Registration Form</h2>
 
    <form id="registrationForm" action="registerUser" method="post">
    <div class="form-group">
      <label for="username">User Name:</label>
      <input type="text" id="username" name="username" pattern="[A-Za-z]+" title="Please enter only letters" required>
      <span id="usernameError" class="error"></span>
    </div>
    <div class="form-group">
      <label for="mobile">Mobile No:</label>
      <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" required>
      <span id="mobileError" class="error"></span>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required>
      <span id="emailError" class="error"></span>
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" pattern="(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}" required>
      <span id="passwordError" class="error"></span>
    </div>
    <div class="form-group">
      <label for="confirmPassword">Confirm Password:</label>
      <input type="password" id="confirmPassword" name="confirmPassword" pattern="(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}" required>
      <span id="confirmPasswordError" class="error"></span>
    </div>
    <input type="hidden" name="action" value="register">
    <button type="submit" id="submitBtn">Register</button>
  </form>

  <br><br>

   
    <a href="user.jsp">already have account ? </a>
</div>

 <script>
    document.addEventListener('DOMContentLoaded', function() {
      var usernameInput = document.getElementById('username');
      var mobileInput = document.getElementById('mobile');
      var emailInput = document.getElementById('email');
      var passwordInput = document.getElementById('password');
      var confirmPasswordInput = document.getElementById('confirmPassword');
      var submitBtn = document.getElementById('submitBtn');

      // Username validation
      usernameInput.addEventListener('input', function() {
        var usernameError = document.getElementById('usernameError');
        if (!/^[A-Za-z]+$/.test(usernameInput.value)) {
          usernameError.textContent = 'Please enter only letters.';
        } else {
          usernameError.textContent = '';
        }
      });

      // Mobile number validation
      mobileInput.addEventListener('input', function() {
        var mobileError = document.getElementById('mobileError');
        if (!/^[0-9]{10}$/.test(mobileInput.value)) {
          mobileError.textContent = 'Please enter a valid 10-digit mobile number.';
        } else {
          mobileError.textContent = '';
        }
      });

      // Email validation
      emailInput.addEventListener('input', function() {
        var emailError = document.getElementById('emailError');
        if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(emailInput.value)) {
          emailError.textContent = 'Please enter a valid email address.';
        } else {
          emailError.textContent = '';
        }
      });

      // Password validation
      passwordInput.addEventListener('input', function() {
        var passwordError = document.getElementById('passwordError');
        if (!/(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}/.test(passwordInput.value)) {
          passwordError.textContent = 'Password must be at least 8 characters long and include at least one letter, one number, and one special character.';
        } else {
          passwordError.textContent = '';
        }
      });

      // Confirm password validation
      confirmPasswordInput.addEventListener('input', function() {
        var confirmPasswordError = document.getElementById('confirmPasswordError');
        if (passwordInput.value !== confirmPasswordInput.value) {
          confirmPasswordError.textContent = 'Passwords do not match.';
        } else {
          confirmPasswordError.textContent = '';
        }
      });

      // Disable submit button until all fields are valid
      submitBtn.addEventListener('click', function(event) {
        var isValid = true;

        if (!/^[A-Za-z]+$/.test(usernameInput.value)) {
          document.getElementById('usernameError').textContent = 'Please enter only letters.';
          isValid = false;
        }

        if (!/^[0-9]{10}$/.test(mobileInput.value)) {
          document.getElementById('mobileError').textContent = 'Please enter a valid 10-digit mobile number.';
          isValid = false;
        }

        if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(emailInput.value)) {
          document.getElementById('emailError').textContent = 'Please enter a valid email address.';
          isValid = false;
        }

        if (!/(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}/.test(passwordInput.value)) {
          document.getElementById('passwordError').textContent = 'Password must be at least 8 characters long and include at least one letter, one number, and one special character.';
          isValid = false;
        }

        if (passwordInput.value !== confirmPasswordInput.value) {
          document.getElementById('confirmPasswordError').textContent = 'Passwords do not match.';
          isValid = false;
        }

        if (!isValid) {
          event.preventDefault(); // Prevent form submission
        }
      });
    });
  </script>

</body>
</html>
