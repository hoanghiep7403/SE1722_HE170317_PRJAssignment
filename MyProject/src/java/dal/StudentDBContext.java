 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Attendance;
import model.Course;
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.Student;
import model.TimeSlot;

/**
 *
 * @author sonnt
 */
public class StudentDBContext extends DBContext<Student> {

    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> all() {
        ArrayList<Student> students = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT [sid], scode, sname, Img, Email, Contact, Gender, Dob, accountID FROM Student";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("[sid]"));
                s.setCode(rs.getString("scode"));
                s.setName(rs.getString("sname"));
                s.setImg(rs.getString("Img"));
                s.setEmail(rs.getString("Email"));
                s.setContact(rs.getInt("Contact"));
                s.setGender(rs.getBoolean("Gender"));
                s.setDob(rs.getDate("Dob"));
                Account a = new Account();
                a.setAccID(rs.getInt("accountID"));
                s.setAccount(a);
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }

    public ArrayList<Student> search(int sclass) {
        ArrayList<Student> students = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT s.[sid], s.scode, s.sname, s.Img, s.Email, s.Contact, s.Gender, s.Dob, s.accountID\n"
                    + "FROM Student s INNER JOIN Student_Group sg\n"
                    + "ON s.[sid] = sg.[sid]\n"
                    + "WHERE sg.gid = ?\n";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sclass);
            rs = stm.executeQuery();

            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setCode(rs.getString("scode"));
                s.setName(rs.getString("sname"));
                s.setImg(rs.getString("Img"));
                s.setEmail(rs.getString("Email"));
                s.setContact(rs.getInt("Contact"));
                s.setGender(rs.getBoolean("Gender"));
                s.setDob(rs.getDate("Dob"));
                Account a = new Account();
                a.setAccID(rs.getInt("accountID"));
                s.setAccount(a);
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }

    public ArrayList<Student> getStdCode(int id) {
        ArrayList<Student> students = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT s.sid, s.scode, s.sname, s.Img, s.Email, s.Contact, s.Gender, s.Dob, s.accountID, a.accountName\n"
                    + "FROM Student s INNER JOIN Account a\n"
                    + "ON s.accountID = a.accountID\n"
                    + "WHERE a.accountID = ?\n";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();

            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setCode(rs.getString("scode"));
                s.setName(rs.getString("sname"));
                s.setImg(rs.getString("Img"));
                s.setEmail(rs.getString("Email"));
                s.setContact(rs.getInt("Contact"));
                s.setGender(rs.getBoolean("Gender"));
                s.setDob(rs.getDate("Dob"));
                Account a = new Account();
                a.setAccID(rs.getInt("accountID"));
                a.setAccountName(rs.getString("accountName"));
                s.setAccount(a);
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }

    public Student getTimeTable(int sid, Date from, Date to) {
        Student student = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT s.sid,s.scode,s.sname,ses.sessionid,ses.date,ses.status\n"
                    + ",g.gid,g.gname,r.rid,r.rname,l.lid,l.lcode,l.lname,t.tid,t.description,c.cid,c.ccode,c.cname, att.aid, att.astatus\n"
                    + "FROM Student s\n"
                    + "INNER JOIN [Student_Group] sg ON s.sid = sg.sid\n"
                    + "INNER JOIN [Group] g ON g.gid = sg.gid\n"
                    + "INNER JOIN [Session] ses ON g.gid = ses.gid\n"
                    + "LEFT JOIN [Attendance] att ON ses.sessionid = att.sessionid AND s.sid = att.sid\n"
                    + "INNER JOIN [TimeSlot] t ON t.tid = ses.tid\n"
                    + "INNER JOIN [Room] r ON r.rid = ses.rid\n"
                    + "INNER JOIN [Lecturer] l ON l.lid = ses.lid\n"
                    + "INNER JOIN [Course] c ON c.cid = ses.cid\n"
                    + "WHERE s.sid = ? AND ses.date >= ? AND ses.date <= ? ORDER BY s.sid,g.gid";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            rs = stm.executeQuery();
            Group currentGroup = new Group();
            currentGroup.setId(-1);
            while (rs.next()) {
                if (student == null) {
                    student = new Student();
                    student.setId(rs.getInt("sid"));
                    student.setCode(rs.getString("scode"));
                    student.setName(rs.getString("sname"));
                }
                int gid = rs.getInt("gid");
                if (gid != currentGroup.getId()) {
                    currentGroup = new Group();
                    currentGroup.setId(rs.getInt("gid"));
                    currentGroup.setName(rs.getString("gname"));
                    student.getGroups().add(currentGroup);
                }
                Session ses = new Session();
                ses.setId(rs.getInt("sessionid"));
                ses.setDate(rs.getDate("date"));
                ses.setStatus(rs.getBoolean("status"));
                ses.setGroup(currentGroup);

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(rs.getString("ccode"));
                c.setName(rs.getString("cname"));
                ses.setCourse(c);
                
                Attendance att = new Attendance();
                att.setId(rs.getInt("aid"));
                att.setStatus(rs.getBoolean("astatus"));
                ses.setAttendance(att);
                
                Lecturer l = new Lecturer();
                l.setId(rs.getInt("lid"));
                l.setName(rs.getString("lname"));
                l.setCode(rs.getString("lcode"));
                ses.setLecturer(l);

                Room r = new Room();
                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                ses.setRoom(r);

                TimeSlot t = new TimeSlot();
                t.setId(rs.getInt("tid"));
                t.setName(rs.getString("description"));
                ses.setSlot(t);

                currentGroup.getSessions().add(ses);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return student;
    }
}
