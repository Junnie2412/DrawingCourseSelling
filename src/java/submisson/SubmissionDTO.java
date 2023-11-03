/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package submisson;

/**
 *
 * @author HOANG DUNG
 */
public class SubmissionDTO {
    private int submissionID;
    private String accountID;
    private String assignmentID;
    private boolean isGraded;
    private boolean isPassed;
    private String instructorNote;
    private float grade;

    public SubmissionDTO() {
    }

    public SubmissionDTO(int submissionID, String accountID, String assignmentID, boolean isGraded, boolean isPassed, String instructorNote, float grade) {
        this.submissionID = submissionID;
        this.accountID = accountID;
        this.assignmentID = assignmentID;
        this.isGraded = isGraded;
        this.isPassed = isPassed;
        this.instructorNote = instructorNote;
        this.grade = grade;
    }

    public int getSubmissionID() {
        return submissionID;
    }

    public void setSubmissionID(int submissionID) {
        this.submissionID = submissionID;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getAssignmentID() {
        return assignmentID;
    }

    public void setAssignmentID(String assignmentID) {
        this.assignmentID = assignmentID;
    }

    public boolean isIsGraded() {
        return isGraded;
    }

    public void setIsGraded(boolean isGraded) {
        this.isGraded = isGraded;
    }

    public boolean isIsPassed() {
        return isPassed;
    }

    public void setIsPassed(boolean isPassed) {
        this.isPassed = isPassed;
    }

    public String getInstructorNote() {
        return instructorNote;
    }

    public void setInstructorNote(String instructorNote) {
        this.instructorNote = instructorNote;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }
    
    
}
