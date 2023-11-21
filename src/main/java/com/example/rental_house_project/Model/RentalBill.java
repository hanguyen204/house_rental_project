package com.example.rental_house_project.Model;

public class RentalBill {
    private int rentalId;
    private String houseName;
    private String fullName;
    private long rentalPeriod;
    private String price;
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

    public RentalBill(String rentalDate, String payDate) {
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

    public RentalBill(int rentalId, String houseName, String status) {
        this.rentalId = rentalId;
        this.houseName = houseName;
        this.status = status;
    }

    public RentalBill(int rentalId, Date rentalDate, Date payDate, String houseName, String fullName, double price, String status) {
        this.rentalId = rentalId;
        this.rentalDate = rentalDate;
        this.payDate = payDate;
        this.houseName = houseName;
        this.fullName = fullName;
        this.price = price;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
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

    public String getRentalDate() {
        return rentalDate;
    }

    public void setRentalDate(String rentalDate) {
        this.rentalDate = rentalDate;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public long getRentalPeriod() {
        return rentalPeriod;
    }

    public void setRentalPeriod(long rentalPeriod) {
        this.rentalPeriod = rentalPeriod;
    }

    public RentalBill(int rentalId, long rentalPeriod, String houseName, String fullName, String status, String price) {
        this.rentalId = rentalId;
        this.rentalPeriod = rentalPeriod;
        this.price = price;
    }


    public RentalBill(int rentalId, String rentalDate, String payDate, String houseName, String fullName, long rentalPeriod, String price) {
        this.rentalId = rentalId;
        this.rentalDate = rentalDate;
        this.payDate = payDate;
        this.houseName = houseName;
        this.fullName = fullName;
        this.rentalPeriod = rentalPeriod;
        this.price = price;

    }

    public RentalBill(int rentalId, String rentalDate, String payDate, String houseName, String fullName, long rentalPeriod, String price, String status) {
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
