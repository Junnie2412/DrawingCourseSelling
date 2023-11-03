/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class VoucherDAO {

    private static final String CREATE_VOUCHER = "INSERT INTO tblVoucher(discountPercent, voucherCode, createdDay, expiredDay) VALUES(?,?,?,?)";
    private static final String CHECK_DUPLICATED_VOUCHER_CODE = "SELECT * FROM tblVoucher WHERE voucherCode = ?";
    private static final String CHECK_VOUCHER_CODE = "SELECT * FROM tblVoucher WHERE voucherCode = ?";
    private static final String UPDATE_VOUCHER = "UPDATE tblVoucher set discountPercent = ?, voucherCode = ?, createdDay = ?, expiredDay = ? where voucherID = ?";
    private static final String DELETE_VOUCHER = "DELETE FROM tblVoucher where voucherID = ?";

    public boolean createVoucher(float discountVoucher, String voucherCode, Date createdDay, Date expiredDay) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_VOUCHER);
                ptm.setFloat(1, discountVoucher);
                ptm.setString(2, voucherCode);
                ptm.setDate(3, createdDay);
                ptm.setDate(4, expiredDay);

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

    public boolean checkDuplicatedVoucherCode(String voucherCode) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATED_VOUCHER_CODE);
                ptm.setString(1, voucherCode);
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

    public int checkVoucherCodeExist(String voucherCode, float total) throws SQLException {
        int discount = 0;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_VOUCHER_CODE);
                ptm.setString(1, voucherCode);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    LocalDate curDate = LocalDate.now();
                    Date expired = rs.getDate("expiredDay");
                    // Convert the Date to a LocalDate
                    LocalDate dbDate = expired.toLocalDate();                
                    
                    // Compare curDate with expiredLocalDate
                    if (dbDate.isAfter(curDate)) {
                        // Voucher code is still valid
                        float percent = rs.getFloat("discountPercent");
                        discount = (int)(total * (percent/100));
                        return discount;
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
        return discount;
    }
    
    public boolean updateVoucher(int voucherID, float discountVoucher, String voucherCode, Date createdDay, Date expiredDay) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_VOUCHER);
                ptm.setFloat(1, discountVoucher);
                ptm.setString(2, voucherCode);
                ptm.setDate(3, createdDay);
                ptm.setDate(4, expiredDay);
                ptm.setInt(5, voucherID);

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
    
    public boolean deleteVoucher(int voucherID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_VOUCHER);
                ptm.setInt(1, voucherID);

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
