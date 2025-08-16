<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/16/2025
  Time: 1:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  double totalSales = (request.getAttribute("totalSales") != null) ? (double) request.getAttribute("totalSales") : 0;
  Map<String, Double> salesByCashier = (Map<String, Double>) request.getAttribute("salesByCashier");
  Double rangeSales = (Double) request.getAttribute("rangeSales");
%>
<html>
<head>
  <title>Admin Report</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
  <h3>📊 Sales Report</h3>

  <div class="card p-3 mt-3">
    <h5>Total Sales: LKR <%= totalSales %></h5>
  </div>

  <div class="card p-3 mt-3">
    <h5>Sales by Cashier</h5>
    <table class="table table-bordered">
      <thead class="table-dark">
      <tr><th>Cashier</th><th>Total Sales</th></tr>
      </thead>
      <tbody>
      <% if (salesByCashier != null) {
        for (Map.Entry<String, Double> entry : salesByCashier.entrySet()) { %>
      <tr>
        <td><%= entry.getKey() %></td>
        <td>LKR <%= entry.getValue() %></td>
      </tr>
      <% }} %>
      </tbody>
    </table>
  </div>

  <div class="card p-3 mt-3">
    <h5>Sales by Date Range</h5>
    <form method="post" action="report">
      <div class="row">
        <div class="col">
          <input type="date" name="startDate" class="form-control" required>
        </div>
        <div class="col">
          <input type="date" name="endDate" class="form-control" required>
        </div>
        <div class="col">
          <button type="submit" class="btn btn-primary">Filter</button>
        </div>
      </div>
    </form>
    <% if (rangeSales != null) { %>
    <h6 class="mt-3">Sales from <%= request.getAttribute("startDate") %> to <%= request.getAttribute("endDate") %>:
      LKR <%= rangeSales %></h6>
    <% } %>
  </div>

  <div class="mt-4">
    <a href="admin_dashboard.jsp" class="btn btn-secondary">⬅ Back to Dashboard</a>
  </div>
</div>
</body>
</html>

