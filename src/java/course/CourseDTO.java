
package course;

import java.sql.Date;

/**
 *
 * @author TienToan
 */

public class CourseDTO extends DescriptionDTO{
    private String courseID;
    private String name;
    private float price;
    private int duration;
    private boolean isActive;
    private Date datePublic;
    private String accountID;
    private int descriptionID;
    private int moduleID;

    public CourseDTO() {
    }

    public CourseDTO(String courseID, String name, float price, int duration, boolean isActive, Date datePublic, String accountID, int descriptionID, int moduleID) {
        this.courseID = courseID;
        this.name = name;
        this.price = price;
        this.duration = duration;
        this.isActive = isActive;
        this.datePublic = datePublic;
        this.accountID = accountID;
        this.descriptionID = descriptionID;
        this.moduleID = moduleID;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Date getDatePublic() {
        return datePublic;
    }

    public void setDatePublic(Date datePublic) {
        this.datePublic = datePublic;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public int getDescriptionID() {
        return descriptionID;
    }

    public void setDescriptionID(int descriptionID) {
        this.descriptionID = descriptionID;
    }

    public int getModuleID() {
        return moduleID;
    }

    public void setModuleID(int moduleID) {
        this.moduleID = moduleID;
    }

    @Override
    public String toString() {
        return "CourseDTO{" + "courseID=" + courseID + ", name=" + name + ", price=" + price + ", duration=" + duration + ", isActive=" + isActive + ", datePublic=" + datePublic + ", accountID=" + accountID + ", descriptionID=" + descriptionID + ", moduleID=" + moduleID + '}';
    }
    
    
}

