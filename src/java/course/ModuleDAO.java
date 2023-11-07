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
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class ModuleDAO {

    private static final String LASTEST_MODULE = "SELECT TOP 1 * FROM tblModule ORDER BY moduleID DESC";
    private static final String GET_LIST_LESSON = "SELECT * FROM tblLesson WHERE moduleID = ?";
    private static final String GET_VIDEO_BY_LESSONID = "SELECT * FROM tblVideo WHERE lessonID= ?";

    private static final String QUANTITY_OF_MODULES = "SELECT COUNT(moduleID) AS countModule FROM tblModule WHERE courseID = ? ";
    private static final String MODULE_OF_COURSE = "select * from tblModule where courseID = ?";
    private static final String CREATE_MODULE = "insert into tblModule(title, courseID) values (?,?)";
    
    public VideoDTO getVideo(int lessonID) throws SQLException {
        VideoDTO video = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_VIDEO_BY_LESSONID);
                ptm.setInt(1, lessonID);
                rs = ptm.executeQuery();
                if(rs.next()) {
                    int videoID = rs.getInt("videoID");
                    String content = rs.getString("content");
                    LocalTime time = rs.getTime("time").toLocalTime();
                    boolean isActive = rs.getBoolean("isActive");

                    video = new VideoDTO(videoID, content, time, isActive, lessonID);
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
        return video;
    }
    
    public List<LessonDTO> getLessonList(int moduleID) throws SQLException {
        List<LessonDTO> list = new ArrayList();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_LESSON);
                ptm.setInt(1, moduleID);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    int lessonID = rs.getInt("lessonID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");

                    list.add(new LessonDTO(lessonID, title, description, moduleID));
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
    
    public ModuleDTO getLastestModule() throws SQLException {
        ModuleDTO module = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LASTEST_MODULE);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int moduleID = rs.getInt("moduleID");
                    String title = rs.getString("title");
                    int lessonID = rs.getInt("lessonID");

                    module = new ModuleDTO(moduleID, title, lessonID);
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
        return module;
    }

    public int getQuantityOfModules(String courseID) throws SQLException {
        int countModule = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(QUANTITY_OF_MODULES);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    countModule = rs.getInt("countModule");
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
        return countModule;
    }

    public List<ModuleDTO> getModulesByCourseId(String courseId) throws SQLException, ClassNotFoundException {
        List<ModuleDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(MODULE_OF_COURSE);
                ptm.setString(1, courseId);

                rs = ptm.executeQuery();

                while (rs.next()) {
                    list.add(new ModuleDTO(rs.getInt(1), rs.getString(2)));
                }
            }
        } catch (SQLException e) {
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
    
    public boolean createModule(String title, String courseId) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_MODULE);
                ptm.setString(1, title);
                ptm.setString(2, courseId);

                int row = ptm.executeUpdate();
                
                if (row > 0) return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
           
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }
}
