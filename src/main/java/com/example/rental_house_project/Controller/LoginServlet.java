package com.example.rental_house_project.Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ok");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        Pattern p = Pattern.compile("^[a-zA-Z0-9]+$");
        if (p.matcher(username).find()&& p.matcher(password).find()) {
            response.sendRedirect("Login/LoginPage.jsp");

        } else {
            session.setAttribute("loginFailed", true);
            response.sendRedirect("Login/LoginPage.jsp");
        }
    }
}
