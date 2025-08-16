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
  <style>
    .hover-shadow:hover {
      transform: translateY(-5px);
      transition: all 0.3s ease;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
  </style>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    .hover-shadow:hover {
      transform: translateY(-5px);
      transition: all 0.3s ease;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }
    .card-text-center {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Pahana Edu - Cashier</a>
    <div class="d-flex">
      <span class="navbar-text me-3 text-white">Welcome, <%= user.getFullName() %></span>
      <a href="logout" class="btn btn-danger btn-sm">Logout</a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <div class="row g-4">
    <div class="col-lg-3 col-md-4 col-sm-6">
      <a href="customers" class="text-decoration-none">
        <div class="card shadow text-center p-4 hover-shadow card-text-center">
          <i class="bi bi-people-fill display-4 text-success mb-3"></i>
          <h5>Manage Customers</h5>
        </div>
      </a>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6">
      <a href="billing" class="text-decoration-none">
        <div class="card shadow text-center p-4 hover-shadow card-text-center">
          <i class="bi bi-receipt-cutoff display-4 text-primary mb-3"></i>
          <h5>Create Bill</h5>
        </div>
      </a>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6">
      <a href="salesHistory" class="text-decoration-none">
        <div class="card shadow text-center p-4 hover-shadow card-text-center">
          <i class="bi bi-graph-up display-4 text-warning mb-3"></i>
          <h5>My Sales History</h5>
        </div>
      </a>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6">
      <a href="viewStock" class="text-decoration-none">
        <div class="card shadow text-center p-4 hover-shadow card-text-center">
          <i class="bi bi-box-seam display-4 text-info mb-3"></i>
          <h5>View Stock</h5>
        </div>
      </a>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6">
      <a href="help.jsp" class="text-decoration-none">
        <div class="card shadow text-center p-4 hover-shadow card-text-center">
          <i class="bi bi-question-circle display-4 text-secondary mb-3"></i>
          <h5>Help</h5>
        </div>
      </a>
    </div>
  </div>
</div>
</body>
</html>
