
package order;

import java.sql.Date;

/**
 *
 * @author TienToan
 */
public class PaymentDTO {
    private String paymentDetailID;
    private float amount;
    private String numTransaction;
    private int orderID;
    private String provider;
    private boolean status;
    private Date createdAt; 

    public PaymentDTO() {
    }

    public PaymentDTO(String paymentDetailID, float amount, String numTransaction, int orderID, String provider, boolean status, Date createdAt) {
        this.paymentDetailID = paymentDetailID;
        this.amount = amount;
        this.numTransaction = numTransaction;
        this.orderID = orderID;
        this.provider = provider;
        this.status = status;
        this.createdAt = createdAt;
    }

    public String getPaymentDetailID() {
        return paymentDetailID;
    }

    public void setPaymentDetailID(String paymentDetailID) {
        this.paymentDetailID = paymentDetailID;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getNumTransaction() {
        return numTransaction;
    }

    public void setNumTransaction(String numTransaction) {
        this.numTransaction = numTransaction;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    
}

