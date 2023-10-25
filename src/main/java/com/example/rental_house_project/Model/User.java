package com.example.rental_house_project.Model;

public class User {
    private int id;
    private String username;
    private String urlImage;
    private String fullName;
    private String address;
    private String phone;
    private String password;
    private String userType;
    private String status;

    public User() {
    }

    public User(String username, String phone, String password) {
        this.username = username;
        this.phone = phone;
        this.password = password;
    }

    public User(String username, String phone, String password, String userType) {
        this.username = username;
        this.phone = phone;
        this.password = password;
        this.userType = userType;
    }

    public User(String urlImage, String fullName, String address, String phone, String password) {
        this.urlImage = urlImage;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.password = password;
    }

    public User(int id, String username, String urlImage, String fullName, String address, String phone, String password, String role, String status) {
        this.id = id;
        this.username = username;
        this.urlImage = urlImage;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.password = password;
        this.userType = role;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

