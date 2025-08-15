<%@ page import="com.example.pahanaeduwebapplication.model.User" %>
<%@ page import="com.example.pahanaeduwebapplication.model.Item" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/15/2025
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Item item = (Item) request.getAttribute("item");
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
    boolean editMode = (item != null);
%>
<html>
<head>
    <title><%= editMode ? "Edit Item" : "Add Item" %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h3><%= editMode ? "Edit Item" : "Add Item" %></h3>
    <form method="post" action="items">
        <% if (editMode) { %>
        <input type="hidden" name="id" value="<%= item.getId() %>">
        <% } %>
        <div class="mb-3">
            <label>Name</label>
            <input type="text" name="name" value="<%= editMode ? item.getName() : "" %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Category</label>
            <input type="text" name="category" value="<%= editMode ? item.getCategory() : "" %>" class="form-control">
        </div>
        <div class="mb-3">
            <label>Price (Rs.)</label>
            <input type="number" step="0.01" name="price" value="<%= editMode ? item.getPrice() : "" %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Quantity</label>
            <input type="number" name="quantity" value="<%= editMode ? item.getQuantity() : "" %>" class="form-control" required>
        </div>
        <button class="btn btn-primary"><%= editMode ? "Update" : "Save" %></button>
        <a href="items" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
