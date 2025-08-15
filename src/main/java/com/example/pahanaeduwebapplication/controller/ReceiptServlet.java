package com.example.pahanaeduwebapplication.controller;

import com.example.pahanaeduwebapplication.dao.BillDAO;
import com.example.pahanaeduwebapplication.model.Bill;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ReceiptServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int billId = Integer.parseInt(request.getParameter("billId"));
        Bill bill = billDAO.getBillWithItems(billId);
        request.setAttribute("bill", bill);
        request.getRequestDispatcher("receipt.jsp").forward(request, response);
    }
}
