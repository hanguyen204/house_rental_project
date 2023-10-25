package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.User;
import com.example.rental_house_project.Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterHouseOwner" , value = "/register")
public class RegisterHouseOwner extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm-password");
        String userType = req.getParameter("userType");
        User newUser = new User(username, phone, password,userType);
        UserService userService = new UserService();

        boolean isNumeric = true;
        for (int i = 0; i < phone.length(); i++) {
            char c = phone.charAt(i);
            if (!Character.isDigit(c)) {
                isNumeric = false;
                break;
            }
        }

        boolean isValidUsername = username.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}") || username.matches("[a-zA-Z0-9_]+");

        if (!isValidUsername){
            req.setAttribute("message", "Invalid login name");
            req.getRequestDispatcher("Authentication/registerHost.jsp").forward(req, resp);
            return;
        }

        if (!isNumeric){
            req.setAttribute("message", "Invalid phone number");
            req.getRequestDispatcher("Authentication/registerHost.jsp").forward(req, resp);
            return;
        }

        if (phone.length() < 9 || phone.length() > 15){
            req.setAttribute("message", "Phone number must be between 9 and 15 digits");
            req.getRequestDispatcher("Authentication/registerHost.jsp").forward(req, resp);
            return;
        }

        if (password.length() < 6 || password.length() > 32) {
            req.setAttribute("message", "Password from 6 - 32 characters");
            req.getRequestDispatcher("Authentication/registerHost.jsp").forward(req, resp);
            return;
        }

        if (userService.checkEmail(username)) {
            req.setAttribute("message", "Account is duplicated");
            req.getRequestDispatcher("Authentication/registerHost.jsp").forward(req, resp);
        } else if (!confirmPassword.equals(password)) {
            req.setAttribute("message", "Passwords do not match");
            req.getRequestDispatcher("Authentication/registerHost.jsp").forward(req, resp);
        } else {
            try {
                userService.insertUser(newUser);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            req.getRequestDispatcher("");
        }
    }
}
