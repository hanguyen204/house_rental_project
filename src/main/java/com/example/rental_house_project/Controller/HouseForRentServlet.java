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
import java.util.List;

@WebServlet(name = "HouseForRentServlet", urlPatterns = "/HouseForRentServlet")

public class HouseForRentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RentalBillService rentalBill = new RentalBillService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
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


    private void checkout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int rentalId = Integer.parseInt(req.getParameter("rentalId"));
        rentalBill.updateTheStayStatusForTheHost(rentalId);
        List<RentalBill> list = rentalBill.showAccUser();
        req.setAttribute("list", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("listHouseForRent.jsp");
        dispatcher.forward(req, resp);
    }

    private void checkin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int rentalId = Integer.parseInt(req.getParameter("rentalId"));
        rentalBill.updateTheCheckedOutStatusForTheHost(rentalId);
        List<RentalBill> list = rentalBill.showAccUser();
        req.setAttribute("list", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("listHouseForRent.jsp");
        dispatcher.forward(req, resp);
    }

    private void ListHousesForRent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int page = 1; // Trang mặc định
        int limit = 5; // Số lượng dữ liệu trên mỗi trang

        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }

        int start = (page - 1) * limit;
        int end = start + limit;
        try {
            List<RentalBill> list = rentalBill.ShowAllRenTalBill();
            int totalUsers = rentalBill.getTotalRentalBill();

            // Tính toán tổng số trang dựa trên tổng số người dùng và số lượng dòng trên mỗi trang
            int totalPages = (int) Math.ceil((double) totalUsers / limit);
            req.setAttribute("list", list);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPages", totalPages);

            RequestDispatcher dispatcher = req.getRequestDispatcher("listHouseForRent.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
