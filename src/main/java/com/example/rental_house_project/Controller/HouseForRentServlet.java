package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.House;
import com.example.rental_house_project.Model.RentalBill;
import com.example.rental_house_project.Model.User;
import com.example.rental_house_project.Service.RentalBillService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@WebServlet(name = "HouseForRentServlet", urlPatterns = "/HouseForRentServlet")

public class HouseForRentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
     RentalBillService rentalBill = new RentalBillService();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "updateHouseNameAndStatus":
                    updateHouseNameAndStatus(req,resp);
                    break;
                case "search":
                    search(req, resp);
                    break;
                case "CheckIN":
                    searchByStatusCheckin(req, resp);
                    break;
                case "liveIn":
                    searchByStatusLiveIn(req, resp);
                    break;
                case "CheckedOut":
                    searchByStatusCheckOut(req,resp);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
  }

    private void updateHouseNameAndStatus(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int rentalId = Integer.parseInt(req.getParameter("rentalId"));
        String houseName = req.getParameter("houseName");
        String status = req.getParameter("status");

        RentalBill bill = new RentalBill(rentalId,houseName,status);
        rentalBill.updateHouseNameAndStatus(bill);
        req.getRequestDispatcher("edit.jsp").forward(req,resp);
    }


    private void searchByStatusCheckOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String homeStatus = req.getParameter("homeStatus");
        List<RentalBill> list = rentalBill.searchByStatusCheckOut(homeStatus);
        req.setAttribute("list", list);
        req.getRequestDispatcher("searchRentalBill.jsp").forward(req, resp);
    }

    private void searchByStatusLiveIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String homeStatus = req.getParameter("homeStatus");
        List<RentalBill> list = rentalBill.searchByStatusLiveIn(homeStatus);
        req.setAttribute("list", list);
        req.getRequestDispatcher("searchRentalBill.jsp").forward(req, resp);
    }

    private void searchByStatusCheckin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String homeStatus = req.getParameter("homeStatus");
        List<RentalBill> list = rentalBill.searchByStatusCheckin(homeStatus);
        req.setAttribute("list", list);
        req.getRequestDispatcher("searchRentalBill.jsp").forward(req, resp);
    }
    private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException, ParseException {
        String searchKeyword = req.getParameter("searchKeyword");
        String startDateTimeStr = req.getParameter("startDateTime");
        String endDateTimeStr = req.getParameter("endDateTime");
        String status = req.getParameter("status");

        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            // Thực hiện tìm kiếm theo keyword
            List<RentalBill> list = rentalBill.searchByName(searchKeyword);
            req.setAttribute("showList", list);
        } else if (startDateTimeStr != null && !startDateTimeStr.isEmpty() && endDateTimeStr != null && !endDateTimeStr.isEmpty()) {
            // Thực hiện tìm kiếm theo khoảng thời gian
            LocalDateTime startDateTime = LocalDateTime.parse(startDateTimeStr);
            LocalDateTime endDateTime = LocalDateTime.parse(endDateTimeStr);

            if (status != null && !status.isEmpty()) {
                // Thực hiện tìm kiếm theo khoảng thời gian và trạng thái
                List<RentalBill> searchResults = rentalBill.searchDatetimePickerAndStatus(startDateTime, endDateTime, status);
                req.setAttribute("showList", searchResults);
            } else {
                // Thực hiện tìm kiếm theo khoảng thời gian
                List<RentalBill> searchResults = rentalBill.searchDatetimePicker(startDateTime, endDateTime);
                req.setAttribute("showList", searchResults);
            }
        } else if (status != null && !status.isEmpty()) {
            // Thực hiện tìm kiếm theo trạng thái
            List<RentalBill> searchResults = rentalBill.searchByStatus(status);
            req.setAttribute("showList", searchResults);
        } else {
            // Thực hiện tìm kiếm tất cả bao gồm: keyword, thời gian, trạng thái
            List<RentalBill> searchResults = rentalBill.searchAll(); // Implement this method accordingly
            req.setAttribute("showList", searchResults);
        }

        req.getRequestDispatcher("listHouseForRent.jsp").forward(req, resp);
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "updateHouseNameAndStatus":
                    showUpdateFrom(req,resp);
                    break;
                case "checkin":
                    checkin(req, resp);
                    break;
                case "checkout":
                    checkout(req, resp);
                    break;
                default:
                    ListHousesForRent(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void showUpdateFrom(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int rentalId = Integer.parseInt(req.getParameter("rentalId"));
        RentalBill bill = rentalBill.selectId(rentalId);
        RequestDispatcher dispatcher = req.getRequestDispatcher("edit.jsp");
        req.setAttribute("bill",bill);
        dispatcher.forward(req,resp);
    }


    private void checkout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int rentalId = Integer.parseInt(req.getParameter("rentalId"));
        rentalBill.updateTheStayStatusForTheHost(rentalId);
        List<RentalBill> list = rentalBill.showAccUser();
        req.setAttribute("showList", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("listHouseForRent.jsp");
        dispatcher.forward(req, resp);
    }

    private void checkin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int rentalId = Integer.parseInt(req.getParameter("rentalId"));
        rentalBill.updateTheCheckedOutStatusForTheHost(rentalId);
        List<RentalBill> list = rentalBill.showAccUser();
        req.setAttribute("showList", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("listHouseForRent.jsp");
        dispatcher.forward(req, resp);
    }

    private void ListHousesForRent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int page = 1;
        int limit = 5;

        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }

        int start = (page - 1) * limit;
        int end = start + limit;
        List<RentalBill>list = rentalBill.ShowAllRentalBill();
        int totalUsers = rentalBill.getTotalRentalBill();

        int totalPages = (int) Math.ceil((double) totalUsers / limit);
        req.setAttribute("showList", list);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);

        req.getRequestDispatcher("listHouseForRent.jsp").forward(req, resp);
    }
}
