
package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

public class CourseFeedbackDAO {
    
    private static final String GET_AVG_RATE ="SELECT CAST(AVG(rate) AS DECIMAL(2, 1)) AS 'AvgRate' FROM tblCourseFeedback WHERE courseID = ?";
    
    public float getAverageRate(String courseID) throws SQLException{
        float avgRate = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
             conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_AVG_RATE);
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
}
