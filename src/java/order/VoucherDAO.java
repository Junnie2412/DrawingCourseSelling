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
import utils.DBUtil;

/**
 *
 * @author HOANG DUNG
 */
public class VoucherDAO {
    private static final String CREATE_VOUCHER = "INSERT INTO tblVoucher(discountPercent, voucherCode, createdDay, expireDay, courseID) VALUES(?,?,?,?,?)";
    private static final String CHECK_DUPLICATED_VOUCHER_CODE ="SELECT * FROM tblVoucher WHERE voucherCode = ?";
   
    public boolean createVoucher(float discountVoucher, String voucherCode, Date createdDay, Date expiredDay, String courseID) throws SQLException{
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
                ptm.setString(5, courseID);

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
    
    public boolean checkDuplicatedVoucherCode(String voucherCode) throws SQLException{
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

                if(rs.next()) 
                    check=true;
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
