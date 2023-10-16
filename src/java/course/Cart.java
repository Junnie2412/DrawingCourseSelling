/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package course;

import java.util.HashMap;
import java.util.Map;


/**
 *
 * @author HOANG DUNG
 */
public class Cart {
    private Map<String, CourseDTO> cart;

    public Cart() {

    }

    public Cart(Map<String, CourseDTO> cart) {
        this.cart = cart;
    }

    public Map<String, CourseDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, CourseDTO> cart) {
        this.cart = cart;
    }

    public boolean add(CourseDTO course) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            this.cart.put(course.getCourseID(), course);
            check = true;
        } catch (Exception e) {
        }

        return check;
    }

    public boolean remove(String id) {
        boolean check = false;

        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }

    public boolean edit(String id, CourseDTO course) {
        boolean check = false;

        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id,course);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
}
