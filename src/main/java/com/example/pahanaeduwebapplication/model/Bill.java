package com.example.pahanaeduwebapplication.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Bill {
    private int id;
    private Date billDate;
    private double total;
    private String createdBy;
    private List<BillItem> items;
    private double amountGiven;
    private double balance;

    public Bill() {
        items = new ArrayList<>();
    }

    public Bill(int id, Date billDate, double total, String createdBy) {
        this.id = id;
        this.billDate = billDate;
        this.total = total;
        this.createdBy = createdBy;
        this.items = new ArrayList<>();
    }

    // ID
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    // Bill Date
    public Date getBillDate() {
        return billDate;
    }
    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    // Total
    public double getTotal() {
        return total;
    }
    public void setTotal(double total) {
        this.total = total;
    }

    // Created By
    public String getCreatedBy() {
        return createdBy;
    }
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    // Bill Items
    public List<BillItem> getItems() {
        return items;
    }
    public void setItems(List<BillItem> items) {
        this.items = items;
    }

    // Add single item to bill
    public void addItem(BillItem item) {
        if (items == null) {
            items = new ArrayList<>();
        }
        items.add(item);
        recalculateTotal();
    }
    public double getAmountGiven() {
        return amountGiven;
    }
    public void setAmountGiven(double amountGiven) {
        this.amountGiven = amountGiven;
    }

    public double getBalance() {
        return balance;
    }
    public void setBalance(double balance) {
        this.balance = balance;
    }

    // Calculate total again based on items
    public void recalculateTotal() {
        double sum = 0;
        if (items != null) {
            for (BillItem item : items) {
                sum += item.getLineTotal();
            }
        }
        this.total = sum;
    }
}
