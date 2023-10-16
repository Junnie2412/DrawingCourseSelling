/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class VideoDAO {
    private static final String LASTEST_VIDEO ="SELECT TOP 1 * FROM tblVideo ORDER BY videoID DESC";
    
    private static final String GET_LASTEST_VIDEO_BY_COURSEID = "SELECT TOP 1 v.videoID, v.content, v.time, v.isActive, v.lessonID FROM tblVideo v JOIN tblLesson l ON v.lessonID = l.lessonID JOIN tblModule m ON l.moduleID = m.moduleID JOIN tblCourse c ON m.courseID = c.courseID WHERE c.courseID = ? ";
    
    public VideoDTO getLastestVideo() throws SQLException{
        VideoDTO video = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
            conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(LASTEST_VIDEO);
                rs=ptm.executeQuery();
                
                if(rs.next()){
                    int videoID = rs.getInt("videoID");
                    String content = rs.getString("content");
                    LocalTime time = rs.getTime("time").toLocalTime();
                    boolean isActive = rs.getBoolean("isActive");

                    video = new VideoDTO(videoID, content, time, isActive);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return video;
    }
    
    public VideoDTO getLastestVideoByCourseID(String courseID) throws SQLException{
        VideoDTO video = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_LASTEST_VIDEO_BY_COURSEID);
                ptm.setString(1, courseID);
                rs=ptm.executeQuery();
                if(rs.next()){
                    int videoID = rs.getInt("videoID");
                    String content = rs.getString("content");
                    LocalTime time = rs.getTime("time").toLocalTime();
                    boolean isActive = rs.getBoolean("isActive");
                    int lessonID = rs.getInt("lessonID");

                    video = new VideoDTO(videoID, content, time, isActive, lessonID);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return video;
    }
}

