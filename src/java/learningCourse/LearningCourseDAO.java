/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package learningCourse;

import course.CourseDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class LearningCourseDAO {

    private static final String GET_ALL_LEARNING_COURSE_ACTIVE = "SELECT * FROM tblLearningCourse WHERE accountID=? AND isLearning=1";
    private static final String GET_ALL_LEARNING_COURSE_NOT_ACTIVE = "SELECT * FROM tblLearningCourse WHERE accountID=? AND isLearning=0";
    private static final String CREATE_LEARNING_COURSE = "INSERT INTO tblLearningCourse(isLearning, expiredDay, courseID, accountID) VALUES(?,?,?,?)";
    private static final String GET_LEARNING_COURSE_BY_COURSEID_ACCOUNTID = "SELECT * FROM tblLearningCourse WHERE accountID = ? AND courseID = ?";
    private static final String UPDATE_LEARNING_COURSE = "UPDATE tblLearningCourse SET isLearning = 0 WHERE accountID = ? AND courseID = ?";
    private static final String UPDATE_LEARNING_COURSE_LEARNING_COURSEID = "UPDATE tblLearningCourse SET isLearning = 0 WHERE learningCourseID = ?";
    private static final String CHECK_LEARNING_COURSE = "SELECT * FROM tblLearningCourse WHERE accountID = ? AND courseID = ? AND isLearning=1";
    private static final String GET_COURSE_NAME_BY_LEARNING_COURSE = "SELECT c.name FROM tblCourse c JOIN tblLearningCourse l ON c.courseID = l.courseID WHERE l.learningCourseID = ?";
            
    public List<LearningCourseDTO> getlistLearningCourseActive(String accountID) throws ClassNotFoundException, SQLException {
        List<LearningCourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LEARNING_COURSE_ACTIVE);
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    
                    int learningCourseID = rs.getInt("learningCourseID");
                    boolean isLearning = rs.getBoolean("isLearning");
                    Date expiredDay = rs.getDate("expiredDay");
                    String courseID = rs.getString("courseID");

                    list.add(new LearningCourseDTO(learningCourseID, isLearning, expiredDay, courseID, accountID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return list;
    }
    
    public List<LearningCourseDTO> getlistLearningCourseNotActive(String accountID) throws ClassNotFoundException, SQLException {
        List<LearningCourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LEARNING_COURSE_NOT_ACTIVE);
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    
                    int learningCourseID = rs.getInt("learningCourseID");
                    boolean isLearning = rs.getBoolean("isLearning");
                    Date expiredDay = rs.getDate("expiredDay");
                    String courseID = rs.getString("courseID");

                    list.add(new LearningCourseDTO(learningCourseID, isLearning, expiredDay, courseID, accountID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return list;
    }
    
    public boolean createLearningCourse(boolean isLearning, String expiredDay, String courseID, String accountID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_LEARNING_COURSE);
                ptm.setBoolean(1, isLearning);
                ptm.setDate(2, Date.valueOf(expiredDay));
                ptm.setString(3, courseID);
                ptm.setString(4, accountID);
                
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public LearningCourseDTO getLearningCourse(String accountID, String courseID) throws ClassNotFoundException, SQLException {
        LearningCourseDTO learningCourse = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LEARNING_COURSE_BY_COURSEID_ACCOUNTID);
                ptm.setString(1, accountID);
                ptm.setString(2, courseID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    
                    int learningCourseID = rs.getInt("learningCourseID");
                    boolean isLearning = rs.getBoolean("isLearning");
                    Date expiredDay = rs.getDate("expiredDay");

                    learningCourse = new LearningCourseDTO(learningCourseID, isLearning, expiredDay, courseID, accountID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return learningCourse;
    }
    
    public int getLearningCourseID(String accountID, String courseID) throws ClassNotFoundException, SQLException {
        int learningCourseID = -1;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LEARNING_COURSE_BY_COURSEID_ACCOUNTID);
                ptm.setString(1, accountID);
                ptm.setString(2, courseID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    
                    learningCourseID = rs.getInt("learningCourseID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return learningCourseID;
    }
    
    public boolean updateLearningCourse(String accountID, String courseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_LEARNING_COURSE);
                ptm.setString(1, accountID);
                ptm.setString(2, courseID);
                
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean updateLearningCourseByID(int learningCourseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_LEARNING_COURSE_LEARNING_COURSEID);
                ptm.setInt(1, learningCourseID);
                
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean checkLearningCourse(String accountID, String courseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_LEARNING_COURSE);
                ptm.setString(1, accountID);
                ptm.setString(2, courseID);
                rs =ptm.executeQuery();
                
                if(rs.next()){
                    check=true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public String getCourseName(int learningCourseID) throws SQLException {
        String courseName = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_COURSE_NAME_BY_LEARNING_COURSE);
                ptm.setInt(1, learningCourseID);
                rs =ptm.executeQuery();
                
                if(rs.next()){
                    courseName = rs.getString("name");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return courseName;
    }
}
