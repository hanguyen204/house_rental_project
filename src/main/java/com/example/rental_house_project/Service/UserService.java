package com.example.rental_house_project.Service;


import com.example.rental_house_project.Model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserService implements IUserService {
    private String url = "jdbc:mysql://localhost:3306/homerental";
    private String user = "root";
    private String password = "1";

    private static final String INSERT_USER = "insert into user (username, phone, password,userType) values (?,?,?,?);";
    private static final String CHECK_MAIL = "SELECT COUNT(*) FROM user WHERE username = ?";
    private static final String SELECT_ALL_USER = "select * from user";
    private static final String SELECT_ALL_ACCUSER = "select id,username,urlImage,fullName,address,phone from user";
    private static final String UPDATE_USERS_SQL = "update user set username = ?,urlImage= ?, fullName =?, address =?,phone=?  where id = ?;";
    private static final String SELECT_USER_BY_ID = "select username,urlImage,fullName,address,phone from user where id =?";

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
    public void insertUser(User user) throws ClassNotFoundException {
        Connection connection = connection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPhone());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4,user.getUserType());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean checkEmail(String username) {
        try {
            Connection connection = connection();
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_MAIL);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            int count = resultSet.getInt(1);
            return count > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public void updateStatusForUser(int id) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = connection().prepareStatement("update user set status = 'Đang hoạt động' where id = ?");
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
        connection().close();
    }

    @Override
    public void updateLockStatusForUser(int id) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = connection().prepareStatement("update user set status = 'Khóa' where id = ?");
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
        connection().close();
    }

    @Override
    public List<User> showAccUser() throws SQLException, ClassNotFoundException {
        List<User> list = new ArrayList<>();
        Connection connection = connection();
        PreparedStatement statement = connection.prepareStatement(SELECT_ALL_USER);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String fullName = rs.getString("fullName");
            String phone = rs.getString("phone");
            String status = rs.getString("status");
            list.add(new User(id, fullName, phone, status));
        }
        return list;
    }

    @Override
    public boolean updateProfileUser(User user) throws ClassNotFoundException, SQLException {
        PreparedStatement statement = connection().prepareStatement(UPDATE_USERS_SQL);
        statement.setString(1, user.getUsername());
        statement.setString(2, user.getUrlImage());
        statement.setString(3, user.getFullName());
        statement.setString(4, user.getAddress());
        statement.setString(5, user.getPhone());
        statement.setInt(6, user.getId());
        statement.executeUpdate();
        statement.close();
        return false;
    }
    public User showEditProfileUser(int id) throws SQLException, ClassNotFoundException {
        User user1 = null;
        PreparedStatement preparedStatement = connection().prepareStatement(SELECT_USER_BY_ID);
        preparedStatement.setInt(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
            String username = rs.getString("username");
            String urlImage = rs.getString("urlImage");
            String fullName = rs.getString("fullName");
            String address = rs.getString("address");
            String phone = rs.getString("phone");
            user1 = new User(username, urlImage, fullName, address, phone);
        }
        return user1;
    }

    public List<User> showUserInformation() throws ClassNotFoundException, SQLException {
        List<User> list = new ArrayList<>();
        PreparedStatement statement = connection().prepareStatement(SELECT_ALL_ACCUSER);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String username = rs.getString("username");
            String urlImage = rs.getString("urlImage");
            String fullName = rs.getString("fullName");
            String address = rs.getString("address");
            String phone = rs.getString("phone");
            list.add(new User(id, username, urlImage, fullName, address, phone));
        }
        return list;
    }
}

