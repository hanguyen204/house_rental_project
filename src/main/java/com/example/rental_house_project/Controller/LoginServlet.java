package com.example.rental_house_project.Controller;

import com.example.rental_house_project.Model.User;
import com.example.rental_house_project.Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.System.out;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username-login");
        String password = request.getParameter("password-login");

        UserService userService = new UserService();

        boolean accountExist = userService.checkUsernameExist(username);
        boolean credentialsValid = userService.checkCredentials(username, password);
        boolean isUserType = userService.checkUserType(username);

        if (accountExist) {
            if (credentialsValid) {
                User user = userService.getUser(username);

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("urlImage", user.getUrlImage());
                    if (isUserType) {
                        session.setAttribute("userType", "Admin");
                    } else {
                        session.setAttribute("userType", "User");
                    }
                    out.println("<script>alert('Login Successful'); window.location.href='home-page.jsp';</script>");
                    response.sendRedirect("home-page.jsp");
                } else {
                    out.println("<script>alert('Failed to retrieve user information'); /*window.location.href='index.html';*/</script>");
                }
            } else {
                out.println("<script>alert('Invalid username or password'); resetFields();</script>");
            }
        } else {
            out.println("<script>alert('Account does not exist'); resetFields();</script>");
        }
    }
}
