package com.example.rental_house_project.Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/approve")
public class ApproveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String userId = req.getParameter("id");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/HouseRentalProject", "root", "anhnam2005")) {
            String updateQuery = "UPDATE Users SET status = 'Đang hoạt động' WHERE user_id = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {
                updateStmt.setString(1, userId);
                updateStmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        resp.sendRedirect(req.getContextPath() + "/landlordlist");
    }
}