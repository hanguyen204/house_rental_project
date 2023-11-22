package com.example.rental_house_project.Service;

import com.example.rental_house_project.Model.RentalBill;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

public interface IRentalBillService {
    RentalBill selectId(int rentalId) throws ClassNotFoundException, SQLException;

    void updateHouseNameAndStatus(RentalBill rentalBill) throws ClassNotFoundException, SQLException;

    List<RentalBill> ShowAllRenTalBill() throws ClassNotFoundException, SQLException;

    void updateTheStayStatusForTheHost(int rentalId) throws ClassNotFoundException, SQLException;

    void updateTheCheckedOutStatusForTheHost(int rentalId) throws ClassNotFoundException, SQLException;

    int getTotalRentalBill();

    List<RentalBill> searchByName(String name) throws SQLException, ClassNotFoundException;

    List<RentalBill> searchDatetimePicker(LocalDateTime startDateTime, LocalDateTime endDateTime) throws ClassNotFoundException, SQLException;

    List<RentalBill> searchByStatusCheckOut(String homeStatus) throws ClassNotFoundException, SQLException;

    List<RentalBill> searchByStatusLiveIn(String homeStatus) throws ClassNotFoundException, SQLException;

    List<RentalBill> searchByStatusCheckin(String homeStatus) throws ClassNotFoundException, SQLException;
    List<RentalBill> showRentHistory(int id) throws ClassNotFoundException, SQLException;

    boolean updateStatusForHouse(int id) throws SQLException, ClassNotFoundException;

    boolean rentAgainHouse(int id) throws ClassNotFoundException, SQLException;

    List<RentalBill>bookAHouse(int houseId, int id, String rentalDate, String payDate) throws ClassNotFoundException, SQLException;
}
