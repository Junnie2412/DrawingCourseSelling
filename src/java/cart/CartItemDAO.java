/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import course.CourseDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class CartItemDAO {
    private static final String ADD_CART_ITEM = "INSERT INTO tblCartItem(courseID, voucherID, cartID) VALUES(?,?,?)";
    private static final String GET_LIST_ITEM = "SELECT * FROM tblCartItem ci JOIN tblCart c ON ci.cartID = c.cartID  WHERE c.accountID = ?";
    private static final String REMOVE_CART_ITEM = "DELETE tblCartItem FROM tblCartItem ci JOIN tblCart c ON c.cartID = ci.cartID WHERE c.accountID = ? AND ci.courseID = ?";
    
    private static final String GET_COURSE_FROM_CART_ITEM = "SELECT * FROM tblCourse WHERE courseID = ?";
    private static final String CHECK_EXISTED_ITEM ="SELECT * FROM tblCartItem ci JOIN tblCart c ON c.cartID = ci.cartID WHERE c.accountID = ? AND ci.courseID = ?"; 
   
    
    public boolean createCartItem(String courseID, int voucherID, int cartID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_CART_ITEM);
                ptm.setString(1, courseID);
                ptm.setInt(2, voucherID);
                ptm.setInt(3, cartID);

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
    
    public List<CartItemDTO> getlistCartItem(String accountID) throws ClassNotFoundException, SQLException {
        List<CartItemDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_ITEM);
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int cartItemID = rs.getInt("cartItemID");
                    String courseID = rs.getString("courseID");
                    int voucherID = rs.getInt("voucherID");
                    int cartID = rs.getInt("cartID");
                    
                    list.add(new CartItemDTO(cartItemID, courseID, voucherID, cartID));
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
   
    public CourseDTO getCourseFromCartItem(String courseID) throws ClassNotFoundException, SQLException {
        CourseDTO course = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_COURSE_FROM_CART_ITEM);
                ptm.setString(1, courseID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    int duration = rs.getInt("duration");
                    boolean isActive = rs.getBoolean("isActive");
                    Date datePublic = rs.getDate("datePublic");
                    String accountID = rs.getString("accountID");
                    int descriptionID = rs.getInt("descriptionID");

                    course = new CourseDTO(courseID, name, price, duration, isActive, datePublic, accountID, descriptionID);
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

        return course;
    }
    
    public boolean removeCartItem(String accountID, String courseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REMOVE_CART_ITEM);
                ptm.setString(1, accountID);
                ptm.setString(2, courseID);

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
    
    public boolean checkExistedItem(String accountID, String courseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EXISTED_ITEM);
                ptm.setString(1, accountID);
                ptm.setString(2, courseID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
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
}
