/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class LessonDAO {
    private static final String LASTEST_LESSON ="SELECT TOP 1 * FROM tblLesson ORDER BY lessonID DESC";
    
    private static final String TOTAL_LESSONS ="SELECT COUNT(tblLesson.lessonID) AS totalLessons FROM tblCourse JOIN tblModule ON tblCourse.courseID = tblModule.courseID JOIN tblLesson ON tblModule.moduleID = tblLesson.moduleID WHERE tblCourse.courseID = ? ";
    
    public LessonDTO getLastestLesson() throws SQLException{
        LessonDTO lesson = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
             conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(LASTEST_LESSON);
                rs = ptm.executeQuery();
                if(rs.next()){
                    int lessonID = rs.getInt("lessonID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int videoID = rs.getInt("videoID");

                    lesson = new LessonDTO(lessonID, title, description, videoID);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return lesson;
    }
    
    public int getTotalLessons(String courseID) throws SQLException{
        int totalLessons = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
             conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(TOTAL_LESSONS);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();
                if(rs.next()){
                    totalLessons = rs.getInt("totalLessons");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return totalLessons;
    }
}

