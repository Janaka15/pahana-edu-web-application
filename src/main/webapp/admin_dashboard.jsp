<%@ page import="com.example.pahanaeduwebapplication.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/14/2025
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null || !"admin".equals(user.getRole())) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<html>
<head>
  <title>Admin Dashboard - Pahana Edu</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Pahana Edu - Admin</a>
    <div class="d-flex">
      <span class="navbar-text me-3 text-white">Welcome, <%= user.getFullName() %></span>
      <a href="logout" class="btn btn-danger btn-sm">Logout</a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <div class="row g-4">
    <div class="col-md-3">
      <a href="cashiers.jsp" class="text-decoration-none">
        <div class="card shadow text-center p-3">
          <h5>Manage Cashiers</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3">
      <a href="customers" class="text-decoration-none">
        <div class="card shadow text-center p-3">
          <h5>Manage Customers</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3">
      <a href="items.jsp" class="text-decoration-none">
        <div class="card shadow text-center p-3">
          <h5>Manage Items</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3">
      <a href="billing.jsp" class="text-decoration-none">
        <div class="card shadow text-center p-3">
          <h5>Create Bill</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3">
      <a href="bills.jsp" class="text-decoration-none">
        <div class="card shadow text-center p-3">
          <h5>View All Bills</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3">
      <a href="reports.jsp" class="text-decoration-none">
        <div class="card shadow text-center p-3">
          <h5>Reports</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3">
      <a href="help.jsp" class="text-decoration-none">
        <div class="card shadow text-center p-3">
          <h5>Help</h5>
        </div>
      </a>
    </div>
  </div>
</div>
</body>
</html>
