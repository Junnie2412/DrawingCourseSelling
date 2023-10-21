package course;

import cart.Cart;
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
import users.UserDTO;
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

    private static final String GET_ACCOUNT_BY_COURSEID = "SELECT * FROM tblAccount WHERE accountID = (SELECT accountID FROM tblCourse WHERE courseID = ?)";
    private static final String GET_DESCRIPTION_BY_COURSEID = "SELECT * FROM tblDescription WHERE descriptionID = (SELECT descriptionID FROM tblCourse WHERE courseID = ?)";
    private static final String GET_ALL_COURSE = "SELECT * FROM tblCourse";
    private static final String FILTER_COURSE_BY_LEVEL = "SELECT * FROM tblCourse WHERE level = ?";
    private static final String FILTER_COURSE_BY_TYPE = "SELECT * FROM tblCourse WHERE type = ?";

    private static final String CHECK_EXISTED_COURSE = "SELECT * FROM tblCourse WHERE courseID = ?";
    private static final String LIST_UNAPPROVED_COURSE = "SELECT * FROM tblCOurse WHERE isActive = 1";

    private static final String GET_CART_BY_ACCOUNTID = "SELECT DISTINCT ci.courseID\n"
            + "FROM [dbo].[tblCart] c\n"
            + "INNER JOIN [dbo].[tblCartItem] ci ON c.cartItemID = ci.cartItemID\n"
            + "WHERE c.accountID = ?;";
    private static final String INSERT_ORDER = "INSERT INTO orders VALUES (?,?,?,?)";
    private static final String GET_ORDERID = "SELECT TOP 1 orderID FROM [tblOrder] ORDER BY orderID DESC";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO orderDetail VALUES (?,?,?,?,?,?)";

    private static final String GET_COURSE_BY_COURSEID = "SELECT courseID, price, name, duration, isActive, datePublic, accountID, descriptionID FROM tblCourse WHERE courseID = ? ";

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

                    list.add(new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID));
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
                    ptm.setFloat(2, coursePrice);
                    ptm.setString(3, courseName);
                    ptm.setInt(4, courseDuration);
                    ptm.setBoolean(5, courseIsActive);
                    ptm.setDate(6, Date.valueOf(courseDatePublic));
                    ptm.setString(7, instructorID);

                    DescriptionDAO descriptionDAO = new DescriptionDAO();
                    DescriptionDTO description = descriptionDAO.getLastestDescription();

                    ptm.setInt(8, description.getDescriptionID());

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

    public UserDTO getAccount(String courseID) throws SQLException {
        UserDTO instructor = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ACCOUNT_BY_COURSEID);
                ptm.setString(1, courseID);
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

                    instructor = new UserDTO(accountID, password, fullName, dateOfBirth, role, isActive, image, email);
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
        return instructor;
    }

    public DescriptionDTO getDescription(String courseID) throws SQLException {
        DescriptionDTO description = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_DESCRIPTION_BY_COURSEID);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    int descriptionID = rs.getInt("descriptionID");
                    String content = rs.getString("content");
                    String target = rs.getString("target");
                    String image = rs.getString("image");
                    String type = rs.getString("type");
                    String level = rs.getString("level");

                    description = new DescriptionDTO(descriptionID, content, target, image, type, level);
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
        return description;
    }

    public ArrayList<CourseDTO> getlistCourse() throws SQLException {
        ArrayList<CourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_COURSE);
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

                    list.add(new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID));
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

    public List<CourseDTO> filterCourseByLevel(String typeLevel) throws SQLException {
        List<CourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FILTER_COURSE_BY_LEVEL);
                ptm.setString(1, typeLevel);
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

                    list.add(new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID));
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

    public List<CourseDTO> filterCourseByType(String type) throws SQLException {
        List<CourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FILTER_COURSE_BY_TYPE);
                ptm.setString(1, type);
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

                    list.add(new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID));
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

    public List<CourseDTO> filterCourseByPrice(String PriceRange) throws SQLException {
        List<CourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FILTER_COURSE_BY_TYPE);
                ptm.setString(1, PriceRange);
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

                    list.add(new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID));
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

    public boolean checkExistedCourse(String courseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EXISTED_COURSE);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    check = true;
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

    public List<CourseDTO> getUnapprovedCoursesList() throws SQLException {
        List<CourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_UNAPPROVED_COURSE);
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

                    list.add(new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID));
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

    public CourseDTO getCourseByCourseID(String courseID) throws SQLException {
        CourseDTO c = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtil.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(GET_COURSE_BY_COURSEID);
                pst.setString(1, courseID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    int duration = rs.getInt("duration");
                    boolean isActive = rs.getBoolean("isActive");
                    Date datePublic = rs.getDate("datePublic");
                    String accountID = rs.getString("accountID");
                    int descriptionID = rs.getInt("descriptionID");

                    c = new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }

        return c;
    }

    public List<CourseDTO> getCart(String accountID) throws SQLException {
        List<CourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CART_BY_ACCOUNTID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String courseID = rs.getString("courseID");

                    if (getCourseByCourseID(courseID) != null) {
                        String name = rs.getString("name");
                        float price = rs.getFloat("price");
                        int duration = rs.getInt("duration");
                        boolean isActive = rs.getBoolean("isActive");
                        Date datePublic = rs.getDate("datePublic");
                        int descriptionID = rs.getInt("descriptionID");
                        list.add(new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID));

                    }
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

    public boolean inserOrder(UserDTO loginUser, Cart cart) throws SQLException {
        //voucher
        //payment
        //order
        //orderdetailed
        double total = 0;
        for (CourseDTO c : cart.getCart().values()) {
            total += c.getPrice();
        }
        boolean checkOrder = false;
        boolean check = false;
        
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        //
        //xu ly thanh toan
        try {
            //add orders table
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, date);
                ptm.setDouble(2, total);
                ptm.setBoolean(3, true);
                ptm.setString(4, loginUser.getAccountID());
                checkOrder = ptm.executeUpdate() > 0;
                //add orderDetail
                if (checkOrder) {
                    ptm = conn.prepareStatement(GET_ORDERID);
                    rs = ptm.executeQuery();
                    if (rs.next()) {
                        int orderID = rs.getInt("orderID");
                        for (CourseDTO course : cart.getCart().values()) {
                            ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                            ptm.setDouble(1, course.getPrice());
                            ptm.setString(2, "voucher"); //chua handle
                            ptm.setInt(3, 1);
                            ptm.setInt(4, orderID);
                            ptm.setString(5, course.getCourseID());
                            ptm.setInt(6, 1); //chua biet
                            ptm.executeUpdate();
                        }
                    }

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
