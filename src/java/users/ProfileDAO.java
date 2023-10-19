
package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

public class ProfileDAO {
    
    private static final String GET_PROFILE_BY_ACCOUNTID = "SELECT profileID, achivement, portfolio, accountID FROM tblProfile WHERE accountID = ? ";
    
    private static final String GET_PROFILE_BY_COURSEID = "SELECT p.* FROM tblProfile p INNER JOIN tblAccount a ON p.accountID = a.accountID INNER JOIN tblCourse c ON a.accountID = c.accountID WHERE c.courseID = ? ";
    
    public ProfileDTO getProfile(String accountID) throws SQLException {
        ProfileDTO profile = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PROFILE_BY_ACCOUNTID);
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    String profileID = rs.getString("profileID");
                    String achivement = rs.getString("achivement");
                    String portfolio = rs.getString("portfolio");

                    profile = new ProfileDTO(profileID, achivement, portfolio, accountID);
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
        return profile;
    }
    
    public ProfileDTO getProfileByCourseID(String courseID) throws SQLException {
        ProfileDTO profile = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PROFILE_BY_COURSEID);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    String profileID = rs.getString("profileID");
                    String achivement = rs.getString("achivement");
                    String portfolio = rs.getString("portfolio");
                    String accountID = rs.getString("accountID");

                    profile = new ProfileDTO(profileID, achivement, portfolio, accountID);
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
        return profile;
    }
}
