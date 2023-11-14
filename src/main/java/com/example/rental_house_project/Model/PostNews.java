package com.example.rental_house_project.Model;

import java.time.LocalDateTime;

public class PostNews {
    private int newsId;
    private int houseId;
    private int userId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public PostNews(int newsId, int houseId, int userId, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.newsId = newsId;
        this.houseId = houseId;
        this.userId = userId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public PostNews() {

    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
