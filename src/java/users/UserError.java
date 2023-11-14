
package users;

/**
 *
 * @author TienToan
 */
public class UserError {
    private String userIDError;
    private String fullNameError;
    private String roleIDError;
    private String emailError;
    private String passwordError;
    private String confirmError;
    private String dateError;

    public UserError() {
        this.userIDError = "";
        this.fullNameError = "";
        this.roleIDError = "";
        this.emailError = "";
        this.passwordError = "";
        this.confirmError = "";
        this.dateError="";
    }

    public UserError(String userIDError, String fullNameError, String roleIDError, String emailError , String passwordError,String confirmError,String dateError) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.roleIDError = roleIDError;
        this.emailError = emailError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.dateError = dateError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getDateError() {
        return dateError;
    }

    public void setDateError(String dateError) {
        this.dateError = dateError;
    }
    
}
