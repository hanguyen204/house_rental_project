package com.example.rental_house_project.Model;

public class House {
    private int houseId;
    private String houseName;
    private double price;
    private String address;
    private double revenue;
    private int numberBath;
    private int numberBed;
    private String describeHouse;
    private String status;

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public int getNumberHouseForRent() {
        return numberHouseForRent;
    }

    public void setNumberHouseForRent(int numberHouseForRent) {
        this.numberHouseForRent = numberHouseForRent;
    }

    private String urlImage;

    private int numberHouseForRent;

    public House() {
    }
    public House(int houseId, String houseName, String address, int numberBath, int numberBed, String describeHouse, int numberHouseForRent, String urlImage) {
        this.houseId = houseId;
        this.houseName = houseName;
        this.address = address;
        this.numberBath = numberBath;
        this.numberBed = numberBed;
        this.describeHouse = describeHouse;
        this.numberHouseForRent = numberHouseForRent;
        this.urlImage = urlImage;
    }

    public House(String houseName, double price, String address, double revenue, int numberBath, int numberBed, String describeHouse, String status) {
        this.houseName = houseName;
        this.price = price;
        this.address = address;
        this.revenue = revenue;
        this.numberBath = numberBath;
        this.numberBed = numberBed;
        this.describeHouse = describeHouse;
        this.status = status;
    }

    public House(int houseId, String houseName, double price, String address, double revenue, int numberBath, int numberBed, String describeHouse, String status) {
        this.houseId = houseId;
        this.houseName = houseName;
        this.price = price;
        this.address = address;
        this.revenue = revenue;
        this.numberBath = numberBath;
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

    public int getNumberBath() {
        return numberBath;
    }

    public void setNumberBath(int numberBath) {
        this.numberBath = numberBath;
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

