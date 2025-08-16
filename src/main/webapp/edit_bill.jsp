<%@ page import="com.example.pahanaeduwebapplication.model.Bill" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/16/2025
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Bill bill = (Bill) request.getAttribute("bill");
%>
<html>
<head>
  <title>Edit Bill</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
  <h3>Edit Bill</h3>
  <form method="post" action="bills">
    <input type="hidden" name="id" value="<%= bill.getId() %>">

    <div class="mb-3">
      <label>Total</label>
      <input type="number" step="0.01" name="total" value="<%= bill.getTotal() %>" class="form-control" required>
    </div>
    <div class="mb-3">
      <label>Amount Given</label>
      <input type="number" step="0.01" name="amountGiven" value="<%= bill.getAmountGiven() %>" class="form-control" required>
    </div>
    <div class="mb-3">
      <label>Balance</label>
      <input type="number" step="0.01" name="balance" value="<%= bill.getBalance() %>" class="form-control" required>
    </div>
    <div class="mb-3">
      <label>Created By (Cashier)</label>
      <input type="text" name="createdBy" value="<%= bill.getCreatedBy() %>" class="form-control" readonly>
    </div>

    <button type="submit" class="btn btn-success">Update</button>
    <a href="bills" class="btn btn-secondary">Cancel</a>
  </form>
</div>
</body>
</html>
