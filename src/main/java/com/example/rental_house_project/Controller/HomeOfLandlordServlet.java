package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.House;
import com.example.rental_house_project.Model.User;
import com.example.rental_house_project.Service.HouseService;
import com.example.rental_house_project.Service.RentalBillService;

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

@WebServlet("/danh-sach-nha-cua-ban")
public class HomeOfLandlordServlet extends HttpServlet {
    HouseService service = new HouseService();
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "updateHouse":
                    showEditHouse(req,resp);
                    break;
                case "deleteHouse":
                    deleteHouse(req, resp);
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

    private void deleteHouse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
      int houseId = Integer.parseInt(req.getParameter("houseId"));
        service.deleteHouse(houseId);
        List<House> listHouse = service.getHousesByUserId(houseId);
        req.setAttribute("pagedList", listHouse);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user-properties.jsp");
        dispatcher.forward(req, resp);

    }

    private void showEditHouse(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int houseId = Integer.parseInt(req.getParameter("houseId"));
        House house = service.getHouseByHouseId(houseId);
        req.setAttribute("house", house);
        req.getRequestDispatcher("editHouse.jsp").forward(req, resp);
    }

    private void listHouse(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("id");
        int pageSize = 5;
        int currentPage = 1;

        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
        }

        List<House> houses = service.getAllHomeOfLandlord(id);

        int totalHouses = houses.size();
        int totalPages = (int) Math.ceil((double) totalHouses / pageSize);

        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalHouses);

        List<House> pagedList = houses.subList(startIndex, endIndex);

        req.setAttribute("pagedList", pagedList);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("currentPage", currentPage);

        RequestDispatcher dispatcher = req.getRequestDispatcher("user-properties.jsp");
        dispatcher.forward(req, resp);
    }

}
