package com.example.rental_house_project.Service;

import com.example.rental_house_project.Model.PostNews;

import java.sql.*;

public class PostNewsService {
    private String url = "jdbc:mysql://localhost:3306/homerental";
    private String user = "root";

    private String password = "1";



    private static final String INSERT_POST_NEWS_SQL = "INSERT INTO PostNews (houseId, userId, createdAt) VALUES (?, ?, ?)";

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

    public void insertPostNews(PostNews postNews) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = connection().prepareStatement(INSERT_POST_NEWS_SQL);
        statement.setInt(1, postNews.getHouseId());
        statement.setInt(2, postNews.getUserId());
        statement.setTimestamp(3, Timestamp.valueOf(postNews.getCreatedAt()));

        statement.executeUpdate();
    }
}
