package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.House;
import com.example.rental_house_project.Model.RentalBill;
import com.example.rental_house_project.Model.User;
import com.example.rental_house_project.Service.HouseService;
import com.example.rental_house_project.Service.RentalBillService;
import com.example.rental_house_project.Service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.concurrent.TimeUnit;

@WebServlet(name = "BookHouse", urlPatterns = "/BookHouse")

public class BookHouse extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RentalBillService rentalBill = new RentalBillService();
    private HouseService houseService = new HouseService();
    HouseService service = new HouseService();
    UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "BookAHouse":
                    bookAHouse(req, resp);
                    break;
                case "showBook":
                    showBook(req, resp);
                    break;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public void showBook(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int houseId = Integer.parseInt(request.getParameter("houseId"));
        int id = Integer.parseInt(request.getParameter("id"));
        House house = houseService.getHouseByHouseId(houseId);
        String houseName = house.getHouseName();
        User user = userService.getUserByID(id);
        String address = house.getAddress();
        String fullName = user.getFullName();
        String phone = user.getPhone();
        String price = house.getPrice();
        request.setAttribute("id",id);
        request.setAttribute("houseId",houseId);
        request.setAttribute("houseName",houseName);
        request.setAttribute("address",address);
        request.setAttribute("fullName",fullName);
        request.setAttribute("phone",phone);
        request.setAttribute("price",price);
        request.getRequestDispatcher("book-house.jsp").forward(request,response);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                default:
                    danhsach(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void danhsach(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int pageSize = 9;
        int currentPage = 1;

        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
        }

        List<House> houses = service.showAllHouseRental();

        int totalHouses = houses.size();
        int totalPages = (int) Math.ceil((double) totalHouses / pageSize);
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalHouses);

        List<House> pagedList = houses.subList(startIndex, endIndex);

        req.setAttribute("pagedList", pagedList);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("currentPage", currentPage);

        RequestDispatcher dispatcher = req.getRequestDispatcher("book-house.jsp");
        dispatcher.forward(req, resp);
    }

    private void bookAHouse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int houseId = Integer.parseInt(req.getParameter("houseId"));
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        Date rentalDate = Date.valueOf(req.getParameter("rentalDate"));
        Date payDate = Date.valueOf(req.getParameter("payDate"));

         rentalBill.bookAHouse(houseId, id, rentalDate, payDate);
        req.getRequestDispatcher("book-house.jsp").forward(req, resp);
    }
}