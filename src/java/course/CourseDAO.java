package course;

import cart.Cart;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import order.TransactionDTO;
import users.UserDTO;
import utils.DBUtil;

/**
 *
 * @author TienToan
 */
public class CourseDAO {

    private static final String SEARCH_COURSE_NAME = "SELECT * FROM tblCourse WHERE isActive = '1' AND name like ? ";
    private static final String CREATE_VIDEO = "INSERT INTO tblVideo(content, time, isActive, lessonID) VALUES(?,?,?,?)";
    private static final String CREATE_LESSON = "INSERT INTO tblLesson(title, description, moduleID) VALUES(?,?,?)";
    private static final String CREATE_MODULE = "INSERT INTO tblModule(title,courseID) VALUES(?,?)";
    private static final String CREATE_DESCRIPTION = "INSERT INTO tblDescription(content, target, image,type, level) VALUES(?,?,?,?,?)";
    private static final String CREATE_COURSE = "INSERT INTO tblCourse(courseID, price, name, duration, isActive, datePublic, accountID, descriptionID) VALUES(?,?,?,?,?,?,?,?)";

    private static final String GET_ACCOUNT_BY_COURSEID = "SELECT * FROM tblAccount WHERE accountID = (SELECT accountID FROM tblCourse WHERE courseID = ?)";
    private static final String GET_DESCRIPTION_BY_COURSEID = "SELECT * FROM tblDescription WHERE descriptionID = (SELECT descriptionID FROM tblCourse WHERE courseID = ?)";
    private static final String GET_ALL_COURSE_FOR_INSTRUCTOR = "SELECT * FROM tblCourse WHERE accountID = ?";
    private static final String GET_ALL_COURSE = "SELECT * FROM tblCourse WHERE isActive = '1'";
    private static final String FILTER_COURSE_BY_LEVEL = "SELECT c.* FROM tblCourse AS c JOIN tblDescription AS d ON c.descriptionID = d.descriptionID WHERE c.isActive = '1' AND d.level = ? ";
    private static final String FILTER_COURSE_BY_TYPE = "SELECT c.* FROM tblCourse AS c JOIN tblDescription AS d ON c.descriptionID = d.descriptionID WHERE c.isActive = '1' AND d.type = ? ";
    private static final String FILTER_COURSE_BY_PRICE_UNDER_300000 = "SELECT * FROM tblCourse WHERE isActive = '1' AND price <300000";
    private static final String FILTER_COURSE_BY_PRICE_ABOVE_300000 = "SELECT * FROM tblCourse WHERE isActive = '1' AND price >300000";

    private static final String CHECK_EXISTED_COURSE = "SELECT * FROM tblCourse WHERE courseID = ?";
    private static final String LIST_UNAPPROVED_COURSE = "SELECT * FROM tblCOurse WHERE isActive = 1";

    private static final String GET_CART_BY_ACCOUNTID = "SELECT DISTINCT ci.courseID\n"
            + "FROM [dbo].[tblCart] c\n"
            + "INNER JOIN [dbo].[tblCartItem] ci ON c.cartItemID = ci.cartItemID\n"
            + "WHERE c.accountID = ?;";
    private static final String INSERT_ORDER = "INSERT INTO tblOrder VALUES (?,?,?,?,?)";
    private static final String GET_ORDERID = "SELECT TOP 1 orderID FROM [tblOrder] ORDER BY orderID DESC";
    private static final String GET_PAYMENTID = "SELECT TOP 1 paymentDetailID FROM [tblPaymentDetail] ORDER BY paymentDetailID DESC";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO tblOrderDetail VALUES (?,?,?,?)";
    private static final String INSERT_PAYMENTDETAIL = "INSERT INTO tblPaymentDetail VALUES (?,?,?,?,?,?)";

    private static final String UPDATE_COURSE = "update tblCourse set price = ?, name = ?, duration = ?, datePublic = ? where courseID = ?";
    private static final String GET_COURSE_BY_COURSEID = "SELECT courseID, price, name, duration, isActive, datePublic, accountID, descriptionID FROM tblCourse WHERE courseID = ? ";
    private static final String GET_PROFIT = "select sum(total) as profit from tblOrder";
    private static final String GET_NUMORDER = "select count(orderID) as numOrder from tblOrder";
    private static final String GET_NUMOFCUSTOMERS = "select count(DISTINCT accountID) as numOfCustomers from tblOrder";
    
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

