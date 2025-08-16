package com.example.pahanaeduwebapplication.controller;

import com.example.pahanaeduwebapplication.dao.ItemDAO;
import com.example.pahanaeduwebapplication.model.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ItemServlet extends HttpServlet {
    private final ItemDAO itemDAO = new ItemDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "add":
                request.getRequestDispatcher("item_form.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Item existingItem = itemDAO.getItemById(id);
                request.setAttribute("item", existingItem);
                request.getRequestDispatcher("item_form.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                itemDAO.deleteItem(deleteId);
                response.sendRedirect("items");
                break;
            default:
                List<Item> items = itemDAO.getAllItems();
                request.setAttribute("items", items);
                request.getRequestDispatcher("items.jsp").forward(request, response);

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        if (idStr == null || idStr.isEmpty()) {
            Item newItem = new Item(name, category, price, quantity);
            itemDAO.addItem(newItem);
        } else {
            int id = Integer.parseInt(idStr);
            Item updatedItem = new Item(name, category, price, quantity);
            updatedItem.setId(id);
            itemDAO.updateItem(updatedItem);
        }

        response.sendRedirect("items");
    }
}