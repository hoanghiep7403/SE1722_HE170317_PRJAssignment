/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int campus = Integer.parseInt(request.getParameter("campus"));
        UserDBContext db = new UserDBContext();
        Account acc = db.get(username, password, campus);
        if (acc != null) {
            int id = acc.getAccID();
            request.getSession().setAttribute("id", id);
            request.getSession().setAttribute("acc", acc);
            if (acc.isRole() == true) {
                response.sendRedirect("timetable");
            }else{
                response.sendRedirect("schedule");
            }
        } else {
            response.sendRedirect("invalid");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
