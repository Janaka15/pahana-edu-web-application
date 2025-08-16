<%@ page import="com.example.pahanaeduwebapplication.model.Bill" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/16/2025
  Time: 11:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<Bill> bills = (List<Bill>) request.getAttribute("bills");
%>
<html>
<head>
  <title>My Sales History</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
  <h3>📊 My Sales History</h3>

  <table class="table table-striped table-bordered">
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
    <%
      if (bills != null && !bills.isEmpty()) {
        for (Bill bill : bills) {
    %>
    <tr>
      <td><%= bill.getId() %></td>
      <td><%= bill.getBillDate() %></td>
      <td><%= bill.getCreatedBy() %></td>
      <td><%= bill.getTotal() %></td>
      <td><%= bill.getAmountGiven() %></td>
      <td><%= bill.getBalance() %></td>
      <td>
        <a href="receipt?id=<%= bill.getId() %>&reprint=true" class="btn btn-sm btn-info">🖨 Reprint</a>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="5" class="text-center">No sales found</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>

  <a href="cashier_dashboard.jsp" class="btn btn-secondary">⬅ Back to Dashboard</a>
</div>
</body>
</html>
