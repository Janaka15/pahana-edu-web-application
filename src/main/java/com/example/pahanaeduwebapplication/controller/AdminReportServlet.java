package com.example.pahanaeduwebapplication.controller;

import com.example.pahanaeduwebapplication.dao.BillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

public class AdminReportServlet extends HttpServlet {
    private BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double totalSales = billDAO.getTotalSales();
        Map<String, Double> salesByCashier = billDAO.getSalesByCashier();

        request.setAttribute("totalSales", totalSales);
        request.setAttribute("salesByCashier", salesByCashier);

        request.getRequestDispatcher("report.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        double rangeSales = billDAO.getSalesByDateRange(startDate, endDate);

        request.setAttribute("rangeSales", rangeSales);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);

        doGet(request, response);
    }
}
