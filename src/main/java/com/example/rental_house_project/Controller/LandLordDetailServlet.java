package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.House;
import com.example.rental_house_project.Model.User;
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

@WebServlet(name = "LandLordDetailServlet",value = "/landLordDetail")
public class LandLordDetailServlet extends HttpServlet {
    UserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        List<User> landLordDetail = null;
        try {
            landLordDetail = userService.selectLandLord(id);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("landLordDetail",landLordDetail );
        RequestDispatcher dispatcher = req.getRequestDispatcher("landlord-details.jsp");
        dispatcher.forward(req, resp);
    }
}
