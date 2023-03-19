/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.attendance.student;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.AttendanceDBContext;
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
import model.Attendance;
import model.Campus;
import model.Lecturer;
import model.Session;
import model.Student;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "TakeAttendanceController", urlPatterns = {"/attendance"})
public class TakeAttendanceController extends BaseRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        int id = (int) request.getSession().getAttribute("id");
        UserDBContext udb = new UserDBContext();
        Account a = udb.getUser(id);
        request.setAttribute("role", a);

        CampusDBContext camp = new CampusDBContext();
        ArrayList<Campus> camps = camp.search(id);
        request.setAttribute("camps", camps);

        LecturerDBContext lecdb = new LecturerDBContext();
        ArrayList<Lecturer> lec = lecdb.getStdCode(id);
        request.setAttribute("lec", lec);

        int sessionid = Integer.parseInt(request.getParameter("sesid"));
        AttendanceDBContext db = new AttendanceDBContext();
        ArrayList<Attendance> atts = db.getAttendancesBySession(sessionid);
        request.setAttribute("atts", atts);
        if (a.isRole() == false) {
            request.getRequestDispatcher("view/attendance/takeAtt.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
        String[] sids = request.getParameterValues("sid");
        int sessionid = Integer.parseInt(request.getParameter("sessionid"));
        Session ss = new Session();
        ss.setId(sessionid);

        ArrayList<Attendance> atts = new ArrayList<>();
        for (String sid : sids) {
            boolean status = request.getParameter("status" + sid).equals("Attended");
            int aid = Integer.parseInt(request.getParameter("aid" + sid));
            String description = request.getParameter("description" + sid);
            Attendance a = new Attendance();
            Student s = new Student();
            s.setId(Integer.parseInt(sid));
            a.setId(aid);
            a.setStatus(status);
            a.setDescription(description);
            a.setStudent(s);
            a.setSession(ss);
            atts.add(a);
        }
        AttendanceDBContext db = new AttendanceDBContext();
        db.update(atts, sessionid);
//        response.sendRedirect("attendance?sesid=" + sessionid);
        response.sendRedirect("schedule");
    }

}
