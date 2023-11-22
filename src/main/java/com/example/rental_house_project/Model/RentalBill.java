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

    public RentalBill(int rentalId, Date rentalDate, String houseName, String price, String status, String address) {
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


    public RentalBill(int rentalId, String houseName, String status) {
        this.rentalId = rentalId;
        this.houseName = houseName;
        this.status = status;
    }

    public RentalBill(int rentalId, Date rentalDate, Date payDate, String houseName, String fullName, String price, String status) {
        this.rentalId = rentalId;
        this.rentalDate = rentalDate;
        this.payDate = payDate;
        this.houseName = houseName;
        this.fullName = fullName;
        this.price = price;
        this.status = status;
    }

    public RentalBill(int rentalId, Date rentalDate, Date payDate, long rentalPeriod, String houseName, String fullName, String price, double result, String status) {
        this.rentalId = rentalId;
        this.rentalDate = rentalDate;
        this.payDate = payDate;
        this.houseName = houseName;
        this.fullName = fullName;
        this.price = price;
        this.result = result;
        this.status = status;
    }


    public int getTotalHouse() {
        return totalHouse;
    }


    public String getAddress() {
        return address;
    }


    public int getRentalId() {
        return rentalId;
    }

    public void setRentalId(int rentalId) {
        this.rentalId = rentalId;
    }

    public Date getRentalDate() {
        return rentalDate;

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;

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

    public long getRentalPeriod() {
        return rentalPeriod;
    }


    public void setRentalPeriod(long rentalPeriod) {
        this.rentalPeriod = rentalPeriod;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getTotalHouse() {
        return totalHouse;

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

    public void setTotalHouse(int totalHouse) {
        this.totalHouse = totalHouse;
    }

    public String getStatus() {
        return status;
    }


    public void setStatus(String status) {
        this.status = status;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;

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