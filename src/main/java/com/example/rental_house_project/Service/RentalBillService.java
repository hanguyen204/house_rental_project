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

    private static final String UPDATE_STATUS_RENTALBILL = "UPDATE RentalBill JOIN user ON RentalBill.rentalId = user.id JOIN House ON RentalBill.houseId = House.houseId SET House.housename = ?, RentalBill.status = ? WHERE RentalBill.rentalId = ?";

    private static final String SELECT_ID ="SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.housename, House.price, RentalBill.status FROM RentalBill JOIN user ON RentalBill.rentalId = user.id JOIN House ON RentalBill.houseId = House.houseId WHERE RentalBill.rentalId = ?";

    private static final String SHOW_ALL_RENTALBILL = "SELECT RentalBill.rentalId, RentalBill.rentalDate,RentalBill.payDate, RentalBill.totalPayment,user.fullName, House.houseName,House.price ,House.status FROM RentalBill JOIN user ON RentalBill.rentalId = user.id JOIN House ON RentalBill.houseId = House.houseId";
    private static final String SHOW_RENTAL_HISTORY_BY_ID = "select RentalBill.houseId,RentalBill.rentalId,RentalBill.rentalDate ,House.housename, House.price , House.address , House.status from RentalBill join user on RentalBill.userId = user.id join House on RentalBill.houseId = House.houseId where id  = ?";
    private static final String UPDATE_STATUS_HISTORY_RENT = "update RentalBill JOIN House ON RentalBill.houseId = House.houseId set House.status = 'Đang trống' where rentalId = ?;";
    private static final String RENT_AGAIN_HOUSE = "update RentalBill JOIN House ON RentalBill.houseId = House.houseId set House.status = 'Đang cho thuê' where rentalId = ?";


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
    public RentalBill selectId(int rentalId) throws ClassNotFoundException, SQLException {
        RentalBill rentalBill =null;
        PreparedStatement statement = connection().prepareStatement(SELECT_ID);
        statement.setInt(1,rentalId);
        ResultSet rs = statement.executeQuery();
        while (rs.next()){
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            String status = rs.getString("status");
            rentalBill = new RentalBill(rentalId,rentalDate,payDate,houseName,fullName,price,status);
        }
        return rentalBill;
    }


    @Override
    public void updateHouseNameAndStatus(RentalBill rentalBill) throws ClassNotFoundException, SQLException {
        PreparedStatement statement = connection().prepareStatement(UPDATE_STATUS_RENTALBILL);
        statement.setString(1,rentalBill.getHouseName());
        statement.setString(2,rentalBill.getStatus());
        statement.setInt(3,rentalBill.getRentalId());
        statement.executeUpdate();
    }

    @Override
    public List<RentalBill> ShowAllRentalBill() throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        PreparedStatement statement = connection().prepareStatement(SHOW_ALL_RENTALBILL);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            LocalDate rentalDates = rentalDate.toLocalDate();
            LocalDate payDates = payDate.toLocalDate();
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            int totalHouse = rs.getInt("totalPayment");
            String status = rs.getString("status");
            list.add(new RentalBill(rentalId, rentalDate, payDate, daysBetween, houseName, fullName, price, result, totalHouse, status));
        }
        return list;
    }


    @Override
    public void updateTheStayStatusForTheHost(int rentalId) throws ClassNotFoundException, SQLException {
        PreparedStatement preparedStatement = connection().prepareStatement("update RentalBill set status = 'Đang ở' where rentalId = ?");
        preparedStatement.setInt(1, rentalId);
        preparedStatement.executeUpdate();
        connection().close();
    }

    @Override
    public void updateTheCheckedOutStatusForTheHost(int rentalId) throws ClassNotFoundException, SQLException {
        PreparedStatement preparedStatement = connection().prepareStatement("update RentalBill set status = 'Đã trả phòng' where rentalId = ?");
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
            LocalDate rentalDates = LocalDate.parse((CharSequence) rentalDate);
            LocalDate payDates = LocalDate.parse((CharSequence) payDate);
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            String status = rs.getString("status");
            int totalHouse = rs.getInt("totalHouse");
            list.add(new RentalBill(rentalId, rentalDate, payDate, daysBetween, houseName, fullName, price, result, status,totalHouse));
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
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.status FROM RentalBill JOIN user ON RentalBill.userId = user.id JOIN House ON RentalBill.houseId = House.houseId  WHERE House.houseName  like '%" + name + "%'";
        PreparedStatement statement = connection()
                .prepareStatement(query);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            LocalDate rentalDates = rentalDate.toLocalDate();
            LocalDate payDates = payDate.toLocalDate();
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, daysBetween, houseName, fullName, price, result, status));
    
        }
        return list;
    }

    public List<RentalBill> searchDatetimePicker(LocalDateTime startDateTime, LocalDateTime endDateTime) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String query = "SELECT RentalBill.rentalId, RentalBill.rentalDate, RentalBill.payDate, user.fullName, House.houseName, House.price, RentalBill.status FROM RentalBill JOIN user ON RentalBill.userId = user.id JOIN House ON RentalBill.houseId = House.houseId   WHERE rentalDate BETWEEN ? AND ?";
        PreparedStatement statement = connection().prepareStatement(query);
        statement.setTimestamp(1, Timestamp.valueOf(startDateTime));
        statement.setTimestamp(2, Timestamp.valueOf(endDateTime));
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int rentalId = rs.getInt("rentalId");
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            LocalDate rentalDates = rentalDate.toLocalDate();
            LocalDate payDates = payDate.toLocalDate();
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, daysBetween, houseName, fullName, price, result, status));

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
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            LocalDate rentalDates = rentalDate.toLocalDate();
            LocalDate payDates = payDate.toLocalDate();
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, daysBetween, houseName, fullName, price, result, status));

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
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            LocalDate rentalDates = rentalDate.toLocalDate();
            LocalDate payDates = payDate.toLocalDate();
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, daysBetween, houseName, fullName, price, result, status));

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
            Date rentalDate = rs.getDate("rentalDate");
            Date payDate = rs.getDate("payDate");
            LocalDate rentalDates = rentalDate.toLocalDate();
            LocalDate payDates = payDate.toLocalDate();
            long daysBetween = ChronoUnit.DAYS.between(rentalDates, payDates);
            String houseName = rs.getString("houseName");
            String fullName = rs.getString("fullName");
            String price = rs.getString("price");
            double result = daysBetween * Double.parseDouble(price);
            String status = rs.getString("status");

            list.add(new RentalBill(rentalId, rentalDate, payDate, daysBetween, houseName, fullName, price, result, status));

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



    public List<RentalBill> showRentHistory (int id) throws ClassNotFoundException, SQLException {
        List<RentalBill> listRentHistory = new ArrayList<>();
        PreparedStatement preparedStatement = connection().prepareStatement(SHOW_RENTAL_HISTORY_BY_ID);
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int rentalId = resultSet.getInt("rentalId");
            Date rentalDate = resultSet.getDate("rentalDate");
            String houseName = resultSet.getString("houseName");
            String price  = resultSet.getString("price");
            String address = resultSet.getString("address");
            String status = resultSet.getString("status");
            listRentHistory.add(new RentalBill(rentalId,rentalDate,houseName,price,status,address));
        }
        return listRentHistory;
    }

    @Override
    public boolean updateStatusForHouse(int id) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = connection().prepareStatement(UPDATE_STATUS_HISTORY_RENT);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
        connection().close();
        return false;
    }

    @Override
    public boolean rentAgainHouse(int id) throws ClassNotFoundException, SQLException {
        PreparedStatement preparedStatement = connection().prepareStatement(RENT_AGAIN_HOUSE);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
        connection().close();
        return false;
    }


    public List<RentalBill> searchDatetimePickerAndStatus(LocalDateTime startDateTime, LocalDateTime endDateTime, String status) {
        return null;
    }

    public List<RentalBill> searchByStatus(String status) {
        return null;
    }

    public List<RentalBill> searchAll() {
        return null;
    }

    @Override
    public List<RentalBill>bookAHouse(int houseId, int id, Date rentalDate, Date payDate) throws ClassNotFoundException, SQLException {
        List<RentalBill> list = new ArrayList<>();
        String insertQuery = "INSERT INTO RentalBill (houseId,userId, rentalDate, payDate) VALUES (?,?,?,?)";
        PreparedStatement preparedStatement = connection().prepareStatement(insertQuery);
        preparedStatement.setInt(1,houseId);
        preparedStatement.setInt(2,id);
        preparedStatement.setDate(3,rentalDate);
        preparedStatement.setDate(4,payDate);
        preparedStatement.executeUpdate();

        return list;
    }
}




