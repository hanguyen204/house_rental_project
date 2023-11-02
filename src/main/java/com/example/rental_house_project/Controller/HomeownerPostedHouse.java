package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.House;
import com.example.rental_house_project.Service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "HomeownerPostedHouse", urlPatterns = "/HomeownerPostedHouse")

public class HomeownerPostedHouse extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService homeowner = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "add":
                    addHouse(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {

            switch (action) {
                case "add":
                    showNewForm(req, resp);
                    break;
                default:
                    listHouse(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void listHouse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        List<House> list = homeowner.showAllHouse();
        req.setAttribute("list", list);
        req.getRequestDispatcher("HomeownerPostedHouse/showList.jsp").forward(req, resp);
    }

    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("HomeownerPostedHouse/addHouse.jsp").forward(req, resp);
    }

    private void addHouse(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String houseName = req.getParameter("houseName");
        String address = req.getParameter("address");
        int numberBath = Integer.parseInt(req.getParameter("numberBath"));
        int numberBed = Integer.parseInt(req.getParameter("numberBed"));
        String describeHouse = req.getParameter("describeHouse");
        int numberHouseForRent = Integer.parseInt(req.getParameter("numberHouseForRent"));
        String urlImage = req.getParameter("urlImage");

        House newHouse = new House(houseName, address, numberBath, numberBed, describeHouse, urlImage, numberHouseForRent);
        homeowner.addHouse(newHouse);
        req.getRequestDispatcher("HomeownerPostedHouse/addHouse.jsp").forward(req, resp);
    }
}
