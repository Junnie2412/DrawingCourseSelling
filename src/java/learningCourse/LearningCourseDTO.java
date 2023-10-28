/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package learningCourse;

import java.sql.Date;

/**
 *
 * @author HOANG DUNG
 */
public class LearningCourseDTO {
    private int learningCourseID;
    private boolean isLearning;
    private Date expiredDay;
    private String courseID;
    private String accountID;

    public LearningCourseDTO() {
    }

    public LearningCourseDTO(int learningCourseID, boolean isLearning, Date expiredDay, String courseID, String accountID) {
        this.learningCourseID = learningCourseID;
        this.isLearning = isLearning;
        this.expiredDay = expiredDay;
        this.courseID = courseID;
        this.accountID = accountID;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public int getLearningCourseID() {
        return learningCourseID;
    }

    public void setLearningCourseID(int learningCourseID) {
        this.learningCourseID = learningCourseID;
    }

    public boolean isIsLearning() {
        return isLearning;
    }

    public void setIsLearning(boolean isLearning) {
        this.isLearning = isLearning;
    }

    public Date getExpiredDay() {
        return expiredDay;
    }

    public void setExpiredDay(Date expiredDay) {
        this.expiredDay = expiredDay;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }
    
}
