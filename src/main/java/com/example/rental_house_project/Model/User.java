package com.example.rental_house_project.Model;

public class User {
    private int id;
    private String username;
    private String password;
    private String urlImage;
    private String fullName;
    private int revenue;
    private int numberHouseForRent;
    private String address;
    private String phone;
    private String userType;
    private String status;

    public User() {
    }

    public User(String username) {
        this.username = username;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String phone, String password) {
        this.username = username;
        this.phone = phone;
        this.password = password;
    }

    public User(String urlImage, String fullName, String address, String phone, String password) {
        this.urlImage = urlImage;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.password = password;
    }

    public User(int id, String username, String urlImage, String fullName, String address, String phone, String password, int revenue, int numberHouseForRent, String status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.urlImage = urlImage;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.revenue = revenue;
        this.numberHouseForRent = numberHouseForRent;
        this.status = status;
    }

    public User(int id, String urlImage, String fullName, String phone, int revenue, int numberHouseForRent, String status) {
        this.id = id;
        this.fullName = fullName;
        this.urlImage = urlImage;
        this.phone = phone;
        this.revenue = revenue;
        this.numberHouseForRent = numberHouseForRent;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public int getRevenue() {
        return revenue;
    }

    public void setRevenue(int revenue) {
        this.revenue = revenue;
    }

    public int getNumberHouseForRent() {
        return numberHouseForRent;
    }

    public void setNumberHouseForRent(int numberHouseForRent) {
        this.numberHouseForRent = numberHouseForRent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

