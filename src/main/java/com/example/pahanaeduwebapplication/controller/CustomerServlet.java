package com.example.pahanaeduwebapplication.controller;

import com.example.pahanaeduwebapplication.dao.CustomerDAO;
import com.example.pahanaeduwebapplication.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class CustomerServlet extends HttpServlet {
    private final CustomerDAO customerDAO = new CustomerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "add":
                request.getRequestDispatcher("jsp/customer_form.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Customer existingCustomer = customerDAO.getCustomerById(id);
                request.setAttribute("customer", existingCustomer);
                request.getRequestDispatcher("jsp/customer_form.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                customerDAO.deleteCustomer(deleteId);
                response.sendRedirect("customers");
                break;
            default:
                List<Customer> customers = customerDAO.getAllCustomers();
                request.setAttribute("customers", customers);
                request.getRequestDispatcher("jsp/customers.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNoStr = request.getParameter("accountNo");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");

        if (accountNoStr == null || accountNoStr.isEmpty()) {
            Customer newCustomer = new Customer(name, address, telephone, email);
            customerDAO.addCustomer(newCustomer);
        } else {
            int accountNo = Integer.parseInt(accountNoStr);
            Customer updatedCustomer = new Customer(name, address, telephone, email);
            updatedCustomer.setAccountNo(accountNo);
            customerDAO.updateCustomer(updatedCustomer);
        }

        response.sendRedirect("customers");
    }
}
