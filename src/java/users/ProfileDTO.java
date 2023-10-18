
package users;

public class ProfileDTO {
    private String profileID;
    private String achivement;
    private String portfolio;
    private String accountID;

    public ProfileDTO() {
    }

    public ProfileDTO(String profileID, String achivement, String portfolio, String accountID) {
        this.profileID = profileID;
        this.achivement = achivement;
        this.portfolio = portfolio;
        this.accountID = accountID;
    }

    public String getProfileID() {
        return profileID;
    }

    public void setProfileID(String profileID) {
        this.profileID = profileID;
    }

    public String getAchivement() {
        return achivement;
    }

    public void setAchivement(String achivement) {
        this.achivement = achivement;
    }

    public String getPortfolio() {
        return portfolio;
    }

    public void setPortfolio(String portfolio) {
        this.portfolio = portfolio;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    @Override
    public String toString() {
        return "ProfileDTO{" + "profileID=" + profileID + ", achivement=" + achivement + ", portfolio=" + portfolio + ", accountID=" + accountID + '}';
    }
    
    
}
