package com.example.rental_house_project.Service;


import com.example.rental_house_project.Model.User;

import java.sql.*;


public class UserService implements IUserService {
    private String url = "jdbc:mysql://localhost:3306/homerental";
    private String user = "root";
    private String password = "anhnam2005";

    private static final String INSERT_USER = "insert into user (username, phone, password) values (?,?,?);";
    private static final String CHECK_MAIL = "SELECT COUNT(*) FROM user WHERE username = ?";
    private static final String SELECT_USER_EXIST = "SELECT COUNT(*) FROM user WHERE username = ?";
    private static final String SELECT_USER = "SELECT * FROM user where username = ?";
    private static final String SELECT_USER_TYPE = "SELECT userType FROM user WHERE username = ?;";

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
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean checkUserType(String username) {
        try (Connection connection = connection();
             PreparedStatement statement = connection.prepareStatement(SELECT_USER_TYPE);) {
            statement.setString(1, username);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String userType = resultSet.getString("userType");
                return userType.equalsIgnoreCase("Admin");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return false;
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

    public boolean checkUsernameExist(String username) {
        try (Connection connection = connection();
             PreparedStatement statement = connection.prepareStatement(SELECT_USER_EXIST)) {
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkCredentials(String username, String password) {
        try {
            Connection conn = connection();
            String sql = "SELECT COUNT(*) FROM user WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return false;
    }

    public User getUser(String username) {
        try (Connection connection = connection();
             PreparedStatement preparedStatement = connection().prepareStatement(SELECT_USER)) {
            preparedStatement.setString(1, username);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int id = rs.getInt(1);
                String urlImage = rs.getString("urlImage");
                String fullname = rs.getString("fullname");
                String address = rs.getString("address");
                int revenue = rs.getInt("revenue");
                int numberHouseForRent = rs.getInt("numberHouseForRent");
                String phone = rs.getString("phone");
                String userType = rs.getString("userType");
                String status = rs.getString("status");


                User user = new User(username);
                user.setUrlImage(urlImage);
                user.setFullName(fullname);
                user.setAddress(address);
                user.setRevenue(revenue);
                user.setNumberHouseForRent(numberHouseForRent);
                user.setPhone(phone);
                user.setUserType(userType);
                user.setStatus(status);
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }
}

