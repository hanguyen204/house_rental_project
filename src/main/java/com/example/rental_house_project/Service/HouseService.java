package com.example.rental_house_project.Service;

import com.example.rental_house_project.Model.House;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HouseService {
    private String url = "jdbc:mysql://localhost:3306/homerental";
    private String user = "root";
    private String password = "anhnam2005";

    private static final String SELECT_ALL_HOUSE = "SELECT * FROM House;";

    public Connection connection() throws ClassNotFoundException {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return con;
    }

    public List<House> showAllHouseRental() throws ClassNotFoundException, SQLException {
        List<House> list = new ArrayList<>();
        PreparedStatement preparedStatement = connection().prepareStatement(SELECT_ALL_HOUSE);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            int houseId = rs.getInt("houseId");
            int userId = rs.getInt("userId");
            String imgHouse = rs.getString("imgHouse");
            String houseName = rs.getString("housename");
            String price = rs.getString("price");
            String timeRental = rs.getString("timeRental");
            String address = rs.getString("address");
            int revenue = rs.getInt("revenue");
            int numberBath = rs.getInt("numberBath");
            int numberBed = rs.getInt("numberBed");
            int width = rs.getInt("width");
            String describeHouse = rs.getString("describeHouse");
            String status = rs.getString("status");
            list.add(new House(houseId, userId, imgHouse, houseName, price, timeRental, address, revenue, numberBath, numberBed, width, describeHouse, status));
        }

        for (House house : list) {
            house.setPrice(String.format(house.getFormattedPrice()));
        }
        return list;
    }
}
