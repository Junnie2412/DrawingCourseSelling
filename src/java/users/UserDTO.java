/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.sql.Date;

/**
 *
 * @author HOANG DUNG
 */
public class UserDTO {
    private String accountID;
    private String password;
    private String fullName;
    private Date dateOfBirth;
    private String role;
    private boolean isActive;
    private String image;
    private String email;

    public UserDTO() {
        this.role="";
    }

    public UserDTO(String accountID, String role) {
        this.accountID = accountID;
        this.role = role;
    }

    public UserDTO(String accountID, String fullName, String role, String image) {
        this.accountID = accountID;
        this.fullName = fullName;
        this.role = role;
        this.image = image;
    }
    
    public UserDTO(String accountID, String password, String fullName, Date dateOfBirth, String role, boolean isActive, String image, String email) {
        this.accountID = accountID;
        this.password = password;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.role = role;
        this.isActive = isActive;
        this.image = image;
        this.email = email;
    }

    public UserDTO(String accountID, String password, String email) {
        this.accountID = accountID;
        this.password = password;
        this.email = email;
    }    

    public UserDTO(String accountID, String password, String fullName, Date dateOfBirth, String email) {
         this.accountID = accountID;
        this.password = password;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        
        this.email = email;//To change body of generated methods, choose Tools | Templates.
    }

    public UserDTO( String fullName, Date dateOfBirth, String email, String password) {
         
        
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
       
        this.email = email;
        this.password = password;
    }

    UserDTO(String password, String fullName, Date dateOfBirth, String image, String email) {
         
        this.password = password;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        
        
        this.image = image;
        this.email = email;
    }
    

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
