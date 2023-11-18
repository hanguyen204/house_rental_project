package com.example.rental_house_project.Service;

import com.example.rental_house_project.Model.RentalBill;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class RentalBillService implements IRentalBillService {
    private String url = "jdbc:mysql://localhost:3306/homerental";
    private String user = "root";
    private String password = "2004";

    private static final String SHOW_ALL_RENTALBILL = "SELECT RentalBill.rentalId, RentalBill.rentalDate,RentalBill.payDate,user.fullName, House.houseName,House.price ,RentalBill.totalHouse,RentalBill.status FROM RentalBill JOIN user ON RentalBill.id = user.id JOIN House ON RentalBill.houseId = House.houseId ";
    private static final String SHOW_RENTAL_HISTORY_BY_ID = "select r.houseId,rentalId,dateRental ,housename, totalPayment , h.address , r.status from RentalBill r join user u on r.userId = u.id join House h on r.houseId = h.houseId where id = ? ;";
    private static final String UPDATE_STATUS_HISTORY_RENT = "update rentalbill set status = 'Đang trống' where rentalId = ?;";
    private static final String RENT_AGAIN_HOUSE = "update rentalbill set status = 'Đang cho thuê' where rentalId = ?;";

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
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            long rentalPeriodMillis = payDate.getTime() - rentalDate.getTime();
            long rentalPeriod = TimeUnit.MILLISECONDS.toDays(rentalPeriodMillis);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            double price = rs.getDouble("price");
            double result = rentalPeriod * price;
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, rentalPeriod, houseName, fullName, price, result, totalHouse, status));
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
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            long rentalPeriodMillis = payDate.getTime() - rentalDate.getTime();
            long rentalPeriod = TimeUnit.MILLISECONDS.toDays(rentalPeriodMillis);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            double price = rs.getDouble("price");
            double result = rentalPeriod * price;
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, rentalPeriod, houseName, fullName, price, result, totalHouse, status));
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
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.id = user.id JOIN House ON RentalBill.houseId = House.houseId   WHERE House.houseName  like '%" + name + "%'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            long rentalPeriodMillis = payDate.getTime() - rentalDate.getTime();
            long rentalPeriod = TimeUnit.MILLISECONDS.toDays(rentalPeriodMillis);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            double price = rs.getDouble("price");
            double result = rentalPeriod * price;
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, rentalPeriod, houseName, fullName, price, result, totalHouse, status));
        }
        return list;
    }

    public List<RentalBill> searchDatetimePicker(LocalDateTime startDateTime, LocalDateTime endDateTime) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.id = user.id JOIN House ON RentalBill.houseId = House.houseId   WHERE rentalDate BETWEEN ? AND ?";
        PreparedStatement statement = connection().prepareStatement(query);
        statement.setTimestamp(1, Timestamp.valueOf(startDateTime));
        statement.setTimestamp(2, Timestamp.valueOf(endDateTime));
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            long rentalPeriodMillis = payDate.getTime() - rentalDate.getTime();
            long rentalPeriod = TimeUnit.MILLISECONDS.toDays(rentalPeriodMillis);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            double price = rs.getDouble("price");
            double result = rentalPeriod * price;
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, rentalPeriod, houseName, fullName, price, result, totalHouse, status));
        }
        return list;
    }

    @Override
    public List<RentalBill> searchByStatusCheckOut(String homeStatus) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.id = user.id JOIN House ON RentalBill.houseId = House.houseId   WHERE homeStatus ='Đã trả phòng'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            long rentalPeriodMillis = payDate.getTime() - rentalDate.getTime();
            long rentalPeriod = TimeUnit.MILLISECONDS.toDays(rentalPeriodMillis);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            double price = rs.getDouble("price");
            double result = rentalPeriod * price;
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, rentalPeriod, houseName, fullName, price, result, totalHouse, status));
        }
        return list;

    }

    @Override
    public List<RentalBill> searchByStatusLiveIn(String homeStatus) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.id = user.id JOIN House ON RentalBill.houseId = House.houseId  WHERE homeStatus ='Chờ nhận phòng'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            long rentalPeriodMillis = payDate.getTime() - rentalDate.getTime();
            long rentalPeriod = TimeUnit.MILLISECONDS.toDays(rentalPeriodMillis);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            double price = rs.getDouble("price");
            double result = rentalPeriod * price;
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, rentalPeriod, houseName, fullName, price, result, totalHouse, status));
        }
        return list;
    }

    @Override
    public List<RentalBill> searchByStatusCheckin(String homeStatus) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.totalHouse, RentalBill.status FROM RentalBill JOIN user ON RentalBill.id = user.id JOIN House ON RentalBill.houseId = House.houseId  WHERE homeStatus ='Đang ở'";
        PreparedStatement statement = connection().prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            long rentalPeriodMillis = payDate.getTime() - rentalDate.getTime();
            long rentalPeriod = TimeUnit.MILLISECONDS.toDays(rentalPeriodMillis);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            double price = rs.getDouble("price");
            double result = rentalPeriod * price;
            int totalHouse = rs.getInt("totalHouse");
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, rentalPeriod, houseName, fullName, price, result, totalHouse, status));
        }
        return list;
    }

    public List<RentalBill> showRentHistory (int id) throws ClassNotFoundException, SQLException {
        List<RentalBill> listRentHistory = new ArrayList<>();
        Connection connection = connection();
        PreparedStatement preparedStatement = connection.prepareStatement(SHOW_RENTAL_HISTORY_BY_ID);
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int rentalId = resultSet.getInt("rentalId");
            Date dateRental = resultSet.getDate("dateRental");
            String houseName = resultSet.getString("houseName");
            int totalPayment = resultSet.getInt("totalPayment");
            String address = resultSet.getString("address");
            String status = resultSet.getString("status");
            listRentHistory.add(new RentalBill(rentalId,dateRental,houseName,totalPayment,status,address));
        }
        return listRentHistory;
    }

    public boolean updateStatusForHouse(int id) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = connection().prepareStatement(UPDATE_STATUS_HISTORY_RENT);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
        connection().close();
        return false;
    }

    public boolean rentAgainHouse(int id) throws ClassNotFoundException, SQLException {
        PreparedStatement preparedStatement = connection().prepareStatement(RENT_AGAIN_HOUSE);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
        connection().close();
        return false;
    }
}