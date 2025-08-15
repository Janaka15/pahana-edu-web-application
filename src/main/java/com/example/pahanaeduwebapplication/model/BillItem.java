package com.example.pahanaeduwebapplication.model;

public class BillItem {
    private int id;         // bill_items table ID
    private int billId;     // FK to bills table
    private int itemId;     // FK to items table
    private String itemName; // For display purposes
    private int quantity;   // Quantity sold
    private double price;   // Unit price at sale time

    public BillItem() {}

    public BillItem(int billId, int itemId, String itemName, int quantity, double price) {
        this.billId = billId;
        this.itemId = itemId;
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
    }

    // ID
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    // Bill ID
    public int getBillId() {
        return billId;
    }
    public void setBillId(int billId) {
        this.billId = billId;
    }

    // Item ID
    public int getItemId() {
        return itemId;
    }
    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    // Item Name
    public String getItemName() {
        return itemName;
    }
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    // Quantity
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Price
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    // Calculate line total
    public double getLineTotal() {
        return this.quantity * this.price;
    }
}
