package com.example.rental_house_project.Service;

import com.example.rental_house_project.Model.RentalBill;

import java.sql.SQLException;
import java.util.List;

public interface IRentalBillService {
    List<RentalBill> ShowAllRenTalBill() throws ClassNotFoundException, SQLException;

    void updateTheStayStatusForTheHost(int rentalId) throws ClassNotFoundException, SQLException;

    void updateTheCheckedOutStatusForTheHost(int rentalId) throws ClassNotFoundException, SQLException;

    int getTotalRentalBill();
}
