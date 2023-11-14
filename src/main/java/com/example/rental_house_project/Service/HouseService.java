package com.example.rental_house_project.Service;

import com.example.rental_house_project.Model.House;
import com.example.rental_house_project.Model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HouseService {
    private String url = "jdbc:mysql://localhost:3306/homerental";
    private String user = "root";
    private String password = "2004";

    private static final String SELECT_ALL_HOUSE = "SELECT * FROM House;";
    private static final String SELECT_FIVE_HOUSE = "SELECT * FROM House ORDER BY revenue DESC LIMIT 5;";
    private static final String SELECT_All_HOUSE_OF_LANDLORD = "SELECT * FROM House INNER JOIN user ON House.userId = user.id WHERE user.id = ?;";
//    private static final String SELECT_HOUSE = "SELECT user.id, user.username, user.urlImage, user.phone, House.houseId, House.imgHouse, House.housename, House.price, House.timeRental, House.numberBath, House.numberBed, House.width, House.describeHouse, House.status FROM House INNER JOIN user ON House.userId = user.id  WHERE House.houseId = ?;";
    private static final String INSERT_HOUSE_SQL = "INSERT INTO House (userId, imgHouse, housename, price, timeRental, address, numberBath, numberBed, width, describeHouse, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_HOUSES_BY_USER_ID_SQL = "SELECT * FROM House WHERE userId = ?";
    private static final String SELECT_HOUSES_BY_HOUSE_ID_SQL = "SELECT * FROM House WHERE houseId = ?";
    private static final String SELECT_ID_HOUSE_BY_HOUSE_NAME_SQL = "SELECT houseId FROM House WHERE housename = ?";

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

    public List<House> showFiveHouse() {
        List<House> houses = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection().prepareStatement(SELECT_FIVE_HOUSE);
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
                houses.add(new House(houseId, userId, imgHouse, houseName, price, timeRental, address, revenue, numberBath, numberBed, width, describeHouse, status));
            }
            for (House house : houses) {
                house.setPrice(String.format(house.getFormattedPrice()));
            }
            return houses;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<House> getAllHomeOfLandlord(int id) throws ClassNotFoundException, SQLException {
        List<House> homes = new ArrayList<>();
        PreparedStatement preparedStatement = connection().prepareStatement(SELECT_All_HOUSE_OF_LANDLORD);
        preparedStatement.setInt(1, id);
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
            homes.add(new House(houseId, userId, imgHouse, houseName, price, timeRental, address, revenue, numberBath, numberBed, width, describeHouse, status));
        }

        for (House house : homes) {
            house.setPrice(String.format(house.getFormattedPrice()));
        }
        return homes;
    }


    public List<House> showAllHouse() throws ClassNotFoundException, SQLException {
        List<House> list = new ArrayList<>();
        PreparedStatement preparedStatement = connection().prepareStatement(SELECT_ALL_HOUSE);
        System.out.println(preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            int houseId = rs.getInt("houseId");
            String houseName = rs.getString("houseName");
            String address = rs.getString("address");
            int numberBath = rs.getInt("numberBath");
            int numberBed = rs.getInt("numberBed");
            String describeHouse = rs.getString("describeHouse");
            String imgHouse = rs.getString("imgHouse");

            list.add(new House(houseId, houseName, address, numberBath, numberBed, describeHouse, imgHouse));
        }
        return list;
    }

    public List<House> searchByStatusRooms(String statusRoom) throws ClassNotFoundException, SQLException {
        List<House> list = new ArrayList<>();
        String query = "SELECT  houseName,address,numberBath,numberBed,describeHouse,imgHouse from House WHERE status ='Còn Phòng'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            String houseName = rs.getString("houseName");
            String address = rs.getString("address");
            int numberBath = rs.getInt("numberBath");
            int numberBed = rs.getInt("numberBed");
            String describeHouse = rs.getString("describeHouse");
            String imgHouse = rs.getString("imgHouse");

            list.add(new House(imgHouse,houseName, address, numberBath, numberBed, describeHouse));
        }
        return list;
    }


    public List<House> searchByName(String nameProduct) throws ClassNotFoundException, SQLException {
        List<House> list = new ArrayList<>();
        String query = "Select houseName,address,numberBath,numberBed,describeHouse,imgHouse from House where houseName like '%" + nameProduct + "%'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
            String houseName = rs.getString("houseName");
            String address = rs.getString("address");
            int numberBath = rs.getInt("numberBath");
            int numberBed = rs.getInt("numberBed");
            String describeHouse = rs.getString("describeHouse");
            String imgHouse = rs.getString("imgHouse");

            list.add(new House(imgHouse,houseName, address, numberBath, numberBed, describeHouse));
        }
        return list;
    }

    public List<House> searchByStatusRoomOutOfRoom(String statusRoom) throws ClassNotFoundException, SQLException {
        List<House> list = new ArrayList<>();
        String query = "SELECT houseName,address,numberBath,numberBed,describeHouse,imgHouse from House WHERE status ='Hết Phòng'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            String houseName = rs.getString("houseName");
            String address = rs.getString("address");
            int numberBath = rs.getInt("numberBath");
            int numberBed = rs.getInt("numberBed");
            String describeHouse = rs.getString("describeHouse");
            String imgHouse = rs.getString("imgHouse");

            list.add(new House(imgHouse,houseName, address, numberBath, numberBed, describeHouse));
        }
        return list;
    }

    public void insertHouse(House house) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = connection().prepareStatement(INSERT_HOUSE_SQL);
        statement.setInt(1, house.getUserId());
        statement.setString(2,  house.getImgHouse());
        statement.setString(3, house.getHouseName());
        statement.setString(4, house.getPrice());
        statement.setString(5, house.getTimeRental());
        statement.setString(6, house.getAddress());
        statement.setInt(7, house.getNumberBath());
        statement.setInt(8, house.getNumberBed());
        statement.setInt(9, house.getWidth());
        statement.setString(10, house.getDescribeHouse());
        statement.setString(11, house.getStatus());
        statement.executeUpdate();
    }

    public List<House> getHousesByUserId(int userId) throws SQLException, ClassNotFoundException {
        List<House> houses = new ArrayList<>();
        House house = new House();

        PreparedStatement statement = connection().prepareStatement(SELECT_HOUSES_BY_USER_ID_SQL);
        statement.setInt(1, userId);

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            house.setHouseId(resultSet.getInt("houseId"));
            house.setUserId(resultSet.getInt("userId"));
            house.setImgHouse(resultSet.getString("imgHouse"));
            house.setHouseName(resultSet.getString("housename"));
            house.setPrice(resultSet.getString("price"));
            house.setTimeRental(resultSet.getString("timeRental"));
            house.setAddress(resultSet.getString("address"));
            house.setRevenue(resultSet.getInt("revenue"));
            house.setNumberBath(resultSet.getInt("numberBath"));
            house.setNumberBed(resultSet.getInt("numberBed"));
            house.setWidth(resultSet.getInt("width"));
            house.setDescribeHouse(resultSet.getString("describeHouse"));
            house.setStatus(resultSet.getString("status"));
            houses.add(house);
        }
        return houses;
    }

    public int getHouseByHouseName(String housename) throws ClassNotFoundException, SQLException {
        int houseId = 0;

        PreparedStatement statement = connection().prepareStatement(SELECT_ID_HOUSE_BY_HOUSE_NAME_SQL);
        statement.setString(1, housename);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            houseId = resultSet.getInt("houseId");
        }
        return  houseId;
    }

    public House getHouseByHouseId(int id) throws ClassNotFoundException, SQLException {
        PreparedStatement statement = connection().prepareStatement(SELECT_HOUSES_BY_HOUSE_ID_SQL);
        statement.setInt(1, id);

        House house = new House();
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            house.setHouseId(resultSet.getInt("houseId"));
            house.setUserId(resultSet.getInt("userId"));
            house.setImgHouse(resultSet.getString("imgHouse"));
            house.setHouseName(resultSet.getString("housename"));
            house.setPrice(resultSet.getString("price"));
            house.setTimeRental(resultSet.getString("timeRental"));
            house.setAddress(resultSet.getString("address"));
            house.setRevenue(resultSet.getInt("revenue"));
            house.setNumberBath(resultSet.getInt("numberBath"));
            house.setNumberBed(resultSet.getInt("numberBed"));
            house.setWidth(resultSet.getInt("width"));
            house.setDescribeHouse(resultSet.getString("describeHouse"));
            house.setStatus(resultSet.getString("status"));
        }
        house.setPrice(String.format(house.getFormattedPrice()));
        return house;
    }
}
