package course;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

/**
 *
 * @author TienToan
 */
public class CourseDAO {

    private static final String SEARCH_COURSE_NAME = "SELECT * FROM tblCourse WHERE name like ?";
    private static final String CREATE_VIDEO = "INSERT INTO tblVideo(content, time, isActive) VALUES(?,?,?)";
    private static final String CREATE_LESSON = "INSERT INTO tblLesson(title, description, videoID) VALUES(?,?,?)";
    private static final String CREATE_MODULE = "INSERT INTO tblModule(title,lessonID) VALUES(?,?)";
    private static final String CREATE_DESCRIPTION = "INSERT INTO tblDescription(content, target, image,type, level) VALUES(?,?,?,?,?)";
    private static final String CREATE_COURSE = "INSERT INTO tblCourse(courseID, price, name, duration, isActive, datePublic, accountID, descriptionID, moduleID) VALUES(?,?,?,?,?,?,?,?,?)";

    public List<CourseDTO> getlistCourse(String search) throws ClassNotFoundException, SQLException {
        List<CourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_COURSE_NAME);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String courseID = rs.getString("courseID");
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    int duration = rs.getInt("duration");
                    boolean isActive = rs.getBoolean("isActive");
                    Date datePublic = rs.getDate("datePublic");
                    String accountID = rs.getString("accountID");
                    int descriptionID = rs.getInt("descriptionID");
                    int moduleID = rs.getInt("moduleID");

                    list.add(new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID, moduleID));
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

    public boolean createVideo(String content, LocalTime time, boolean isActive) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_VIDEO);
                ptm.setString(1, content);
                ptm.setTime(2, Time.valueOf(time));
                ptm.setBoolean(3, isActive);

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

    public boolean createLesson(String title, String description) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_LESSON);
                ptm.setString(1, title);
                ptm.setString(2, description);

                VideoDAO videoDAO = new VideoDAO();
                VideoDTO video = videoDAO.getLastestVideo();

                ptm.setInt(3, video.getVideoID());

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

    public boolean createModule(String title) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_MODULE);
                ptm.setString(1, title);

                LessonDAO lessonDAO = new LessonDAO();
                LessonDTO lesson = lessonDAO.getLastestLesson();

                ptm.setInt(2, lesson.getLessonID());

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
    
    public boolean createDescription(String descriptionContent, String descriptionTarget, String descriptionImage, String descriptionType, String descriptionLevel) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_DESCRIPTION);
                ptm.setString(1, descriptionContent);
                ptm.setString(2, descriptionTarget);
                ptm.setString(3, descriptionImage);
                ptm.setString(4, descriptionType);
                ptm.setString(5, descriptionLevel);

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

    public boolean createCourse(String courseID, float coursePrice, String courseName, int courseDuration, boolean courseIsActive, String courseDatePublic,
                                String descriptionContent, String descriptionTarget, String descriptionImage, String descriptionType, String descriptionLevel,
                                String instructorID, String moduleTitle, String lessonTitle, String lessonDescription, String videoContent, LocalTime videoTime, boolean videoIsActive) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                boolean checkVideo = createVideo(videoContent, videoTime, videoIsActive);
                boolean checkLesson = createLesson(lessonTitle, lessonDescription);
                boolean checkModule = createModule(moduleTitle);
                boolean checkDescription = createDescription(descriptionContent, descriptionTarget, descriptionImage, descriptionType, descriptionLevel);
                if (checkVideo && checkLesson && checkModule && checkDescription) {
                    ptm = conn.prepareStatement(CREATE_COURSE);
                    ptm.setString(1, courseID);
                    ptm.setFloat(2,coursePrice);
                    ptm.setString(3,courseName);
                    ptm.setInt(4,courseDuration);
                    ptm.setBoolean(5,courseIsActive);
                    ptm.setDate(6,Date.valueOf(courseDatePublic));
                    ptm.setString(7,instructorID);
                    
                    DescriptionDAO descriptionDAO = new DescriptionDAO();
                    DescriptionDTO description = descriptionDAO.getLastestDescription();
                    
                    ptm.setInt(8,description.getDescriptionID());

                    ModuleDAO moduleDAO = new ModuleDAO();
                    ModuleDTO module = moduleDAO.getLastestModule();
                    ptm.setInt(9, module.getModuleID());

                    check = ptm.executeUpdate() > 0 ? true : false;
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

        return check;
    }
}
