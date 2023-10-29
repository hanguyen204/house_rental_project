package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Service.IUserService;
import com.example.rental_house_project.Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@WebServlet(value = "/Login")
public class LoginUserServlet extends HttpServlet {
    UserService service = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("userName");
        String password = request.getParameter("passWord");
        if (isValidInput(username) && isValidInput(password)) {
            if (service.isValidUser(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("HomePage/newsFeed.jsp");
            } else {
                request.setAttribute("error", "The specified password does not match.");
                request.getRequestDispatcher("HomePage/wrong_Password.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "user ");
            request.getRequestDispatcher("HomePage/characters.jsp").forward(request, response);
        }
    }

    private boolean checkCredentials(String username, String password) {
        return false;
    }

    private boolean isValidInput(String input) {
        // Sử dụng regex để kiểm tra xem chuỗi không chứa ký tự đặc biệt (*, %, , ')
        String regex = "^[a-zA-Z0-9]*$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();


    }
}

