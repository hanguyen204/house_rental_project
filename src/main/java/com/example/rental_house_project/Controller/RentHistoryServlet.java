package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.RentalBill;
import com.example.rental_house_project.Model.User;
import com.example.rental_house_project.Service.RentalBillService;
import com.mysql.cj.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "RentalHistoryServlet" , value = "/rentalHistory")
public class RentHistoryServlet extends HttpServlet {
    RentalBillService rentalBillService = new RentalBillService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "cancel":
                    cancelRental(req,resp);
                    break;
                case "rentAgain":
                    rentAgain(req,resp);
                default:
                    historyRent(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void rentAgain(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int rentalId = Integer.parseInt(req.getParameter("rentalId"));
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        rentalBillService.rentAgainHouse(rentalId);
        List<RentalBill> rentHistory = rentalBillService.showRentHistory(id);
        req.setAttribute("rentHistory", rentHistory);
        RequestDispatcher dispatcher = req.getRequestDispatcher("rentHistory.jsp");
        dispatcher.forward(req, resp);
    }

    private void cancelRental(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int rentalId = Integer.parseInt(req.getParameter("rentalId"));
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        rentalBillService.updateStatusForHouse(rentalId);
        List<RentalBill> rentHistory = rentalBillService.showRentHistory(id);
        req.setAttribute("rentHistory", rentHistory);
        RequestDispatcher dispatcher = req.getRequestDispatcher("rentHistory.jsp");
        dispatcher.forward(req, resp);
    }

    private void historyRent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        List<RentalBill> rentHistory;
        try {
            rentHistory = rentalBillService.showRentHistory(id);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("rentHistory",rentHistory );
        RequestDispatcher dispatcher = req.getRequestDispatcher("rentHistory.jsp");
        dispatcher.forward(req, resp);
    }
}
