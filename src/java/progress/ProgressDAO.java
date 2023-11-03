/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package progress;

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
public class ProgressDAO {
    private static final String CREATE_PROGRESS = "INSERT INTO tblProgress(learningCourseID, videoID, IsFnished) VALUES(?,?,1)";
    private static final String CHECK_EXIST_PROGRESS = "SELECT * FROM tblProgress WHERE learningCourseID = ? AND videoID = ?";
    private static final String GET_NUMBER_FINISH = "SELECT COUNT(learningCourseID) AS 'Number' FROM tblProgress WHERE isFnished = 1 AND learningCourseID = ?;";
    
    public boolean createProgress(int learningCourseID, int videoID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_PROGRESS);
                ptm.setInt(1, learningCourseID);
                ptm.setInt(2, videoID);
                
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
    
    public boolean checkExistProgress(int leaningCourseID, int videoID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EXIST_PROGRESS);
                ptm.setInt(1, leaningCourseID);
                ptm.setInt(2, videoID);

                rs= ptm.executeQuery();
                
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
    
    public int getNumberFinished(int learningCourseID) throws SQLException {
        int count = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMBER_FINISH);
                ptm.setInt(1, learningCourseID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    count = rs.getInt("Number");
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
        return count;
    }
}
