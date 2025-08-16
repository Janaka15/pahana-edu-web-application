<%@ page import="com.example.pahanaeduwebapplication.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/15/2025
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<User> cashiers = (List<User>) request.getAttribute("cashiers");
  User user = (User) session.getAttribute("user");
  if (user == null || !"admin".equals(user.getRole())) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<%
  String role = (String) session.getAttribute("role");
  String dashboardPage = "cashier_dashboard.jsp"; // default
  if ("admin".equalsIgnoreCase(role)) {
    dashboardPage = "admin_dashboard.jsp";
  }
%>
<html>
<head>
  <title>Manage Cashiers</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
  <h3>Cashier Accounts</h3>

  <% if (cashiers == null || cashiers.isEmpty()) { %>
  <div class="alert alert-info">No cashiers found.</div>
  <% } else { %>
  <table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Username</th>
      <th>Full Name</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (User c : cashiers) { %>
    <tr>
      <td><%= c.getId() %></td>
      <td><%= c.getUsername() %></td>
      <td><%= c.getFullName() %></td>
      <td>
        <a href="cashiers?action=edit&id=<%= c.getId() %>" class="btn btn-warning btn-sm">Edit</a>
        <a href="cashiers?action=delete&id=<%= c.getId() %>" class="btn btn-danger btn-sm"
           onclick="return confirm('Delete this cashier?');">Delete</a>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <% } %>
  <a href="<%= dashboardPage %>" class="btn btn-secondary">⬅ Back to Dashboard</a>
</div>
</body>
</html>
