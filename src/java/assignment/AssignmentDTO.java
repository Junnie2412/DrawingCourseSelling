/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package assignment;

/**
 *
 * @author HOANG DUNG
 */
public class AssignmentDTO {
    private String assignmentID;
    private String topic;
    private String courseID;

    public AssignmentDTO() {
    }

    public AssignmentDTO(String assignmentID, String topic, String courseID) {
        this.assignmentID = assignmentID;
        this.topic = topic;
        this.courseID = courseID;
    }

    public String getAssignmentID() {
        return assignmentID;
    }

    public void setAssignmentID(String assignmentID) {
        this.assignmentID = assignmentID;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }
    
    
}