    public int createVideo(String content, LocalTime time, boolean isActive, int lessionId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_VIDEO, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, content);
                ptm.setTime(2, Time.valueOf(time));
                ptm.setBoolean(3, isActive);
                ptm.setInt(4, lessionId);
                int rowsAffected = ptm.executeUpdate();
                if (rowsAffected > 0) {
                    rs = ptm.getGeneratedKeys();
                    if (rs.next()) {
                        int id = rs.getInt(1);
                        return id;
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
        return -1;
    }

    public int createLesson(String title, String description, int moduleId) throws SQLException {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_LESSON, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, title);
                ptm.setString(2, description);
                ptm.setInt(3, moduleId);

                int rowsAffected = ptm.executeUpdate();
                if (rowsAffected > 0) {
                    rs = ptm.getGeneratedKeys();
                    if (rs.next()) {
                        int id = rs.getInt(1);
                        return id;
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
        return -1;
    }

    public int createModule(String title, String courseId) throws SQLException {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_MODULE, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, title);
                ptm.setString(2, courseId);

                int rowsAffected = ptm.executeUpdate();

                if (rowsAffected > 0) {
                    rs = ptm.getGeneratedKeys();
                    if (rs.next()) {
                        int id = rs.getInt(1);
                        return id;
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
        return -1;
    }

    public int createDescription(String descriptionContent, String descriptionTarget, String descriptionImage, String descriptionType, String descriptionLevel) throws SQLException {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_DESCRIPTION, Statement.RETURN_GENERATED_KEYS);//của java.sql trả về tất cả thông tin vừa tạo nếu không có thì chỉ trả về số dòng được tạo
                ptm.setString(1, descriptionContent);
                ptm.setString(2, descriptionTarget);
                ptm.setString(3, descriptionImage);
                ptm.setString(4, descriptionType);
                ptm.setString(5, descriptionLevel);

                int rowsAffected = ptm.executeUpdate();

                if (rowsAffected > 0) {
                    rs = ptm.getGeneratedKeys();
                    if (rs.next()) {
                        int id = rs.getInt(1);
                        return id;
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
        return -1;
    }

    public boolean createCourse(String courseID, float coursePrice, String courseName, int courseDuration, boolean courseIsActive, String courseDatePublic,
            String descriptionContent, String descriptionTarget, String descriptionImage, String descriptionType, String descriptionLevel,
            String instructorID) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                int descriptionID = createDescription(descriptionContent, descriptionTarget, descriptionImage, descriptionType, descriptionLevel);

                // Create course
                ptm = conn.prepareStatement(CREATE_COURSE, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, courseID);
                ptm.setFloat(2, coursePrice);
                ptm.setString(3, courseName);
                ptm.setInt(4, courseDuration);
                ptm.setBoolean(5, courseIsActive);
                ptm.setDate(6, Date.valueOf(courseDatePublic));
                ptm.setString(7, instructorID);
                ptm.setInt(8, descriptionID);

                return ptm.executeUpdate() >0;

               

               
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


     public ArrayList<CourseDTO> getlistCourseInstructor(String accountId) throws SQLException {
  
        ArrayList<CourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_COURSE_FOR_INSTRUCTOR);
                ptm.setString(1, accountId);
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
                if (PriceRange.contentEquals("Under-300000")) {
                    ptm = conn.prepareStatement(FILTER_COURSE_BY_PRICE_UNDER_300000);
                } else {
                    ptm = conn.prepareStatement(FILTER_COURSE_BY_PRICE_ABOVE_300000);
                }
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

    public boolean inserOrder(UserDTO loginUser, List<CourseDTO> Listcourse, TransactionDTO trans, int totalInt, String voucherCode) throws SQLException {
        //voucher
        //payment
        //order
        //orderdetailed
        double total = (double) totalInt;

        boolean checkOrder = false;
        boolean check = false;
        boolean check1 = false;
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
                ptm.setString(2, voucherCode);
                ptm.setDouble(3, total);
                ptm.setBoolean(4, true);
                ptm.setString(5, loginUser.getAccountID());
                checkOrder = ptm.executeUpdate() > 0;
                //add orderDetail
                if (checkOrder) {
                    ptm = conn.prepareStatement(GET_ORDERID);
                    rs = ptm.executeQuery();
                    if (rs.next()) {
                        int orderID = rs.getInt("orderID");
                        for (CourseDTO course : Listcourse) {
                            ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                            ptm.setDouble(1, course.getPrice());

                            ptm.setInt(2, 1);
                            ptm.setInt(3, orderID);
                            ptm.setString(4, course.getCourseID());
                            check = ptm.executeUpdate() > 0;
                        }
                    }
                    if (checkOrder) {
                        ptm = conn.prepareStatement(GET_ORDERID);
                        rs = ptm.executeQuery();
                        if (rs.next()) {
                            int orderID = rs.getInt("orderID");
                            ptm = conn.prepareStatement(INSERT_PAYMENTDETAIL);
                            ptm.setDouble(1, trans.getAmount());
                            ptm.setString(2, trans.getTransactionID());
                            ptm.setInt(3, orderID);
                            ptm.setString(4, trans.getBankName());
                            ptm.setBoolean(5, trans.isStatus());
                            ptm.setString(6, date);
                            check1 = ptm.executeUpdate() > 0;
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
        return (check && check1);
    }

    public boolean updateCourse(String courseId, float price, String name, int duration, String datePublic) throws SQLException {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtil.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(UPDATE_COURSE);
                pst.setFloat(1, price);
                pst.setString(2, name);
                pst.setInt(3, duration);
                pst.setString(4, datePublic);
                pst.setString(5, courseId);
                int rows = pst.executeUpdate();

                if (rows > 0) {
                    return true;
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

        return false;
    }

    public float getProfit() throws SQLException {
        float profit = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PROFIT);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    profit = rs.getFloat("profit");
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
        return profit;
    }
    public int getNumOrder() throws SQLException {
        int numOrder = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMORDER);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    numOrder = rs.getInt("numOrder");
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
        return numOrder;
    }
    public int getNumOfCustomers() throws SQLException {
        int numOfCustomers = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUMOFCUSTOMERS);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    numOfCustomers = rs.getInt("numOfCustomers");
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
        return numOfCustomers;
    }
}
