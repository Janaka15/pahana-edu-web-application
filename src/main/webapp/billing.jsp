<%@ page import="com.example.pahanaeduwebapplication.model.Item" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/15/2025
  Time: 7:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Item> items = (List<Item>) request.getAttribute("items");
%>
<html>
<head>
    <title>Billing</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script>
        // Auto-fill price when item changes
        function updatePrice(selectElement) {
            let price = selectElement.options[selectElement.selectedIndex].getAttribute("data-price");
            let row = selectElement.closest("tr");
            let priceInput = row.querySelector("input[name='price']");
            priceInput.value = price;
            updateLineTotal(row);
            updateGrandTotal();
        }

        function calculateBalance() {
            let given = parseFloat(document.getElementById("amountGiven").value) || 0;
            let total = parseFloat(document.getElementById("grandTotal").innerText) || 0;
            document.getElementById("balance").value = (given - total).toFixed(2);
        }

        // Update line total for that row
        function updateLineTotal(row) {
            let qty = parseFloat(row.querySelector("input[name='quantity']").value) || 0;
            let price = parseFloat(row.querySelector("input[name='price']").value) || 0;
            let total = qty * price;
            row.querySelector(".lineTotal").innerText = total.toFixed(2);
        }

        // Update grand total for the bill
        function updateGrandTotal() {
            let grandTotal = 0;
            document.querySelectorAll(".lineTotal").forEach(function(td) {
                grandTotal += parseFloat(td.innerText) || 0;
            });
            document.getElementById("grandTotal").innerText = grandTotal.toFixed(2);
        }

        // Add new row for items
        function addRow() {
            let table = document.getElementById("billTable").getElementsByTagName('tbody')[0];
            let newRow = document.createElement("tr");
            newRow.innerHTML = `
                <td>
                    <select name="itemId" class="form-select" onchange="updatePrice(this)">
                        <% for (Item item : items) { %>
                            <option value="<%= item.getId() %>" data-price="<%= item.getPrice() %>">
                                <%= item.getName() %>
                            </option>
                        <% } %>
                    </select>
                </td>
                <td><input type="number" step="0.01" name="price" class="form-control" readonly required></td>
                <td><input type="number" name="quantity" class="form-control" min="1" value="1" onchange="updateLineTotal(this.closest('tr')); updateGrandTotal();" required></td>
                <td class="lineTotal">0.00</td>
            `;
            table.appendChild(newRow);
        }

    </script>
</head>
<body class="bg-light">
<div class="container mt-4">
    <h3>Billing</h3>
    <form method="post" action="billing">
        <table class="table table-bordered" id="billTable">
            <thead class="table-dark">
            <tr>
                <th>Item</th>
                <th>Price (LKR)</th>
                <th>Quantity</th>
                <th>Total (LKR)</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <select name="itemId" class="form-select" onchange="updatePrice(this)">
                        <% for (Item item : items) { %>
                        <option value="<%= item.getId() %>" data-price="<%= item.getPrice() %>">
                            <%= item.getName() %>
                        </option>
                        <% } %>
                    </select>
                </td>
                <td><input type="number" step="0.01" name="price" class="form-control" readonly required></td>
                <td><input type="number" name="quantity" class="form-control" min="1" value="1" onchange="updateLineTotal(this.closest('tr')); updateGrandTotal();" required></td>
                <td class="lineTotal">0.00</td>
            </tr>
            </tbody>
        </table>
        <div class="mb-3">
            <button type="button" class="btn btn-secondary" onclick="addRow()">Add Item</button>
        </div>

        <h5>Grand Total: <span id="grandTotal">0.00</span> LKR</h5>
        <div class="mt-3">
            <label class="form-label">Amount Given (LKR)</label>
            <input type="number" step="0.01" name="amountGiven" id="amountGiven" class="form-control" required
                   oninput="calculateBalance()">
        </div>

        <div class="mt-3">
            <label class="form-label">Balance (LKR)</label>
            <input type="number" step="0.01" name="balance" id="balance" class="form-control" readonly>
        </div>
        <button type="submit" class="btn btn-primary mt-2">Finalize Bill</button>

    </form>
</div>

<script>
    // Initialize first row price and totals when page loads
    document.addEventListener("DOMContentLoaded", function() {
        document.querySelectorAll("select[name='itemId']").forEach(function(sel) {
            updatePrice(sel);
        });
    });
</script>

</body>
</html>