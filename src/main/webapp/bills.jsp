<%@ page import="com.example.pahanaeduwebapplication.model.Bill" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/16/2025
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Bill> bills = (List<Bill>) request.getAttribute("bills");
%>
<%
  String role = (String) session.getAttribute("role");
  String dashboardPage = "cashier_dashboard.jsp"; // default
  if ("admin".equals(role)) {
    dashboardPage = "admin_dashboard.jsp";
  }
%>
<html>
<head>
  <title>Manage Bills</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
  <h3>All Bills</h3>
  <table class="table table-bordered">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Date</th>
      <th>Cashier</th>
      <th>Total</th>
      <th>Amount Given</th>
      <th>Balance</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% if (bills == null || bills.isEmpty()) { %>
    <tr><td colspan="7" class="text-center">No bills found</td></tr>
    <% } else {
      for (Bill bill : bills) { %>
    <tr>
      <td><%= bill.getId() %></td>
      <td><%= bill.getBillDate() %></td>
      <td><%= bill.getCreatedBy() %></td>
      <td><%= bill.getTotal() %></td>
      <td><%= bill.getAmountGiven() %></td>
      <td><%= bill.getBalance() %></td>
      <td>
        <a href="bills?action=edit&id=<%= bill.getId() %>" class="btn btn-warning btn-sm">Edit</a>
        <a href="bills?action=delete&id=<%= bill.getId() %>" class="btn btn-danger btn-sm"
           onclick="return confirm('Are you sure you want to delete this bill?');">Delete</a>
      </td>
    </tr>
    <% } } %>
    </tbody>
  </table>
  <a href="<%= dashboardPage %>" class="btn btn-secondary">⬅ Back to Dashboard</a>
</div>
</body>
</html>