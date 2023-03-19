/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Group;
import model.Lecturer;
import model.Session;
import model.TimeSlot;

/**
 *
 * @author ADMIN
 */
public class SessionDBContext extends DBContext {

    @Override
    public void insert(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Session> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody 
    }

    public ArrayList<Session> search(int sessionid) {
        ArrayList<Session> ses = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT s.sessionid, s.gid, s.cid, s.tid, s.rid, s.lid, s.[date], s.[status], c.cname, c.ccode, g.gname, l.lname, l.lcode\n"
                    + "FROM [Session] s INNER JOIN [Group] g\n"
                    + "ON g.gid = s.gid\n"
                    + "INNER JOIN Course c\n"
                    + "ON s.cid = c.cid\n"
                    + "INNER JOIN Lecturer l\n"
                    + "on l.lid = s.lid\n"
                    + "WHERE s.sessionid = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sessionid);
            rs = stm.executeQuery();

            while (rs.next()) {
                Session s = new Session();
                s.setId(sessionid);
                s.setDate(rs.getDate("date"));
                s.setStatus(rs.getBoolean("status"));
                
                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                s.setGroup(g);
                
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(rs.getString("ccode"));
                c.setName(rs.getString("cname"));
                s.setCourse(c);
                
                Lecturer l = new Lecturer();
                l.setId(rs.getInt("lid"));
                l.setName(rs.getString("lname"));
                l.setCode(rs.getString("lcode"));
                s.setLecturer(l);
                
                TimeSlot ts = new TimeSlot();
                ts.setId(rs.getInt("tid"));
                s.setSlot(ts);
                
                ses.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return ses;
    }
}
