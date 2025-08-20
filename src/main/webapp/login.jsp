<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/14/2025
  Time: 6:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Login - Pahana Edu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #0d6efd, #20c997);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-card {
            background: white;
            border-radius: 15px;
            padding: 40px 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
        }
        .login-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-header h3 {
            margin-top: 10px;
            font-weight: bold;
            color: #0d6efd;
        }
        .form-control {
            border-radius: 10px;
            padding-left: 40px;
        }
        .input-group-text {
            border-radius: 10px 0 0 10px;
            background: #f8f9fa;
        }
        .btn-primary {
            border-radius: 10px;
            padding: 10px;
            font-weight: bold;
        }
        .signup-link {
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>

<body>
<div class="login-card">
    <div class="login-header">
        <i class="bi bi-book-fill text-primary display-4"></i>
        <h3>Pahana Edu</h3>
        <p class="text-muted">Login to your account</p>
    </div>

    <form method="post" action="login">
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger text-center"><%= request.getAttribute("error") %></div>
        <% } %>

        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
            <input type="text" name="username" class="form-control" placeholder="Enter username" required>
        </div>
        <div class="mb-3 input-group">
            <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
        </div>

        <button class="btn btn-primary w-100">Login</button>

        <div class="signup-link">
            <p>Don't have an account? <a href="signup.jsp" class="text-decoration-none">Sign up</a></p>
        </div>
    </form>
</div>
<%
    String success = request.getParameter("success");
%>
<script>
    window.onload = function () {
        <% if ("1".equals(success)) { %>
        alert("Signup successful! Please login now.");
        <% } %>
    };
</script>
</body>
</html>
