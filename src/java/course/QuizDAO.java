
package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

public class QuizDAO {
    
    private static final String TOTAL_OF_QUIZZES ="SELECT COUNT(q.quizID) AS totalQuizzes FROM tblQuiz q JOIN tblLesson l ON q.lessonID = l.lessonID JOIN tblModule m ON l.moduleID = m.moduleID JOIN tblCourse c ON m.courseID = c.courseID WHERE c.courseID = ? ";
    
    public int getTotalOfQuizzes(String courseID) throws SQLException{
        int totalQuizzes = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
             conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(TOTAL_OF_QUIZZES);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    totalQuizzes = rs.getInt("totalQuizzes");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return totalQuizzes;
    }
}
