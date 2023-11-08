/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import utils.DBUtil;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import userGoogle.UserGoogleDTO;

/**
 *
 * @author HOANG DUNG
 */
public class UserDAO {

    private static final String CHECK_ACCOUNT = "SELECT accountID, password, fullName, dateOfBirth, role, isActive, image, email\n"
            + "FROM tblAccount\n"
            + "WHERE accountID = ? OR email = ? ";
    private static final String SIGNUP = "INSERT tblAccount VALUES(?, ?, ?, ?, 'Customer', 1, '', ?)";
    private static final String LOGIN = "SELECT * FROM tblAccount WHERE accountID=? AND password=? ";
    private static final String LOGINBYGOOGLE = "SELECT role FROM tblAccount WHERE accountID=?";
    private static final String INSERTSTAFF = "INSERT INTO tblAccount VALUES (?,?,?,?,?,?,?,?)";
    private static final String INACTIVESTAFF = "UPDATE tblAccount SET isActive = 0  WHERE accountID = ?";
    private static final String UPDATESTAFF = "UPDATE tblAccount set password=?, fullName=?, dateOfBirth=?, isActive=?, image=?, email=? WHERE accountID=?";
    private static final String LOADSTAFF = "SELECT * FROM tblAccount WHERE role = 'Staff' AND isActive = 1";
    private static final String LOADUSER = "SELECT * FROM tblAccount";
    private static final String UPDATEUSER = "UPDATE tblAccount set fullName=?, dateOfBirth=?, email=? WHERE accountID=?";
    private static final String CHANGE_PASSWORD = "UPDATE tblAccount set password=? WHERE accountID=?";
    private static final String SEARCH_INSTRUCTOR = "SELECT * FROM tblAccount WHERE role = 'Instructor' and fullName = ?";
    private static final String INSTRUCTOR_LIST = "SELECT * FROM tblAccount WHERE role = 'Instructor'";
    private static final String CREATEACCOUNTGOOGLE = "INSERT INTO tblAccount(accountID,fullName,role,isActive,image) VALUES (?,?,?,?,?)";
    private static final String INSERT_INSTRUCTOR = "INSERT INTO tblAccount VALUES (?,?,?,?,?,?,?,?)";
    private static final String LOADCUSTOMER = "SELECT * FROM tblAccount WHERE role = 'Customer' and isActive = 1";
    private static final String GET_NUM_OF_CUSTOMER = "SELECT COUNT(accountID) AS numOfCustomer FROM tblAccount WHERE role = 'Customer'";
    private static final String GET_NUM_OF_ACTIVE_CUSTOMER = "SELECT COUNT(accountID) AS numOfCustomer FROM tblAccount WHERE role = 'Customer' AND isActive = 1";
    private static final String GET_CUSTOMER_LEARNING = "SELECT COUNT(accountID) AS customerLearning FROM tblLearningCourse";
    private static final String EDIT_INSTRUCTOR = "UPDATE tblAccount set fullName=?, dateOfBirth=?, image=?, email=? WHERE accountID=?";

    private static final String HIDE_INSTRUCTOR = "UPDATE tblAccount set isActive = 0 WHERE accountID =?";

    public UserDTO checkLogin(String userName, String password) throws SQLException {
        UserDTO user = null;

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userName);
                ptm.setString(2, password);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    Date dateOfBirth = rs.getDate("dateOfBirth");
                    String role = rs.getString("role");
                    Boolean isActive = rs.getBoolean("isActive");
                    String image = rs.getString("image");
                    String email = rs.getString("email");
                    user = new UserDTO(userName, password, fullName, dateOfBirth, role, isActive, image, email);
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

