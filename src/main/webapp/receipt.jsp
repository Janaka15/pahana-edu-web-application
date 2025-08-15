<%@ page import="com.example.pahanaeduwebapplication.model.Bill" %>
<%@ page import="com.example.pahanaeduwebapplication.model.BillItem" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/16/2025
  Time: 2:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
%>
<html>
<head>
    <title>Receipt</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
    <div class="card p-4">
        <h3 class="text-center">Pahana Edu Bookshop</h3>
        <p><strong>Bill No:</strong> <%= bill.getId() %></p>
        <p><strong>Date:</strong> <%= bill.getBillDate() %></p>
        <p><strong>Cashier:</strong> <%= bill.getCreatedBy() %></p>

        <table class="table table-bordered mt-3">
            <thead class="table-dark">
            <tr>
                <th>Item</th>
                <th>Price (LKR)</th>
                <th>Qty</th>
                <th>Total (LKR)</th>
            </tr>
            </thead>
            <tbody>
            <% for (BillItem item : bill.getItems()) { %>
            <tr>
                <td><%= item.getItemName() %></td>
                <td><%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= item.getLineTotal() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <h4 class="text-end">Grand Total: LKR <%= bill.getTotal() %></h4>
        <h4 class="text-end">Amount Given: LKR <%= bill.getAmountGiven() %></h4>
        <h4 class="text-end">Balance: LKR <%= bill.getBalance() %></h4>
        <div class="text-center mt-3">
            <button onclick="window.print()" class="btn btn-primary">Print Receipt</button>
            <a href="billing" class="btn btn-secondary">New Bill</a>
        </div>
    </div>
</div>
</body>
</html>
