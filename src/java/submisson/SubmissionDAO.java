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
    private static final String CREATE_SUBMISSION = "INSERT INTO tblSubmission(accountID, assignmentID, isGraded, isPassed, instructorNote, grade, project) VALUES(?,?,?,?,?,?,?)";
    
    public boolean createSubmission(String accountID, String assignmentID, byte[] project ) throws SQLException {
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
                ptm.setBoolean(3, false);
                ptm.setBoolean(4, false);
                ptm.setString(5, "");
                ptm.setFloat(6, 0);
                ptm.setBytes(7, project);
                
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
}
