/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

/**
 *
 * @author HOANG DUNG
 */
public class VoucherError {
    private String discountPercentError;
    private String voucherCodeError;
    private String expiredDayError;
    private String courseIDError;

    public VoucherError() {
        this.discountPercentError = "";
        this.voucherCodeError = "";
        this.expiredDayError = "";
        this.courseIDError = "";
    }

    public VoucherError(String discountPercentError, String voucherCodeError, String expiredDayError, String courseIDError) {
        this.discountPercentError = discountPercentError;
        this.voucherCodeError = voucherCodeError;
        this.expiredDayError = expiredDayError;
        this.courseIDError = courseIDError;
    }

    public String getDiscountPercentError() {
        return discountPercentError;
    }

    public void setDiscountPercentError(String discountPercentError) {
        this.discountPercentError = discountPercentError;
    }

    public String getVoucherCodeError() {
        return voucherCodeError;
    }

    public void setVoucherCodeError(String voucherCodeError) {
        this.voucherCodeError = voucherCodeError;
    }

    public String getExpiredDayError() {
        return expiredDayError;
    }

    public void setExpiredDayError(String expiredDayError) {
        this.expiredDayError = expiredDayError;
    }

    public String getCourseIDError() {
        return courseIDError;
    }

    public void setCourseIDError(String courseIDError) {
        this.courseIDError = courseIDError;
    }
    
}
