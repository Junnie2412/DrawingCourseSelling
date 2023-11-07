/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package submisson;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class SubmissionDAO {
    private static final String CREATE_SUBMISSION = "INSERT INTO tblSubmission(accountID, assignmentID, learningCourseID, isGraded, isPassed, instructorNote, grade, project) VALUES(?,?,?,?,?,?,?,?)";
    private static final String CHECK_PASS_SUBMISSION = "SELECT * FROM tblSubmission WHERE accountID =? AND assignmentID = ? AND learningCourseID = ? AND isPassed = 1";
    private static final String CHECK_SUBMITTED_SUBMISSION = "SELECT * FROM tblSubmission WHERE accountID =? AND assignmentID = ? AND learningCourseID = ? AND isGraded = 0";
    
    public boolean createSubmission(String accountID, String assignmentID, int learningCourseID, byte[] project ) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_SUBMISSION);
                ptm.setString(1, accountID);
                ptm.setString(2, assignmentID);
                ptm.setInt(3, learningCourseID);
                ptm.setBoolean(4, false);
                ptm.setBoolean(5, false);
                ptm.setString(6, "");
                ptm.setFloat(7, 0);
                ptm.setBytes(8, project);
                
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
    
    public boolean checkPassSubmission(String accountID, String assignmentID, int learningCourseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_PASS_SUBMISSION);
                ptm.setString(1, accountID);
                ptm.setString(2, assignmentID);
                ptm.setInt(3, learningCourseID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    check = true;
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
    
    public boolean checkSubmittedSubmission(String accountID, String assignmentID, int learningCourseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_SUBMITTED_SUBMISSION);
                ptm.setString(1, accountID);
                ptm.setString(2, assignmentID);
                ptm.setInt(3, learningCourseID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    check = true;
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
}
