<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 8/16/2025
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) session.getAttribute("role");
    String dashboardPage = "cashier_dashboard.jsp";
    if ("admin".equalsIgnoreCase(role)) {
        dashboardPage = "admin_dashboard.jsp";
    }
%>
<html>
<head>
    <title>Help - Pahana Edu Billing System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-4">
    <h3>📖 Help & User Guide</h3>
    <p class="text-muted">Here you can find guidance on how to use the system.</p>

    <div class="accordion" id="helpAccordion">
        <!-- Section 1 -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                    🔐 Login & Signup
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#helpAccordion">
                <div class="accordion-body">
                    <ul>
                        <li>Admins have a pre-created account.</li>
                        <li>Cashiers can sign up with a unique username.</li>
                        <li>Passwords must match when creating accounts.</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Section 2 -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                    🧾 Managing Customers
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                <div class="accordion-body">
                    <ul>
                        <li>Cashiers can add, update, and delete customer details.</li>
                        <li>Customers require account number, name, address, phone, and email.</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Section 3 -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                    📦 Managing Stock
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                <div class="accordion-body">
                    <ul>
                        <li>Admins can add, update, and delete items.</li>
                        <li>Stock details include item name, price, and quantity.</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Section 4 -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingFour">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour">
                    💳 Billing
                </button>
            </h2>
            <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                <div class="accordion-body">
                    <ul>
                        <li>Both Admins and Cashiers can create bills.</li>
                        <li>Items are selected from stock, with auto price fill.</li>
                        <li>You can remove wrong items before finalizing a bill.</li>
                        <li>Receipts include total, amount given, and balance.</li>
                        <li>Reprinting of previous bills is available from Bills section.</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Section 5 -->
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingFive">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive">
                    📊 Reports
                </button>
            </h2>
            <div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#helpAccordion">
                <div class="accordion-body">
                    <ul>
                        <li>Admins can view daily/weekly/monthly reports.</li>
                        <li>Reports include sales totals and item-level details.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <a href="<%= dashboardPage %>" class="btn btn-secondary">⬅ Back to Dashboard</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
