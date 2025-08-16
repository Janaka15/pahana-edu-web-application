<%@ page import="com.example.pahanaeduwebapplication.model.Item" %>
<%@ page import="com.example.pahanaeduwebapplication.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/15/2025
  Time: 12:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Item> items = (List<Item>) request.getAttribute("items");
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    boolean isAdmin = "admin".equals(user.getRole());
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
    <title>Manage Stock</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h3>Stock List</h3>

    <% if (isAdmin) { %>
    <a href="items?action=add" class="btn btn-success mb-3">Add New Item</a>
    <% } %>

    <% if (items == null || items.isEmpty()) { %>
    <div class="alert alert-info">No items found.</div>
    <% } else { %>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Quantity</th>
            <% if (isAdmin) { %><th>Actions</th><% } %>
        </tr>
        </thead>
        <tbody>
        <% for (Item item : items) { %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getName() %></td>
            <td><%= item.getCategory() %></td>
            <td>Rs. <%= String.format("%.2f", item.getPrice()) %></td>
            <td><%= item.getQuantity() %></td>
            <% if (isAdmin) { %>
            <td>
                <a href="items?action=edit&id=<%= item.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="items?action=delete&id=<%= item.getId() %>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Delete this item?');">Delete</a>
            </td>
            <% } %>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } %>
    <a href="<%= dashboardPage %>" class="btn btn-secondary">⬅ Back to Dashboard</a>
</div>
</body>
</html>
