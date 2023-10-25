package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.User;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/list-user")
public class LandlordListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentPage = 1;
        int recordPerPage = 5;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        List<User> userList = new ArrayList<>();
        int totalRecords = 0;
        int totalPages = 0;

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/homerental", "root", "anhnam2005")) {
            String countQuery = "SELECT COUNT(*) AS total FROM user WHERE userType='User'";
            try (Statement countStmt = connection.createStatement()) {
                ResultSet countResult = countStmt.executeQuery(countQuery);
                if (countResult.next()) {
                    totalRecords = countResult.getInt("total");
                }
            }
            totalPages = (int) Math.ceil((double) totalRecords / recordPerPage);
            int start = (currentPage - 1) * recordPerPage;
            String selectQuery = "SELECT * FROM user WHERE userType='User' LIMIT ?, ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
                preparedStatement.setInt(1, start);
                preparedStatement.setInt(2, recordPerPage);

                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String avatar = resultSet.getString("urlImage");
                    String fullName = resultSet.getString("fullName");
                    String phone = resultSet.getString("phone");
                    int revenue = resultSet.getInt("revenue");
                    int numberHouseForRent = resultSet.getInt("numberHouseForRent");
                    String status = resultSet.getString("status");

                    User user = new User(id, avatar, fullName, phone, revenue, numberHouseForRent, status);
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("userList", userList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.getRequestDispatcher("listLandlord.jsp").forward(request, response);
    }
}