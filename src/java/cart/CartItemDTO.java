/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

/**
 *
 * @author HOANG DUNG
 */
public class CartItemDTO {
    private int cartItemID;
    private String courseID;
    private int voucherID;
    private int cartID;

    public CartItemDTO() {
    }

    public CartItemDTO(int cartItemID, String courseID, int voucherID, int cartID) {
        this.cartItemID = cartItemID;
        this.courseID = courseID;
        this.voucherID = voucherID;
        this.cartID = cartID;
    }

    public int getCartItemID() {
        return cartItemID;
    }

    public void setCartItemID(int cartItemID) {
        this.cartItemID = cartItemID;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

}
