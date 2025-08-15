<%@ page import="com.example.pahanaeduwebapplication.model.Customer" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/15/2025
  Time: 8:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<html>
<head>
    <title>Manage Customers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h3>Customer List</h3>
    <a href="customers?action=add" class="btn btn-success mb-3">Add New Customer</a>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Account No</th>
            <th>Name</th>
            <th>Address</th>
            <th>Telephone</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Customer c : customers) { %>
        <tr>
            <td><%= c.getAccountNo() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getAddress() %></td>
            <td><%= c.getTelephone() %></td>
            <td><%= c.getEmail() %></td>
            <td>
                <a href="customers?action=edit&id=<%= c.getAccountNo() %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="customers?action=delete&id=<%= c.getAccountNo() %>" class="btn btn-danger btn-sm" onclick="return confirm('Delete this customer?');">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
