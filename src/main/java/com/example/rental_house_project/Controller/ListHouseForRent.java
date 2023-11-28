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

@WebServlet(name = "ListHouseForRent", value = "/listHouseForRent")
public class ListHouseForRent extends HttpServlet {
    UserService house = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    editDescribeHouse(req, resp);
                    break;
                case "delete":
                    deleteHouse(req, resp);
                    break;
                case "view":
                    showHouse(req,resp);
                default:
                    listHouse(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void editDescribeHouse(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void deleteHouse(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showHouse(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void listHouse(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("id");
        List<House> listHouse = house.showAllHouse(userId);
        req.setAttribute("list", listHouse);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user-properties.jsp");
        dispatcher.forward(req, resp);
    }
}

