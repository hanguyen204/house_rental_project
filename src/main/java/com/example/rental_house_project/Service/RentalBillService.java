package com.example.rental_house_project.Service;

import com.example.rental_house_project.Model.RentalBill;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class RentalBillService implements IRentalBillService {
    private String url = "jdbc:mysql://localhost:3306/homerental";
    private String user = "root";
    private String password = "1";

    private static final String SHOW_ALL_RENTALBILL = "SELECT RentalBill.rentalId, RentalBill.dateRental,RentalBill.datePay,user.fullName, House.houseName,House.price ,RentalBill.status FROM RentalBill JOIN user ON RentalBill.rentalId = user.id JOIN House ON RentalBill.houseId = House.houseId ";

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

    @Override
    public List<RentalBill> ShowAllRenTalBill() throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        PreparedStatement statement = connection().prepareStatement(SHOW_ALL_RENTALBILL);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            String rentalDate = rs.getString("rentalDate");
            String payDate = rs.getString("payDate");
            LocalDate rentalDates = LocalDate.parse(rentalDate);
            LocalDate payDates = LocalDate.parse(payDate);
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");


            list.add(new RentalBill(rentalDate, payDate));
        }
        return list;
    }

    @Override
    public void updateTheStayStatusForTheHost(int rentalId) throws ClassNotFoundException, SQLException {
        PreparedStatement preparedStatement = connection().prepareStatement("update RentalBill set status = 'Đang ở' where id = ?");
        preparedStatement.setInt(1, rentalId);
        preparedStatement.executeUpdate();
        connection().close();
    }

    @Override
    public void updateTheCheckedOutStatusForTheHost(int rentalId) throws ClassNotFoundException, SQLException {
        PreparedStatement preparedStatement = connection().prepareStatement("update RentalBill set status = 'Đã trả phòng' where id = ?");
        preparedStatement.setInt(1, rentalId);
        preparedStatement.executeUpdate();
        connection().close();
    }

    public List<RentalBill> showAccUser() throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        Connection connection = connection();
        PreparedStatement statement = connection.prepareStatement(SHOW_ALL_RENTALBILL);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            String rentalDate = rs.getString("rentalDate");
            String payDate = rs.getString("payDate");
            LocalDate rentalDates = LocalDate.parse(rentalDate);
            LocalDate payDates = LocalDate.parse(payDate);
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");


            list.add(new RentalBill(rentalDate, payDate));
        }
        return list;
    }

    @Override
    public int getTotalRentalBill() {
        int totalRentalBill = 0;

        try (Connection connection = connection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) FROM RentalBill")) {

            if (resultSet.next()) {
                totalRentalBill = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return totalRentalBill;
    }

    @Override
    public List<RentalBill> searchByName(String name) throws SQLException, ClassNotFoundException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.userId = user.id JOIN House ON RentalBill.houseId = House.houseId   WHERE House.houseName  like '%" + name + "%'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            String rentalDate = rs.getString("rentalDate");
            String payDate = rs.getString("payDate");
            LocalDate rentalDates = LocalDate.parse(rentalDate);
            LocalDate payDates = LocalDate.parse(payDate);
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");


            list.add(new RentalBill(rentalDate, payDate));
        }
        return list;
    }

    public List<RentalBill> searchDatetimePicker(LocalDateTime startDateTime, LocalDateTime endDateTime) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.userId = user.id JOIN House ON RentalBill.houseId = House.houseId   WHERE rentalDate BETWEEN ? AND ?";
        PreparedStatement statement = connection().prepareStatement(query);
        statement.setTimestamp(1, Timestamp.valueOf(startDateTime));
        statement.setTimestamp(2, Timestamp.valueOf(endDateTime));
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            String rentalDate = rs.getString("rentalDate");
            String payDate = rs.getString("payDate");
            LocalDate rentalDates = LocalDate.parse(rentalDate);
            LocalDate payDates = LocalDate.parse(payDate);
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");


            list.add(new RentalBill(rentalDate, payDate));
        }
        return list;
    }

    @Override
    public List<RentalBill> searchByStatusCheckOut(String homeStatus) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.userId = user.id JOIN House ON RentalBill.houseId = House.houseId   WHERE homeStatus ='Đã trả phòng'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            String rentalDate = rs.getString("rentalDate");
            String payDate = rs.getString("payDate");
            LocalDate rentalDates = LocalDate.parse(rentalDate);
            LocalDate payDates = LocalDate.parse(payDate);
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");


            list.add(new RentalBill(rentalDate, payDate));
        }
        return list;

    }

    @Override
    public List<RentalBill> searchByStatusLiveIn(String homeStatus) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.userId = user.id JOIN House ON RentalBill.houseId = House.houseId  WHERE homeStatus ='Chờ nhận phòng'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            String rentalDate = rs.getString("rentalDate");
            String payDate = rs.getString("payDate");
            LocalDate rentalDates = LocalDate.parse(rentalDate);
            LocalDate payDates = LocalDate.parse(payDate);
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");


            list.add(new RentalBill(rentalDate, payDate));
        }
        return list;
    }

    @Override
    public List<RentalBill> searchByStatusCheckin(String homeStatus) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.userId = user.id JOIN House ON RentalBill.houseId = House.houseId  WHERE homeStatus ='Đang ở'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            String rentalDate = rs.getString("rentalDate");
            String payDate = rs.getString("payDate");
            LocalDate rentalDates = LocalDate.parse(rentalDate);
            LocalDate payDates = LocalDate.parse(payDate);
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");


            list.add(new RentalBill(rentalDate, payDate));
        }
        return list;
    }

    @Override
    public List<RentalBill>bookAHouse(int houseId, int id, String rentalDate, String payDate) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String insertQuery = "INSERT INTO RentalBill (houseId,userId, rentalDate, payDate) VALUES (?,?,?,?)";
        PreparedStatement preparedStatement = connection().prepareStatement(insertQuery);
        preparedStatement.setInt(1,houseId);
        preparedStatement.setInt(2,id);
        preparedStatement.setString(3,rentalDate);
        preparedStatement.setString(4,payDate);
        preparedStatement.executeUpdate();

        return list;
    }
}
