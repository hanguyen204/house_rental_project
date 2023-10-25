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

@WebServlet(name = "ProductProfileServlet", urlPatterns = "/profileProduct")
public class ProductProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService product = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    updateProfileProduct(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    showEditProfileProduct(req, resp);
                    break;
                default:
                    showProductInformation(req, resp);
                    break;
            }
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateProfileProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("userName");
        String url_image = request.getParameter("url_image");
        String full_name = request.getParameter("full_name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        User product1 = new User(id, username, url_image, full_name, address, phone);
        product.updateProfileProduct(product1);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Profile/editProfileProduct.jsp");
        dispatcher.forward(request, response);

    }

    private void showEditProfileProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(req.getParameter("id"));
        User products = product.showEditProfileProduct(id);
        req.setAttribute("product", products);
        System.out.println(products);
        req.getRequestDispatcher("Profile/editProfileProduct.jsp").forward(req, resp);
    }

    private void showProductInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        List<User> listUser = product.showProductInformation();
        req.setAttribute("product", listUser);
        RequestDispatcher dispatcher = req.getRequestDispatcher("Profile/showProfileProduct.jsp");
        dispatcher.forward(req, resp);
    }

}
