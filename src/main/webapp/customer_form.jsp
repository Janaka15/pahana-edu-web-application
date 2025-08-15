<%@ page import="com.example.pahanaeduwebapplication.model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/15/2025
  Time: 8:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Customer customer = (Customer) request.getAttribute("customer");
    boolean editMode = (customer != null);
%>
<html>
<head>
    <title><%= editMode ? "Edit Customer" : "Add Customer" %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h3><%= editMode ? "Edit Customer" : "Add Customer" %></h3>
    <form method="post" action="customers">
        <% if (editMode) { %>
        <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
        <% } %>
        <div class="mb-3">
            <label>Name</label>
            <input type="text" name="name" value="<%= editMode ? customer.getName() : "" %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Address</label>
            <input type="text" name="address" value="<%= editMode ? customer.getAddress() : "" %>" class="form-control">
        </div>
        <div class="mb-3">
            <label>Telephone</label>
            <input type="text" name="telephone" value="<%= editMode ? customer.getTelephone() : "" %>" class="form-control">
        </div>
        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" value="<%= editMode ? customer.getEmail() : "" %>" class="form-control">
        </div>
        <button class="btn btn-primary"><%= editMode ? "Update" : "Save" %></button>
        <a href="customers" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
