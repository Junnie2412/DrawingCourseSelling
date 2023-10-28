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
public class LessonDAO {

    private static final String LASTEST_LESSON = "SELECT TOP 1 * FROM tblLesson ORDER BY lessonID DESC";
    private static final String GET_LESSON_BY_LESSONID = "SELECT * FROM tblLesson WHERE lessonID = ? ";
    private static final String TOTAL_LESSONS = "SELECT COUNT(tblLesson.lessonID) AS totalLessons FROM tblCourse JOIN tblModule ON tblCourse.courseID = tblModule.courseID JOIN tblLesson ON tblModule.moduleID = tblLesson.moduleID WHERE tblCourse.courseID = ? ";
    private static final String LESSON_OF_MODULE = "select * from tblLesson where moduleID = ?";
    private static final String CREATE_LESSON = "insert into tblLesson(title, description, moduleID) values(?,?,?)";

    public LessonDTO getLessonByLessonId(int lessonId) throws SQLException {
        LessonDTO lesson = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LESSON_BY_LESSONID);
                ptm.setInt(1, lessonId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int lessonID = rs.getInt("lessonID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int moduleID = rs.getInt("moduleID");
                    
                    lesson = new LessonDTO(lessonID, title, description, moduleID);
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
        return lesson;
    }
    
    public LessonDTO getLastestLesson() throws SQLException {
        LessonDTO lesson = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LASTEST_LESSON);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int lessonID = rs.getInt("lessonID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int videoID = rs.getInt("videoID");

                    lesson = new LessonDTO(lessonID, title, description, videoID);
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
        return lesson;
    }

    public int getTotalLessons(String courseID) throws SQLException {
        int totalLessons = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(TOTAL_LESSONS);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    totalLessons = rs.getInt("totalLessons");
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
        return totalLessons;
    }

    public List<LessonDTO> getLessonByModuleId(int moduleId) throws SQLException {
        List<LessonDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LESSON_OF_MODULE);
                ptm.setInt(1, moduleId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    LessonDTO lesson = new LessonDTO();
                    lesson.setLessonID(rs.getInt(1));
                    lesson.setTitle(rs.getString(2));
                    lesson.setDescription(rs.getString(3));
                    list.add(lesson);
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

    public boolean createLesson(String title, String description, int moduleId) throws SQLException {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_LESSON);
                ptm.setString(1, title);
                ptm.setString(2, description);
                ptm.setInt(3, moduleId);
                int row = ptm.executeUpdate();
                if  (row > 0) return true;
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
        return false;
    }
}
