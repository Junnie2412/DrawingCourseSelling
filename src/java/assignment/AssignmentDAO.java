/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import users.UserDTO;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class AssignmentDAO {
    private static final String GET_ASSIGNMENT ="SELECT * FROM tblAssignment WHERE courseID = ?";
    
    public AssignmentDTO getAssignmentByCourseID(String courseID) throws SQLException {
        AssignmentDTO assignment= null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ASSIGNMENT);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    String assignmentID = rs.getString("assignmentID");
                    String topic = rs.getString("topic");

                    assignment = new AssignmentDTO(assignmentID, topic, courseID);
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
        return assignment;
    }
}
