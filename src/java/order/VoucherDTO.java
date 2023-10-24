/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Date;

/**
 *
 * @author HOANG DUNG
 */
public class VoucherDTO {
    private int voucherID;
    private float discountPercent;
    private String voucherCode;
    private Date createdDay;
    private Date expiredDay;

    public VoucherDTO(int voucherID, float discountPercent, String voucherCode, Date createdDay, Date expiredDay) {
        this.voucherID = voucherID;
        this.discountPercent = discountPercent;
        this.voucherCode = voucherCode;
        this.createdDay = createdDay;
        this.expiredDay = expiredDay;
    }

    public VoucherDTO() {
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public float getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(float discountPercent) {
        this.discountPercent = discountPercent;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public Date getCreatedDay() {
        return createdDay;
    }

    public void setCreatedDay(Date createdDay) {
        this.createdDay = createdDay;
    }

    public Date getExpiredDay() {
        return expiredDay;
    }

    public void setExpiredDay(Date expireDay) {
        this.expiredDay = expireDay;
    }
}
