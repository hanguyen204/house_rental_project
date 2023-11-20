package com.example.rental_house_project.Model;

import java.util.Date;

public class RentalBill {
    private int rentalId;
    private Date rentalDate;
    private Date payDate;
    private String houseName;
    private String fullName;
    private long rentalPeriod;
    private double price;
    private int totalHouse;
    private String status;
    private double result;
    private String address;


    public RentalBill() {
    }

    public RentalBill(int rentalId, Date rentalDate, String houseName, double price, String status, String address) {
        this.rentalId = rentalId;
        this.rentalDate = rentalDate;
        this.houseName = houseName;
        this.price = price;
        this.status = status;
        this.address = address;
    }

    public RentalBill(int rentalId, Date rentalDate, Date payDate, long rentalPeriod, String houseName, String fullName, double price, double result, int totalHouse, String status) {
        this.rentalId = rentalId;
        this.rentalDate = rentalDate;
        this.payDate = payDate;
        this.rentalPeriod = rentalPeriod;
        this.houseName = houseName;
        this.fullName = fullName;
        this.price = price;
        this.result = result;
        this.totalHouse = totalHouse;
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;

    public RentalBill(int rentalId, Date rentalDate, Date payDate, long rentalPeriod, String houseName, String fullName, double price, double result, String status) {
        this.rentalId = rentalId;
        this.rentalDate = rentalDate;
        this.payDate = payDate;
        this.rentalPeriod = rentalPeriod;
        this.houseName = houseName;
        this.fullName = fullName;
        this.price = price;
        this.result = result;
        this.status = status;

    }

    public int getTotalHouse() {
        return totalHouse;
    }

    public void setTotalHouse(int totalHouse) {
        this.totalHouse = totalHouse;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRentalId() {
        return rentalId;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setRentalId(int rentalId) {
        this.rentalId = rentalId;
    }

    public Date getRentalDate() {
        return rentalDate;
    }

    public void setRentalDate(Date rentalDate) {
        this.rentalDate = rentalDate;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public long getRentalPeriod() {
        return rentalPeriod;
    }

    public void setRentalPeriod(long rentalPeriod) {
        this.rentalPeriod = rentalPeriod;
    }

    public RentalBill(int rentalId, long rentalPeriod, String houseName, String fullName, String status, double price) {
        this.rentalId = rentalId;
        this.rentalPeriod = rentalPeriod;
        this.price = price;
    }


    public RentalBill(int rentalId, Date rentalDate, Date payDate, String houseName, String fullName, long rentalPeriod, double price) {
        this.rentalId = rentalId;
        this.rentalDate = rentalDate;
        this.payDate = payDate;
        this.houseName = houseName;
        this.fullName = fullName;
        this.rentalPeriod = rentalPeriod;
        this.price = price;

    }

    public RentalBill(int rentalId, Date rentalDate, Date payDate, String houseName, String fullName, long rentalPeriod, double price, String status) {
        this.rentalId = rentalId;
        this.rentalDate = rentalDate;
        this.payDate = payDate;
        this.houseName = houseName;
        this.fullName = fullName;
        this.rentalPeriod = rentalPeriod;
        this.price = price;
        this.status = status;
    }
}
