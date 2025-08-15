package com.example.pahanaeduwebapplication.dao;

import com.example.pahanaeduwebapplication.model.Bill;
import com.example.pahanaeduwebapplication.model.BillItem;
import com.example.pahanaeduwebapplication.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {
    public int saveBillAndReturnId(Bill bill) {
        String billSQL = "INSERT INTO bills (total, amount_given, balance, created_by) VALUES (?, ?, ?, ?)";
        String billItemSQL = "INSERT INTO bill_items (bill_id, item_id, quantity, price) VALUES (?, ?, ?, ?)";
        String updateStockSQL = "UPDATE items SET quantity = quantity - ? WHERE id = ?";

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            PreparedStatement billStmt = conn.prepareStatement(billSQL, Statement.RETURN_GENERATED_KEYS);
            billStmt.setDouble(1, bill.getTotal());
            billStmt.setDouble(2, bill.getAmountGiven());
            billStmt.setDouble(3, bill.getBalance());
            billStmt.setString(4, bill.getCreatedBy());
            billStmt.executeUpdate();

            ResultSet rs = billStmt.getGeneratedKeys();
            int billId = 0;
            if (rs.next()) billId = rs.getInt(1);

            for (BillItem item : bill.getItems()) {
                PreparedStatement itemStmt = conn.prepareStatement(billItemSQL);
                itemStmt.setInt(1, billId);
                itemStmt.setInt(2, item.getItemId());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.setDouble(4, item.getPrice());
                itemStmt.executeUpdate();

                PreparedStatement stockStmt = conn.prepareStatement(updateStockSQL);
                stockStmt.setInt(1, item.getQuantity());
                stockStmt.setInt(2, item.getItemId());
                stockStmt.executeUpdate();
            }

            conn.commit();
            return billId;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public Bill getBillWithItems(int billId) {
        Bill bill = null;
        String billSQL = "SELECT * FROM bills WHERE id = ?";
        String itemsSQL = "SELECT bi.*, i.name AS itemName FROM bill_items bi " +
                "JOIN items i ON bi.item_id = i.id WHERE bi.bill_id = ?";

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement billStmt = conn.prepareStatement(billSQL);
            billStmt.setInt(1, billId);
            ResultSet billRs = billStmt.executeQuery();
            if (billRs.next()) {
                bill = new Bill();
                bill.setId(billRs.getInt("id"));
                bill.setBillDate(billRs.getTimestamp("bill_date"));
                bill.setTotal(billRs.getDouble("total"));
                bill.setAmountGiven(billRs.getDouble("amount_given"));
                bill.setBalance(billRs.getDouble("balance"));
                bill.setCreatedBy(billRs.getString("created_by"));
            }

            if (bill != null) {
                PreparedStatement itemsStmt = conn.prepareStatement(itemsSQL);
                itemsStmt.setInt(1, billId);
                ResultSet itemsRs = itemsStmt.executeQuery();
                List<BillItem> billItems = new ArrayList<>();
                while (itemsRs.next()) {
                    BillItem bi = new BillItem();
                    bi.setId(itemsRs.getInt("id"));
                    bi.setItemId(itemsRs.getInt("item_id"));
                    bi.setItemName(itemsRs.getString("itemName"));
                    bi.setQuantity(itemsRs.getInt("quantity"));
                    bi.setPrice(itemsRs.getDouble("price"));
                    billItems.add(bi);
                }
                bill.setItems(billItems);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bill;
    }
}
