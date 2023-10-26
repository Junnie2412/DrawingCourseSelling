
package order;

import java.sql.Date;

/**
 *
 * @author TienToan
 */
public class TransactionDTO {
    private String transactionID;
    private String bankName;
    private boolean status;
    private double amount;

    public TransactionDTO() {
    }

    public TransactionDTO(String transactionID, String bankName, boolean status, int amount) {
        this.transactionID = transactionID;
        this.bankName = bankName;
        this.status = status;
        this.amount = amount;
    }

    public String getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(String transactionID) {
        this.transactionID = transactionID;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
    
            
}
