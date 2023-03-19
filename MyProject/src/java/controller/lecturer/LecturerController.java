/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.CampusDBContext;
import dal.LecturerDBContext;
import dal.StudentDBContext;
import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Campus;
import model.Lecturer;
import model.Student;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "LecturerController", urlPatterns = {"/lecturer/info"})
public class LecturerController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int a = (int) request.getSession().getAttribute("id");
        UserDBContext udb = new UserDBContext();
        Account acc = udb.getUser(a);
        request.setAttribute("role", a);
        if (acc.isRole() == true) {
            StudentDBContext studb = new StudentDBContext();
            ArrayList<Student> stu = studb.getStdCode(a);
            request.setAttribute("stu", stu);
        }else{
            LecturerDBContext lecdb = new LecturerDBContext();
            ArrayList<Lecturer> lect = lecdb.getStdCode(a);
            request.setAttribute("lect", lect);
        }

        CampusDBContext camp = new CampusDBContext();
        ArrayList<Campus> camps = camp.search(a);
        request.setAttribute("camps", camps);

        String raw_lecturer = request.getParameter("lecturer");
        if (raw_lecturer != null) {
            int lecturer = Integer.parseInt(raw_lecturer);
            LecturerDBContext lb = new LecturerDBContext();
            ArrayList<Lecturer> lec = lb.get(lecturer);
            request.setAttribute("lec", lec);

            request.getRequestDispatcher("../view/lecturer/info.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        processRequest(request, response);
    }

}
