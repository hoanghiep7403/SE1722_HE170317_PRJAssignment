/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.CampusDBContext;
import dal.CourseDBContext;
import dal.DBContext;
import dal.StudentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Campus;
import model.Course;
import model.Student;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "StudentController", urlPatterns = {"/student/info"})
public class StudentController extends BaseRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int a = (int) request.getSession().getAttribute("id");
        StudentDBContext studb = new StudentDBContext();
        ArrayList<Student> stu = studb.getStdCode(a);
        request.setAttribute("stu", stu);
        
        CampusDBContext camp = new CampusDBContext();
        ArrayList<Campus> camps = camp.search(a);
        request.setAttribute("camps", camps);

        DBContext<Course> cb = new CourseDBContext();
        ArrayList<Course> courses = cb.all();
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("../view/student/info.jsp").forward(request, response);
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
