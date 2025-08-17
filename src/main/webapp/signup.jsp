<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/14/2025
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signup - Pahana Edu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #20c997, #0d6efd);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .signup-card {
            background: white;
            border-radius: 15px;
            padding: 40px 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 420px;
        }
        .signup-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .signup-header h3 {
            margin-top: 10px;
            font-weight: bold;
            color: #20c997;
        }
        .form-control {
            border-radius: 10px;
            padding-left: 40px;
        }
        .input-group-text {
            border-radius: 10px 0 0 10px;
            background: #f8f9fa;
        }
        .btn-success {
            border-radius: 10px;
            padding: 10px;
            font-weight: bold;
        }
        .login-link {
            margin-top: 15px;
            text-align: center;
        }
    </style>
    <script>
        function validateForm() {
            let pass = document.getElementById("password").value;
            let confirm = document.getElementById("confirmPassword").value;
            if (pass !== confirm) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="signup-card">
    <div class="signup-header">
        <i class="bi bi-person-plus-fill text-success display-4"></i>
        <h3>Create Account</h3>
        <p class="text-muted">Join Pahana Edu as a cashier</p>
    </div>

    <form method="post" action="signup" onsubmit="return validateForm()">
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger text-center"><%= request.getAttribute("error") %></div>
        <% } %>

        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
            <input type="text" name="fullname" class="form-control" placeholder="Full Name" required>
        </div>
        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="bi bi-person-badge-fill"></i></span>
            <input type="text" name="username" class="form-control" placeholder="Username" required>
        </div>
        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
            <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
        </div>
        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="bi bi-shield-lock-fill"></i></span>
            <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Confirm Password" required>
        </div>

        <button class="btn btn-success w-100">Sign Up</button>

        <div class="login-link">
            <p>Already have an account? <a href="login.jsp" class="text-decoration-none">Login</a></p>
        </div>
    </form>
</div>
</body>
</html>
