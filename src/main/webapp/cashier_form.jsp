<%@ page import="com.example.pahanaeduwebapplication.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/15/2025
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User cashier = (User) request.getAttribute("cashier");
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Edit Cashier</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h3>Edit Cashier</h3>
    <form method="post" action="cashiers">
        <input type="hidden" name="id" value="<%= cashier.getId() %>">
        <div class="mb-3">
            <label>Username</label>
            <input type="text" name="username" value="<%= cashier.getUsername() %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Password</label>
            <input type="text" name="password" value="<%= cashier.getPassword() %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Full Name</label>
            <input type="text" name="fullName" value="<%= cashier.getFullName() %>" class="form-control" required>
        </div>
        <button class="btn btn-primary">Update</button>
        <a href="cashiers" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
