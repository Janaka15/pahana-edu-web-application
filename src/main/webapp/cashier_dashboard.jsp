<%@ page import="com.example.pahanaeduwebapplication.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/14/2025
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null || !"cashier".equals(user.getRole())) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<html>
<head>
  <title>Cashier Dashboard - Pahana Edu</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
  <style>
    body {
      background: #f8f9fa;
    }
    .dashboard-header {
      background: linear-gradient(135deg, #198754, #20c997);
      color: white;
      padding: 30px 20px;
      border-radius: 0 0 20px 20px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
      margin-bottom: 30px;
    }
    .card-custom {
      border-radius: 15px;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .card-custom:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 15px rgba(0,0,0,0.3);
    }
    .card-icon {
      font-size: 40px;
      margin-bottom: 15px;
      color: #198754;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="#">💵 Pahana Edu - Cashier</a>
    <div class="d-flex">
      <span class="navbar-text text-white">Welcome, <%= user.getFullName() %></span>
    </div>
  </div>
</nav>

<div class="dashboard-header text-center">
  <h2>Cashier Dashboard</h2>
  <p class="mb-0">Quick access to daily billing and reports</p>
</div>

<div class="container mt-4">
  <div class="row g-4">
    <div class="col-md-3 col-sm-6">
      <a href="customers" class="text-decoration-none">
        <div class="card card-custom shadow text-center p-3">
          <i class="bi bi-people-fill card-icon text-success"></i>
          <h5>Manage Customers</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3 col-sm-6">
      <a href="billing" class="text-decoration-none">
        <div class="card card-custom shadow text-center p-3">
          <i class="bi bi-receipt-cutoff card-icon text-primary"></i>
          <h5>Create Bill</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3 col-sm-6">
      <a href="salesHistory" class="text-decoration-none">
        <div class="card card-custom shadow text-center p-3">
          <i class="bi bi-graph-up card-icon text-warning"></i>
          <h5>My Sales History</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3 col-sm-6">
      <a href="viewStock" class="text-decoration-none">
        <div class="card card-custom shadow text-center p-3">
          <i class="bi bi-box-seam card-icon text-info"></i>
          <h5>View Stock</h5>
        </div>
      </a>
    </div>
    <div class="col-md-3 col-sm-6">
      <a href="help.jsp" class="text-decoration-none">
        <div class="card card-custom shadow text-center p-3">
          <i class="bi bi-question-circle card-icon text-secondary"></i>
          <h5>Help</h5>
        </div>
      </a>
    </div>

    <div class="col-md-3 col-sm-6">
      <a href="logout" class="text-decoration-none" onclick="return confirm('Do you want to logout?')">
        <div class="card card-custom shadow text-center p-3 bg-danger text-white">
          <i class="bi bi-box-arrow-right card-icon text-white"></i>
          <h5>Logout</h5>
        </div>
      </a>
    </div>
  </div>
</div>
<% if (session.getAttribute("successMessage") != null) { %>
<script>
  alert("<%= session.getAttribute("successMessage") %>");
</script>
<%
  // remove message after showing once
  session.removeAttribute("successMessage");
%>
<% } %>
</body>
</html>