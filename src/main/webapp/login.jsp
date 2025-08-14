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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="col-md-4 offset-md-4">
        <div class="card p-4 shadow">
            <h3 class="text-center">Login</h3>
            <form method="post" action="../login">
                <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
                <% } %>
                <div class="mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button class="btn btn-primary w-100">Login</button>
                <p class="mt-3 text-center">
                    Don't have an account? <a href="admin_dashboard.jsp">Sign up</a>
                </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
