package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.House;
import com.example.rental_house_project.Model.User;
import com.example.rental_house_project.Service.HouseService;
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

@WebServlet("/view-house")
public class ViewHouseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String houseIdParam = req.getParameter("id");
        int houseId = Integer.parseInt(houseIdParam);
        UserService userService = new UserService();
        HouseService houseService = new HouseService();
        House house = new House();
        User user = new User();
        try {
            house = houseService.getHouseByHouseId(houseId);

            int userId = house.getUserId();

            user = userService.getUserByID(userId);

            req.setAttribute("user", user);
            req.setAttribute("house", house);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("view-house.jsp");
        dispatcher.forward(req, resp);

    }
}
