/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.sql.Date;

/**
 *
 * @author HOANG DUNG
 */
public class CartDTO {
    private int cartID;
    private Date createdDay;
    private String accountID;

    public CartDTO() {
    }

    public CartDTO(int cartID, Date createdDay, String accountID) {
        this.cartID = cartID;
        this.createdDay = createdDay;
        this.accountID = accountID;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public Date getCreatedDay() {
        return createdDay;
    }

    public void setCreatedDay(Date createdDay) {
        this.createdDay = createdDay;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    
}
