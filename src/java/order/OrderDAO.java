package order;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import course.CourseDAO;
import course.CourseDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

/**
 *
 * @author TienToan
 */
public class OrderDAO {

    private static final String GET_ALL_ORDER = "SELECT * FROM tblOrder ORDER BY dateOrder DESC";
    private static final String GET_BUY_COURSE_BY_ORDERID = "SELECT courseID FROM tblOrderDetail join tblOrder on tblOrderDetail.orderID = tblOrder.orderID where tblOrder.orderID = ?";
    private static final String GET_PAYMENT_INFOR_BY_ORDERID = "select paymentDetailID,amount,numTransaction,provider,[status],createdAt from tblPaymentDetail join tblOrder on tblPaymentDetail.orderID = tblOrder.orderID WHERE tblOrder.orderID = ?";
    private static final String GET_TOTAL_BY_MONTH = "SELECT SUM(total) as totalByMonth FROM tblOrder WHERE MONTH(dateOrder) = ?";

    //
    public List<OrderDTO> getAllOrder() throws SQLException {
        List<OrderDTO> listOrder = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_ORDER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String accountID = rs.getString("accountID");
                    Date date = rs.getDate("dateOrder");
                    String voucherCode = rs.getString("voucherCode");
                    double total = rs.getDouble("total");
                    boolean isSuccess = rs.getBoolean("isSuccess");
                    listOrder.add(new OrderDTO(orderID, accountID, date, voucherCode, total, isSuccess));
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
        return listOrder;
    }

    public List<CourseDTO> getCourseByOrderID(int orderID) throws SQLException {
        List<CourseDTO> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        CourseDAO dao = new CourseDAO();
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_BUY_COURSE_BY_ORDERID);
                ptm.setInt(1, orderID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String courseID = rs.getString("courseID");
                    list.add(dao.getCourseByCourseID(courseID));
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

    public PaymentDTO getPaymentInforByOrderID(int orderID) throws SQLException {
        PaymentDTO pay = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PAYMENT_INFOR_BY_ORDERID);
                ptm.setInt(1, orderID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String paymentDetailID = rs.getString("paymentDetailID");
                    float amount = rs.getFloat("amount");
                    String numTransaction = rs.getString("numTransaction");
                    String provider = rs.getString("provider");
                    boolean status = rs.getBoolean("status");
                    Date createdAt = rs.getDate("createdAt");
                    pay = new PaymentDTO(paymentDetailID, amount, numTransaction, orderID, provider, status, createdAt);
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
        return pay;
    }

    public ArrayList getTotalInAMonthFromJulyToDecember() throws SQLException {
        ArrayList listTotal = new ArrayList<>();
        PaymentDTO pay = null;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOTAL_BY_MONTH);
                for (int i = 7; i < 13; i++) {
                    ptm.setInt(1, i);
                    rs = ptm.executeQuery();
                    if (rs.next()) {
                        listTotal.add(rs.getFloat("totalByMonth"));
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
        return listTotal;
    }
}
