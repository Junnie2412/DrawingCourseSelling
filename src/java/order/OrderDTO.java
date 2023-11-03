
package order;

import java.sql.Date;

/**
 *
 * @author TienToan
 */
public class OrderDTO {
    private String orderID;
    private String accountID;
    private Date date;
    private String voucherCode;
    private double total;
    private boolean isSuccess;

    public OrderDTO(String orderID, String accountID, Date date, String voucherCode, double total, boolean isSuccess) {
        this.orderID = orderID;
        this.accountID = accountID;
        this.date = date;
        this.voucherCode = voucherCode;
        this.total = total;
        this.isSuccess = isSuccess;
    }

    public OrderDTO() {
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(boolean isSuccess) {
        this.isSuccess = isSuccess;
    }
    
}
