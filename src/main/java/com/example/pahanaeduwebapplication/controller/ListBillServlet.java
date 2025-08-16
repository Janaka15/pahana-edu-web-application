package com.example.pahanaeduwebapplication.controller;

import com.example.pahanaeduwebapplication.dao.BillDAO;
import com.example.pahanaeduwebapplication.model.Bill;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ListBillServlet extends HttpServlet {
    private BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                billDAO.deleteBill(deleteId);
                response.sendRedirect("bills");
                break;
            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                Bill bill = billDAO.getBillWithItems(editId);
                request.setAttribute("bill", bill);
                request.getRequestDispatcher("edit_bill.jsp").forward(request, response);
                break;
            default:
                List<Bill> bills = billDAO.getAllBills();
                request.setAttribute("bills", bills);
                request.getRequestDispatcher("bills.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle bill update
        int id = Integer.parseInt(request.getParameter("id"));
        double total = Double.parseDouble(request.getParameter("total"));
        double amountGiven = Double.parseDouble(request.getParameter("amountGiven"));
        double balance = Double.parseDouble(request.getParameter("balance"));
        String createdBy = request.getParameter("createdBy");

        Bill bill = new Bill();
        bill.setId(id);
        bill.setTotal(total);
        bill.setAmountGiven(amountGiven);
        bill.setBalance(balance);
        bill.setCreatedBy(createdBy);

        billDAO.updateBill(bill);
        response.sendRedirect("bills");
    }
}
