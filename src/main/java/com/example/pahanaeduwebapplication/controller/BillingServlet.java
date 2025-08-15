package com.example.pahanaeduwebapplication.controller;

import com.example.pahanaeduwebapplication.dao.BillDAO;
import com.example.pahanaeduwebapplication.dao.ItemDAO;
import com.example.pahanaeduwebapplication.model.Bill;
import com.example.pahanaeduwebapplication.model.BillItem;
import com.example.pahanaeduwebapplication.model.Item;
import com.example.pahanaeduwebapplication.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BillingServlet extends HttpServlet {
    private final ItemDAO itemDAO = new ItemDAO();
    private final BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Item> items = itemDAO.getAllItems();
        request.setAttribute("items", items);
        request.getRequestDispatcher("billing.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedIn = (User) session.getAttribute("user");

        String[] itemIds = request.getParameterValues("itemId");
        String[] quantities = request.getParameterValues("quantity");
        String[] prices = request.getParameterValues("price");

        List<BillItem> billItems = new ArrayList<>();
        double total = 0;

        for (int i = 0; i < itemIds.length; i++) {
            BillItem billItem = new BillItem();
            billItem.setItemId(Integer.parseInt(itemIds[i]));
            billItem.setQuantity(Integer.parseInt(quantities[i]));
            billItem.setPrice(Double.parseDouble(prices[i]));
            total += billItem.getQuantity() * billItem.getPrice();
            billItems.add(billItem);
        }

        double amountGiven = Double.parseDouble(request.getParameter("amountGiven"));
        double balance = Double.parseDouble(request.getParameter("balance"));



        Bill bill = new Bill();
        bill.setCreatedBy(loggedIn.getUsername());
        bill.setTotal(total);
        bill.setAmountGiven(amountGiven); // new field
        bill.setBalance(balance);
        bill.setItems(billItems);

        BillDAO billDAO = new BillDAO();
        int billId = billDAO.saveBillAndReturnId(bill);

        response.sendRedirect("receipt?billId=" + billId);
    }
}
