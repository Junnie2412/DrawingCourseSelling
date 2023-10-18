
package course;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import users.UserDTO;
import utils.DBUtil;

public class CourseFeedbackDAO {
    
    private static final String AVG_RATE ="SELECT CAST(AVG(rate) AS DECIMAL(2, 1)) AS 'AvgRate' FROM tblCourseFeedback WHERE courseID = ?";
    
    private static final String GET_FEEDBACK_BY_COURSEID = "SELECT * FROM tblCourseFeedback WHERE isActive = '1' AND [courseID] = ? ";
    
    private static final String GET_ACCOUNT_BY_FEEDBACKID = "SELECT * FROM tblAccount WHERE accountID = (SELECT accountID FROM tblCourseFeedback WHERE courseFeedbackID = ? )";
    
    private static final String TOTAL_FEEDBACK = "SELECT COUNT(courseFeedbackID) AS totalCourseFeedbacks FROM tblCourseFeedback WHERE isActive = '1' AND [courseID] = ? ";
    
    public UserDTO getAccount(int courseFeedbackID) throws SQLException {
        UserDTO customer = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ACCOUNT_BY_FEEDBACKID);
                ptm.setString(1, Integer.toString(courseFeedbackID));
                rs = ptm.executeQuery();

                if (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    Date dateOfBirth = rs.getDate("dateOfBirth");
                    String role = rs.getString("role");
                    boolean isActive = rs.getBoolean("isActive");
                    String image = rs.getString("image");
                    String email = rs.getString("email");

                    customer = new UserDTO(accountID, password, fullName, dateOfBirth, role, isActive, image, email);
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
        return customer;
    }
    
    public List<CourseFeedbackDTO> getListCourseFeedback(String courseID) throws SQLException {
        List<CourseFeedbackDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_FEEDBACK_BY_COURSEID);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    int courseFeedbackID = rs.getInt("courseFeedbackID");
                    String feedback = rs.getString("feedback");
                    int rate = rs.getInt("rate");
                    Date date = rs.getDate("date");
                    boolean isActive = rs.getBoolean("isActive");
                    String accountID = rs.getString("accountID");

                    list.add(new CourseFeedbackDTO(courseFeedbackID, feedback, rate, date, isActive, courseID, accountID));
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
    
    public float getAverageRate(String courseID) throws SQLException{
        float avgRate = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
             conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(AVG_RATE);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    avgRate = rs.getFloat("AvgRate");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return avgRate;
    }
    
    public int getTotalFeedback(String courseID) throws SQLException{
        int totalCourseFeedbacks = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
             conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(TOTAL_FEEDBACK);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    totalCourseFeedbacks = rs.getInt("totalCourseFeedbacks");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return totalCourseFeedbacks;
    }
}
