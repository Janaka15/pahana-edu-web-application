package com.example.pahanaeduwebapplication.controller;

import com.example.pahanaeduwebapplication.dao.UserDAO;
import com.example.pahanaeduwebapplication.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class SignupServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String fullName = request.getParameter("fullname");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Server-side password match check
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("jsp/signup.jsp").forward(request, response);
            return;
        }

        // Check duplicate username
        if (userDAO.usernameExists(username)) {
            request.setAttribute("error", "Username already exists!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Register as cashier
        User user = new User(username, password, "cashier", fullName);
        if (userDAO.register(user)) {
            response.sendRedirect("login.jsp?success=1");
        } else {
            request.setAttribute("error", "Signup failed. Try again!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}
