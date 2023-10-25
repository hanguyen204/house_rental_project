package com.example.rental_house_project.Model;

public class House {
    private int houseId;
    private String houseName;
    private double price;
    private String address;
    private double revenue;
    private int numbBath;
    private int numberBed;
    private String describeHouse;
    private String status;

    public House() {
    }

    public House(String houseName, double price, String address, double revenue, int numbBath, int numberBed, String describeHouse, String status) {
        this.houseName = houseName;
        this.price = price;
        this.address = address;
        this.revenue = revenue;
        this.numbBath = numbBath;
        this.numberBed = numberBed;
        this.describeHouse = describeHouse;
        this.status = status;
    }

    public House(int houseId, String houseName, double price, String address, double revenue, int numbBath, int numberBed, String describeHouse, String status) {
        this.houseId = houseId;
        this.houseName = houseName;
        this.price = price;
        this.address = address;
        this.revenue = revenue;
        this.numbBath = numbBath;
        this.numberBed = numberBed;
        this.describeHouse = describeHouse;
        this.status = status;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public int getNumbBath() {
        return numbBath;
    }

    public void setNumbBath(int numbBath) {
        this.numbBath = numbBath;
    }

    public int getNumberBed() {
        return numberBed;
    }

    public void setNumberBed(int numberBed) {
        this.numberBed = numberBed;
    }

    public String getDescribeHouse() {
        return describeHouse;
    }

    public void setDescribeHouse(String describeHouse) {
        this.describeHouse = describeHouse;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

