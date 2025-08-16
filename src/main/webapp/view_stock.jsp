<%@ page import="com.example.pahanaeduwebapplication.model.Item" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/16/2025
  Time: 11:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<Item> items = (List<Item>) request.getAttribute("items");
  String role = (String) session.getAttribute("role");
  String dashboardPage = "cashier_dashboard.jsp";
  if ("admin".equalsIgnoreCase(role)) {
    dashboardPage = "admin_dashboard.jsp"; // in case admin also checks
  }
%>
<html>
<head>
  <title>View Stock</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
  <h3>📦 Available Stock</h3>

  <table class="table table-striped table-bordered">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Category</th>
      <th>Price</th>
      <th>Quantity</th>
    </tr>
    </thead>
    <tbody>
    <%
      if (items != null && !items.isEmpty()) {
        for (Item item : items) {
    %>
    <tr>
      <td><%= item.getId() %></td>
      <td><%= item.getName() %></td>
      <td><%= item.getCategory() %></td>
      <td>Rs. <%= String.format("%.2f", item.getPrice()) %></td>
      <td><%= item.getQuantity() %></td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="4" class="text-center">No stock available</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>

  <a href="<%= dashboardPage %>" class="btn btn-secondary">⬅ Back to Dashboard</a>
</div>
</body>
</html>