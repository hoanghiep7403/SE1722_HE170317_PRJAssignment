/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.session;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.CampusDBContext;
import dal.CourseDBContext;
import dal.DBContext;
import dal.LecturerDBContext;
import dal.SessionDBContext;
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
import model.Course;
import model.Lecturer;
import model.Session;
import model.Student;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SessionController", urlPatterns = {"/session/info"})
public class SessionController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int a = (int) request.getSession().getAttribute("id");
        UserDBContext udb = new UserDBContext();
        Account acc = udb.getUser(a);
        request.setAttribute("role", a);
        if (acc.isRole() == true) {
            StudentDBContext studb = new StudentDBContext();
            ArrayList<Student> stu = studb.getStdCode(a);
            request.setAttribute("stu", stu);
        } else {
            LecturerDBContext lecdb = new LecturerDBContext();
            ArrayList<Lecturer> lect = lecdb.getStdCode(a);
            request.setAttribute("lect", lect);
        }

        CampusDBContext camp = new CampusDBContext();
        ArrayList<Campus> camps = camp.search(a);
        request.setAttribute("camps", camps);

        DBContext<Course> cb = new CourseDBContext();
        ArrayList<Course> courses = cb.all();
        request.setAttribute("courses", courses);

        String raw_session = request.getParameter("session");
        if (raw_session != null) {
            int session = Integer.parseInt(raw_session);
            SessionDBContext sb = new SessionDBContext();
            ArrayList<Session> ses = sb.search(session);
            request.setAttribute("sessions", ses);
            request.getRequestDispatcher("../view/session/info.jsp").forward(request, response);
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
