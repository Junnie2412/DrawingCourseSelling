/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class CartDAO {
    private static final String ADD_CART = "INSERT INTO tblCart(createdDay, accountID) VALUES(?,?)";
    private static final String LASTEST_CART = "SELECT TOP 1 * FROM tblCart ORDER BY cartID DESC";
    private static final String CHECK_CREATED_DAY_AND_USER = "SELECT * FROM tblCart WHERE createdDay = ? AND accountID =?";
    private static final String REMOVE_CART = "DELETE FROM tblCart WHERE cartItemID = ?";
    private static final String CHECK_ALREADY_ADD_COURSE = "SELECT * FROM tblCartItem ci join tblCart c on ci.cartID = c.cartID WHERE ci.courseID = ? AND accountID = ?";
    
    public boolean createCart(Date createdDay, String accountID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_CART);
                ptm.setDate(1, createdDay);
                ptm.setString(2, accountID);

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
    
    public CartDTO getLastestCart() throws SQLException{
        CartDTO cart= null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try{
            conn = DBUtil.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(LASTEST_CART);
                rs = ptm.executeQuery();
                if(rs.next()){
                    int cartID = rs.getInt("cartID");
                    Date createdDay = Date.valueOf(rs.getString("createdDay"));
                    String accountID = rs.getString("accountID");

                    cart= new CartDTO(cartID, createdDay, accountID);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return cart;
    }
    
    public boolean checkCreatedDayAndUser(Date createdDay, String accountID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_CREATED_DAY_AND_USER );
                ptm.setDate(1, createdDay);
                ptm.setString(2, accountID);
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
    
    public CartDTO getCart(Date createdDay, String accountID) throws SQLException {
        CartDTO cart= null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_CREATED_DAY_AND_USER);
                ptm.setDate(1, createdDay);
                ptm.setString(2, accountID);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    int cartID = rs.getInt("cartID");

                    cart= new CartDTO(cartID, createdDay, accountID);
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
        return cart;
    }
    
    public boolean checkAlreadyAdd(String courseID, String accountID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_ALREADY_ADD_COURSE);
                ptm.setString(1, courseID);
                ptm.setString(2, accountID);
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
    
    public boolean removeCart(int cartItemID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REMOVE_CART);
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
