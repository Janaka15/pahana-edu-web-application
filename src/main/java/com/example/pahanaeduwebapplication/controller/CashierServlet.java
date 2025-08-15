package com.example.pahanaeduwebapplication.controller;

import com.example.pahanaeduwebapplication.dao.UserDAO;
import com.example.pahanaeduwebapplication.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class CashierServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User loggedIn = (User) session.getAttribute("user");
        if (loggedIn == null || !"admin".equals(loggedIn.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                User cashier = userDAO.getUserById(editId);
                request.setAttribute("cashier", cashier);
                request.getRequestDispatcher("cashier_form.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                userDAO.deleteCashier(deleteId);
                response.sendRedirect("cashiers");
                break;
            default:
                List<User> cashiers = userDAO.getAllCashiers();
                request.setAttribute("cashiers", cashiers);
                request.getRequestDispatcher("cashiers.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");

        User u = new User();
        u.setId(id);
        u.setUsername(username);
        u.setPassword(password);
        u.setFullName(fullName);

        userDAO.updateCashier(u);
        response.sendRedirect("cashiers");
    }
}