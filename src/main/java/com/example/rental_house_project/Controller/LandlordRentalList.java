package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.House;
import com.example.rental_house_project.Service.UserService;

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

@WebServlet(name = "LandlordRentalList",value = "/landlordRentalList")
public class LandlordRentalList extends HttpServlet {
    UserService house = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId =  Integer.parseInt(req.getParameter("userId"));
        List<House> listHouse = null;
        try {
            listHouse = house.showAllHouse(userId);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("list", listHouse);
        RequestDispatcher dispatcher = req.getRequestDispatcher("landlordRentalList.jsp");
        dispatcher.forward(req, resp);
    }
}
