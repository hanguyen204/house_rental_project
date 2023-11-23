package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.House;
import com.example.rental_house_project.Model.PostNews;
import com.example.rental_house_project.Service.HouseService;
import com.example.rental_house_project.Service.PostNewsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Base64;

@WebServlet("/submit-property")
@MultipartConfig(maxFileSize = 1024 * 1024)
public class SubmitPropertyServlet extends HttpServlet {
    private static final String IMAGE_DIRECTORY = "C:/Users/LENOVO/house_rental_project/src/main/webapp/assets/img/demo/house";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("id");

        // Lấy thông tin từ form
        String houseName = request.getParameter("houseName");
        String price = request.getParameter("price");
        String timeRental = request.getParameter("timeRental");
        String address = request.getParameter("address");
        String areaHouse = request.getParameter("width");
        String numberBath = request.getParameter("numberBath");
        String numberBed = request.getParameter("numberBed");
        String describeHouse = request.getParameter("description");

        // Xử lý file ảnh
        Part filePart = request.getPart("image");
        String fileName= filePart.getSubmittedFileName();

        if (!houseName.isEmpty()) {
            if (!price.isEmpty()) {
                if (!address.isEmpty()) {
                    if (!areaHouse.isEmpty()) {
                        House house = new House();
                        house.setUserId(userId);
                        house.setImgHouse(fileName);
                        house.setHouseName(houseName);
                        house.setPrice(price);
                        house.setTimeRental(timeRental);
                        house.setAddress(address);
                        house.setWidth(Integer.parseInt(areaHouse));
                        house.setNumberBath(Integer.parseInt(numberBath));
                        house.setNumberBed(Integer.parseInt(numberBed));
                        house.setDescribeHouse(describeHouse);
                        house.setStatus("Đang trống");

                        System.out.println(house.getHouseName());

                        HouseService houseService = new HouseService();
                        SubmitPropertyServlet submitProperty = new SubmitPropertyServlet();

                        try {
                            submitProperty.saveImageToFile(filePart,fileName);
                            houseService.insertHouse(house);

                            int houseId = houseService.getHouseByHouseName(houseName);

                            PostNews postNews = new PostNews();
                            postNews.setHouseId(houseId);
                            postNews.setUserId(userId);

                            LocalDateTime currentTime = LocalDateTime.now();
                            postNews.setCreatedAt(currentTime);

                            PostNewsService postNewsService = new PostNewsService();
                            postNewsService.insertPostNews(postNews);

                            request.setAttribute("success","Bạn đã đang tin thành công !");
                            request.getRequestDispatcher("success.jsp");
                        } catch (SQLException e) {
                            e.printStackTrace();
                            response.sendRedirect("/error.jsp");
                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                        }
                    } else {
                        request.setAttribute("errorWidth", "Vui lòng là nhập diện tích nhà ");
                        request.getRequestDispatcher("submit-properties.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("errorAddress", "Vui lòng nhập địa chỉ");
                    request.getRequestDispatcher("submit-properties.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorPrice", "Vui lòng nhập số tiền cho thuê");
                request.getRequestDispatcher("submit-properties.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorHouseName", "Vui lòng nhập tên nhà");
            request.getRequestDispatcher("submit-properties.jsp").forward(request, response);
        }
    }

    private void saveImageToFile(Part filePart, String fileName) throws IOException {
        File imageDirectory = new File(IMAGE_DIRECTORY);
        if (!imageDirectory.exists()) {
            imageDirectory.mkdirs();
        }

        File imageFile = new File(imageDirectory, fileName);
        try (InputStream inputStream = filePart.getInputStream()) {
            Files.copy(inputStream, imageFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
    }
}
