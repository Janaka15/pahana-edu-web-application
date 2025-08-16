package com.example.pahanaeduwebapplication.controller;

import com.example.pahanaeduwebapplication.dao.BillDAO;
import com.example.pahanaeduwebapplication.model.Bill;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class SalesHistoryServlet extends HttpServlet {
    private final BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String cashierUsername = (String) session.getAttribute("username"); //
        if (cashierUsername == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Bill> bills = billDAO.getBillsByCashier(cashierUsername);
        request.setAttribute("bills", bills);

        request.getRequestDispatcher("sales_history.jsp").forward(request, response);
    }
}