        return user;
    }

    public UserDTO checkLoginByGoogle(String userID) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGINBYGOOGLE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String role = rs.getString("role");
                    user = new UserDTO(userID, role);
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
        return user;
    }

    public UserDTO checkAccount(String emailSignup, String idSignup, String passwordSignup) {
        UserDTO u = null;
        try {
            Connection cn = DBUtil.getConnection();
            if (cn != null) {
                String sql = CHECK_ACCOUNT;
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, idSignup);
                pst.setString(2, emailSignup);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String accountID = rs.getString("accountID");
                        String password = rs.getString("password");
                        String email = rs.getString("email");

                        u = new UserDTO(accountID, password, email);
                    }
                    return u;
                }
            }
            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public UserDTO signUp(String emailSignup, String fullName, String dateOfBirth, String idSignup, String passwordSignup) {
        UserDTO u = null;
        try {
            Connection cn = DBUtil.getConnection();
            if (cn != null) {
                String sql = SIGNUP;
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, idSignup);
                pst.setString(2, passwordSignup);
                pst.setString(3, fullName);
                pst.setString(4, dateOfBirth);
                pst.setString(5, emailSignup);
                ResultSet rs = pst.executeQuery();
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insertStaff(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERTSTAFF);
                ptm.setString(1, user.getAccountID());
                ptm.setString(2, user.getPassword());
                ptm.setString(3, user.getFullName());
                ptm.setDate(4, user.getDateOfBirth());
                ptm.setString(5, user.getRole());
                ptm.setBoolean(6, user.isIsActive());
                ptm.setString(7, user.getImage());
                ptm.setString(8, user.getEmail());
                check = ptm.executeUpdate()>0;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    //just inactive
    public boolean deleteStaff(String accountID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INACTIVESTAFF);
                ptm.setString(1, accountID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateStaff(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATESTAFF);
                ptm.setString(1, user.getPassword());
                ptm.setString(2, user.getFullName());
                ptm.setDate(3, user.getDateOfBirth());
                ptm.setBoolean(4, user.isIsActive());
                ptm.setString(5, user.getImage());
                ptm.setString(6, user.getEmail());
                ptm.setString(7, user.getAccountID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<UserDTO> loadStaffList() throws SQLException {
        List<UserDTO> staffList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOADSTAFF);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    Date dateOfBirth = rs.getDate("dateOfBirth");
                    String role = rs.getString("role");
                    Boolean isActive = rs.getBoolean("isActive");
                    String image = rs.getString("image");
                    String email = rs.getString("email");

                    staffList.add(new UserDTO(accountID, password, fullName, dateOfBirth, role, isActive, image, email));
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
        return staffList;
    }

    public List<UserDTO> getInstructorList() throws SQLException {
        List<UserDTO> instructorList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSTRUCTOR_LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    Date dateOfBirth = rs.getDate("dateOfBirth");
                    String role = rs.getString("role");
                    Boolean isActive = rs.getBoolean("isActive");
                    String image = rs.getString("image");
                    String email = rs.getString("email");

                    instructorList.add(new UserDTO(accountID, password, fullName, dateOfBirth, role, isActive, image, email));
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
        return instructorList;
    }

    public boolean createAccGoogle(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATEACCOUNTGOOGLE);
                ptm.setString(1, user.getAccountID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getRole());
                ptm.setBoolean(4, true);
                ptm.setString(5, user.getImage());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertInstructor(UserDTO user) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_INSTRUCTOR);
                ptm.setString(1, user.getAccountID());
                ptm.setString(2, user.getPassword());
                ptm.setString(3, user.getFullName());
                ptm.setDate(4, user.getDateOfBirth());
                ptm.setString(5, user.getRole());
                ptm.setBoolean(6, user.isIsActive());
                ptm.setString(7, user.getImage());
                ptm.setString(8, user.getEmail());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateUser(String fullName, String dob, String email, String accountId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEUSER);
                ptm.setString(1, fullName);
                ptm.setString(2, dob);
                ptm.setString(3, email);
                ptm.setString(4, accountId);

                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<UserDTO> loadUserList() throws SQLException {
        List<UserDTO> userList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOADUSER);
                rs = ptm.executeQuery();
                while (rs.next()) {

                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    Date dateOfBirth = rs.getDate("dateOfBirth");

                    String image = rs.getString("image");
                    String email = rs.getString("email");

                    userList.add(new UserDTO(password, fullName, dateOfBirth, image, email));
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
        return userList;
    }

    public boolean changePassword(String accountId, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_PASSWORD);
                ptm.setString(1, password);
                ptm.setString(2, accountId);

                return ptm.executeUpdate() > 0;
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

    public boolean accountIsExist(String accountID) throws SQLException {
        boolean check = false;
        //
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        //
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT * FROM tblAccount WHERE accountID = ?");
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                if (rs != null) {
                    if (rs.next()) {
                        check = true;
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
            return check;

        }
    }

    public String getEmailByAccountID(String accountID) throws SQLException {
        String email = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        //
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement("SELECT * FROM tblAccount WHERE accountID = ?");
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                if (rs != null) {
                    if (rs.next()) {
                        email = rs.getString("email");
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
        return email;
    }

    public List<UserDTO> getListSearchInstructor(String search) {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        return list;
    }

    public List<UserDTO> loadCustomerList() throws SQLException {
        List<UserDTO> staffList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOADCUSTOMER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    Date dateOfBirth = rs.getDate("dateOfBirth");
                    String role = rs.getString("role");
                    Boolean isActive = rs.getBoolean("isActive");
                    String image = rs.getString("image");
                    String email = rs.getString("email");

                    staffList.add(new UserDTO(accountID, password, fullName, dateOfBirth, role, isActive, image, email));
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
        return staffList;
    }

    public int getNumberOfCustomer() throws SQLException {
        int num = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUM_OF_CUSTOMER);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    num = rs.getInt("numOfCustomer");
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
        return num;
    }

    public int getNumberOfActiveCustomer() throws SQLException {
        int num = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_NUM_OF_ACTIVE_CUSTOMER);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    num = rs.getInt("numOfCustomer");
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
        return num;
    }

    public int getCustomerLearning() throws SQLException {
        int num = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CUSTOMER_LEARNING);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    num = rs.getInt("customerLearning");
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
        return num;
    }
    public boolean updateInstructor(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EDIT_INSTRUCTOR);
                ptm.setString(1, user.getFullName());
                ptm.setDate(2, user.getDateOfBirth());
                ptm.setString(3, user.getImage());
                ptm.setString(4, user.getEmail());
                ptm.setString(5, user.getAccountID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean hideInstructor(String accountID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(HIDE_INSTRUCTOR);
                ptm.setString(1, accountID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
