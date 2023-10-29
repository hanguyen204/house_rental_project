package com.example.rental_house_project.Service;


import com.example.rental_house_project.Model.User;

public interface IUserService {
    public void insertUser(User user) throws ClassNotFoundException;


    public boolean checkEmail(String username);

    public boolean isValidUser(String username,String password);


}
