package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.User;
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

@WebServlet(name = "ToggleStatusServlet", urlPatterns = "/toggleStatus")
public class ToggleStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService users = new UserService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "active":
                    active(request,response);
                    break;
                case "unActive" :
                    unActive(request,response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    private void unActive(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("userId"));
        users.updateLockStatusForUser(id);
        List<User> listUser = users.showAccUser();
        request.setAttribute("list", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/showListUser.jsp");
        dispatcher.forward(request, response);
    }

    private void active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("userId"));
        users.updateStatusForUser(id);
        List<User>listUser = users.showAccUser();
        request.setAttribute("list", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/showListUser.jsp");
        dispatcher.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        List<User> listUser = users.showAccUser();
        request.setAttribute("list", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/showListUser.jsp");
        dispatcher.forward(request, response);
    }
}
