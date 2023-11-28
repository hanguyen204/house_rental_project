package com.example.rental_house_project.Controller;

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

@WebServlet(name = "UpdateProfileServlet", urlPatterns = "/update-profile")
public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    updateProfileUser(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                try {
                    showEditProfileUser(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "show":
                try {
                    showUserInformation(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    private void updateProfileUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String urlImage = request.getParameter("urlImage");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int id = Integer.parseInt(request.getParameter("id"));

        if (fullName != null && phone != null && address != null) {
            if (!isValidInput(fullName) || !isValidInput(phone) || !isValidInput(address)) {
                userService.updateProfile(username, urlImage, fullName, phone, address);
                request.setAttribute("success", "cập nhật thành công !");
                User user = userService.getUserByID(id);
                request.setAttribute("user",user);
                request.getRequestDispatcher("user-profile.jsp").forward(request,response);
            } else {
                request.setAttribute("error", "Không được dùng đến ký tự đặc biệt trong tất cả các trường !!!");
                request.getRequestDispatcher("update-profile.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Các trường Full name, Phone, Address không được để rỗng !!!");
            request.getRequestDispatcher("update-profile.jsp").forward(request, response);
        }

    }

    private void showEditProfileUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String username = req.getParameter("username");
        User user = userService.showEditProfileUser(username);
        req.setAttribute("user", user);
        req.getRequestDispatcher("update-profile.jsp").forward(req,resp);
    }

    private void showUserInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.getUserByID(id);
        req.setAttribute("user", user);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user-profile.jsp");
        dispatcher.forward(req, resp);
    }
    private boolean isValidInput(String input) {
        String regex = "^[a-zA-Z0-9 ]+$";
        return input.matches(regex);
    }
}
