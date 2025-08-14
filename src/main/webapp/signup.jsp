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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" >
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
<body class="bg-light">
<div class="container mt-5">
    <div class="col-md-4 offset-md-4">
        <div class="card p-4 shadow">
            <h3 class="text-center">Signup</h3>
            <form method="post" action="signup" onsubmit="return validateForm()">
                <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
                <% } %>
                <div class="mb-3">
                    <label>Full Name</label>
                    <input type="text" name="fullname" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Confirm Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" required>
                </div>
                <button class="btn btn-success w-100">Sign Up</button>
                <p class="mt-3 text-center">
                    Already have an account? <a href="login.jsp">Login</a>
                </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
