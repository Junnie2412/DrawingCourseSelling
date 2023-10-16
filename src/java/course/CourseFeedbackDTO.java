
package course;

import java.sql.Date;

public class CourseFeedbackDTO {
    private int courseFeedbackID;
    private String feedback;
    private int rate;
    private Date date;
    private boolean isActive;
    private String courseID;
    private String accountID;

    public CourseFeedbackDTO() {
    }

    public CourseFeedbackDTO(int courseFeedbackID, String feedback, int rate, Date date, boolean isActive, String courseID, String accountID) {
        this.courseFeedbackID = courseFeedbackID;
        this.feedback = feedback;
        this.rate = rate;
        this.date = date;
        this.isActive = isActive;
        this.courseID = courseID;
        this.accountID = accountID;
    }

    public int getCourseFeedbackID() {
        return courseFeedbackID;
    }

    public void setCourseFeedbackID(int courseFeedbackID) {
        this.courseFeedbackID = courseFeedbackID;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    @Override
    public String toString() {
        return "CourseFeedbackDTO{" + "courseFeedbackID=" + courseFeedbackID + ", feedback=" + feedback + ", rate=" + rate + ", date=" + date + ", isActive=" + isActive + ", courseID=" + courseID + ", accountID=" + accountID + '}';
    }
    
    
}
