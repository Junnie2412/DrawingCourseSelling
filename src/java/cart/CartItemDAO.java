/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.sql.Connection;
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
public class CartItemDAO {
    private static final String ADD_CART_ITEM = "INSERT INTO tblCartItem(courseID, voucherID, cartID) VALUES(?,?,?)";
    private static final String REMOVE_CART_ITEM = "DELETE FROM tblCartItem WHERE cartItemID = ?";
    
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
   
    
    public boolean removeCartItem(int cartItemID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REMOVE_CART_ITEM);
                ptm.setInt(1, cartItemID);

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
}
